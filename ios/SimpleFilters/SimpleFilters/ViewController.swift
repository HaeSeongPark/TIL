//
//  ViewController.swift
//  SimpleFilters
//
//  Created by rhino Q on 15/11/2018.
//  Copyright © 2018 rhino Q. All rights reserved.
//  https://blog.csdn.net/zhangao0086/article/details/39012231

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    lazy var originalImage:UIImage = {
       return UIImage(named: "Image")!
    }()
    
    lazy var context: CIContext = {
       return CIContext(options: nil)
    }()
    
    var filter: CIFilter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageSetUp()
    }
    
    func imageSetUp() {
        self.imageView.layer.shadowOpacity = 0.8
        self.imageView.layer.shadowColor = UIColor.black.cgColor
        self.imageView.layer.shadowOffset = CGSize(width: 1, height: 1)
        showOriginalImage(nil)
        printFilters()
    }
    @IBAction func showOriginalImage(_ sender: UIButton?) {
        self.imageView.image = originalImage
    }
    
    func printFilters() {
        let filterNames = CIFilter.filterNames(inCategory: kCICategoryBlur)
        print(filterNames.count)
        print(filterNames)
        for filterName in filterNames {
            let filter = CIFilter(name: filterName)!
            let attributes = filter.attributes
            print(attributes)
        }
    }
    
    func outputImage() {
        print(filter)
        let inputImage = CIImage(image: originalImage)
        filter.setValue(inputImage, forKey: kCIInputImageKey)
        let outputImage = filter.outputImage!
        if let cgImage = context.createCGImage(outputImage, from: outputImage.extent) {
            self.imageView.image = UIImage(cgImage: cgImage)
        }
    }
    
    @IBAction func autoAdjust(_ sender: UIButton) {
        var inputImage = CIImage(image: originalImage)!
        let fillters = inputImage.autoAdjustmentFilters(options: nil)
        for filter in fillters {
            filter.setValue(inputImage, forKey: kCIInputImageKey)
            inputImage = filter.outputImage!
        }
        
        if let cgImage = context.createCGImage(inputImage, from: inputImage.extent) {
            self.imageView.image = UIImage(cgImage: cgImage)
        }
    }
    @IBAction func photoEffectInstant(_ sender: UIButton) {
        filter = CIFilter(name: "CIPhotoEffectInstant")
        outputImage()
    }
    
    @IBAction func photoEffectTonal(_ sender: UIButton) {
        filter = CIFilter(name: "CIPhotoEffectTonal")
        outputImage()
    }
}

