//
//  ViewController.swift
//  ComplexFilters
//
//  Created by rhino Q on 15/11/2018.
//  Copyright © 2018 rhino Q. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var slider: UISlider!
    
    lazy var originalImage: UIImage = {
        return UIImage(named: "Image")!
    }()
    
    lazy var context: CIContext = {
        return CIContext(options: nil)
    }()
    
    var filter: CIFilter!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        imageSetUp()
        sliderSetUp()
        initImage()
        printFilters()
    }
    
    func imageSetUp()
    {
        self.imageView.layer.shadowOpacity = 0.8
        self.imageView.layer.shadowColor = UIColor.black.cgColor
        self.imageView.layer.shadowOffset = CGSize(width: 1, height: 1)
    }
    
    func initImage()
    {
        let inputImage = CIImage(image: originalImage)
        filter = CIFilter(name: "CIHueAdjust")
        filter.setValue(inputImage, forKey: kCIInputImageKey)
        slider.sendActions(for: .valueChanged)
    }
    
    func sliderSetUp()
    {
        slider.maximumValue = Float.pi
        slider.minimumValue = -Float.pi
        slider.value = 0
        slider.addTarget(self, action: #selector(sliderValueChanged), for:  .valueChanged)
    }
    
    @objc func sliderValueChanged()
    {
        print(slider.value)
        filter.setValue(slider.value, forKey: kCIInputAngleKey)
        let outputImage = filter.outputImage!
        
        if let cgImage = context.createCGImage(outputImage, from: outputImage.extent)
        {
            imageView.image = UIImage(cgImage: cgImage)
        }
        
    }
    
    
    func printFilters()
    {
        let filterNames = CIFilter.filterNames(inCategory: kCICategoryBuiltIn)
        print(filterNames.count)
        print(filterNames)
        for filterName in filterNames
        {
            let filter = CIFilter(name: filterName)!
            let attributes = filter.attributes
            print(attributes)
        }
    }
    
    @IBAction func oldFilmEffect(_ sender: UIButton)
    {
        let inputImage = CIImage(image: originalImage)!
        
        // 1. create a CISepiaTone filter
        let sepiaToneFilter = CIFilter(name: "CISepiaTone")!
        sepiaToneFilter.setValue(inputImage, forKey: kCIInputImageKey)
        sepiaToneFilter.setValue(1, forKey: kCIInputIntensityKey)
        
        // 2 Create a white map filter
        let whiteSpecksFilter = CIFilter(name: "CIColorMatrix")!
        whiteSpecksFilter.setValue(CIFilter(name: "CIRandomGenerator")!.outputImage!.cropped(to: inputImage.extent), forKey: kCIInputImageKey)
        whiteSpecksFilter.setValue(CIVector(x: 0, y: 1, z: 0, w: 0), forKey: "inputRVector")
        whiteSpecksFilter.setValue(CIVector(x: 0, y: 1, z: 0, w: 0), forKey: "inputGVector")
        whiteSpecksFilter.setValue(CIVector(x: 0, y: 1, z: 0, w: 0), forKey: "inputBVector")
        whiteSpecksFilter.setValue(CIVector(x: 0, y: 0, z: 0, w: 0), forKey: "inputBiasVector")
        
        // 3. Combine the CISepiaToneFilter and whitebandFilter with source over
        let sourceOverCompositingFilter = CIFilter(name: "CISourceOverCompositing")!
        sourceOverCompositingFilter.setValue(whiteSpecksFilter.outputImage, forKey: kCIInputBackgroundImageKey)
        sourceOverCompositingFilter.setValue(sepiaToneFilter.outputImage, forKey: kCIInputImageKey)
        
        // 4.Handling random noise maps with CIAffineTransform filter
        let affineTransformFilter = CIFilter(name: "CIAffineTransform")!
        affineTransformFilter.setValue(CIFilter(name: "CIRandomGenerator")!.outputImage!.cropped(to: inputImage.extent), forKey: kCIInputImageKey)
        affineTransformFilter.setValue(NSValue(cgAffineTransform: CGAffineTransform(scaleX: 1.5, y: 25)), forKey: kCIInputTransformKey)
        
        // 5.Create a blue-green matte map filter
        let darkScratchesFilter = CIFilter(name: "CIColorMatrix")!
        darkScratchesFilter.setValue(affineTransformFilter.outputImage, forKey: kCIInputImageKey)
        darkScratchesFilter.setValue(CIVector(x: 4, y: 0, z: 0, w: 0), forKey: "inputRVector")
        darkScratchesFilter.setValue(CIVector(x: 0, y: 0, z: 0, w: 0), forKey: "inputGVector")
        darkScratchesFilter.setValue(CIVector(x: 0, y: 0, z: 0, w: 0), forKey: "inputBVector")
        darkScratchesFilter.setValue(CIVector(x: 0, y: 0, z: 0, w: 0), forKey: "inputAVector")
        darkScratchesFilter.setValue(CIVector(x: 0, y: 1, z: 1, w: 1), forKey: "inputBiasVector")
        
        // 6.Use the CIMinimumComponent filter to process the blue-green matte filter into a black matte filter
        let minimumComponentFilter = CIFilter(name: "CIMinimumComponent")!
        minimumComponentFilter.setValue(darkScratchesFilter.outputImage, forKey: kCIInputImageKey)

        
        // 7.Finally combined
        let multiplyCompositingFilter = CIFilter(name: "CIMultiplyCompositing")!
        multiplyCompositingFilter.setValue(minimumComponentFilter.outputImage, forKey: kCIInputBackgroundImageKey)
        multiplyCompositingFilter.setValue(sourceOverCompositingFilter.outputImage, forKey: kCIInputImageKey)
        
        // 8.Final output
        let outputImage = multiplyCompositingFilter.outputImage!
        if let cgImage = context.createCGImage(outputImage, from: outputImage.extent) {
            imageView.image = UIImage(cgImage: cgImage)
        }
    }
    
    @IBAction func showOriginalImage(_ sender: UIButton) {
        self.imageView.image = originalImage
    }
    
    
    @IBAction func colorInvert(_ sender: UIButton) {
        let colorInvertFilter = CIColorInvert()
        colorInvertFilter.inputImage = CIImage(image:imageView.image!)
        
        if let outputImage = colorInvertFilter.outputImage,
            let cgImage = context.createCGImage(outputImage, from: outputImage.extent) {
            imageView.image = UIImage(cgImage: cgImage)
        }
    }
    
    @IBAction func replaceBackground(_ sender: Any) {
        let cubeMap = createCubeMap(60, 90)
        let data = NSData(bytesNoCopy: cubeMap.data, length: Int(cubeMap.length), freeWhenDone: true)
        let colorCubeFilter = CIFilter(name: "CIColorCube")!
        
        colorCubeFilter.setValue(cubeMap.dimension, forKey: "inputCubeDimension")
        colorCubeFilter.setValue(data, forKey: "inputCubeData")
        colorCubeFilter.setValue(CIImage(image: imageView.image!), forKey: kCIInputImageKey)
        var outputImage = colorCubeFilter.outputImage!
        
        let sourceOverCompositingFilter = CIFilter(name: "CISourceOverCompositing")!
        sourceOverCompositingFilter.setValue(outputImage, forKey: kCIInputImageKey)
        sourceOverCompositingFilter.setValue(CIImage(image: UIImage(named: "background")!), forKey: kCIInputBackgroundImageKey)
        
        outputImage = sourceOverCompositingFilter.outputImage!
        if let cgImage = context.createCGImage(outputImage, from: outputImage.extent) {
            imageView.image = UIImage(cgImage: cgImage)
        }
    }
    
    @IBAction func showImage2(_ sender: Any) {
        self.imageView.image = UIImage(named: "Image2")
    }
    
}

