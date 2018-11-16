//
//  ViewController.swift
//  realTimeFilter
//
//  Created by rhino Q on 16/11/2018.
//  Copyright © 2018 rhino Q. All rights reserved.
// https://blog.csdn.net/zhangao0086/article/details/39433519

import UIKit
import AVFoundation
import AssetsLibrary

class ViewController: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate, AVCaptureMetadataOutputObjectsDelegate {
    @IBOutlet weak var filterButtonsContainer: UIView!
    @IBOutlet weak var takePhotoButton: UIButton!
    
    
    /// VideoRecords
    @IBOutlet weak var recordsButton: UIButton!
    var assetWriter: AVAssetWriter?
    var assetWriterPixelBufferInput: AVAssetWriterInputPixelBufferAdaptor?
    var isWriting = false
    var currentSampleTime: CMTime?
    var currentVideoDimensions: CMVideoDimensions?
    var currentDeviceInput: AVCaptureDeviceInput?
    var currentDevice: AVCaptureDevice?
    ///
    
    var captureSession: AVCaptureSession!
    var previewLayer:CALayer!
    var ciImage: CIImage!
    
    // MARK: - make face
    //    var faceLayer: CALayer?
    var faceObject: [AVMetadataFaceObject]?
    
    
    var filter: CIFilter!
    lazy var context: CIContext = {
        let eaglContext = EAGLContext(api: .openGLES2)
        let options = [CIContextOption.workingColorSpace : NSNull()]
        return CIContext(eaglContext: eaglContext!, options: options)
    }()
    
    lazy var filterNames: [String] = {
        return ["CIColorInvert", "CIPhotoEffectMono", "CIPhotoEffectInstant", "CIPhotoEffectTransfer"]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        recordsButton.isEnabled = false
        takePhotoButton.isEnabled = false
        
        setupLayer()
        setupCaptureSession()
        filterButtonsContainer.isHidden = true
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        previewLayer.bounds.size = size
    }
    
    func movieURL() -> NSURL {
        let tempDir = NSTemporaryDirectory()
        let url = NSURL(fileURLWithPath: tempDir).appendingPathComponent("tmpMov.mov")
        return url! as NSURL
    }
    
    func checkForAndDeleteFile() {
        let fm = FileManager.default
        let url = movieURL()
        let exist = fm.fileExists(atPath: url.path!)
        
        if exist {
            print("Delete previous temporary files")
            do {
                try fm.removeItem(at: url as URL)
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }
    }
    
    func createWriter() {
        self.checkForAndDeleteFile()
        
        do {
            assetWriter = try AVAssetWriter(outputURL: movieURL() as URL, fileType: AVFileType.mov)
        } catch let error as NSError {
            print("Create writer failed")
            print(error.localizedDescription)
            return
        }
        
        let outputSettings = [
            AVVideoCodecKey : AVVideoCodecType.h264,
            AVVideoWidthKey : Int(currentVideoDimensions!.width),
            AVVideoHeightKey : Int(currentVideoDimensions!.height)
            ] as [String : Any]
        
        let assetWriterVideoInput = AVAssetWriterInput(mediaType: AVMediaType.video, outputSettings: outputSettings)
        assetWriterVideoInput.expectsMediaDataInRealTime = true
        assetWriterVideoInput.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 2.0)
        
        let sourcePixelBufferAttributesDictionary = [
            String(kCVPixelBufferPixelFormatTypeKey) : Int(kCVPixelFormatType_32BGRA),
            String(kCVPixelBufferWidthKey) : Int(currentVideoDimensions!.width),
            String(kCVPixelBufferHeightKey) : Int(currentVideoDimensions!.height),
            String(kCVPixelFormatOpenGLESCompatibility) : kCFBooleanTrue
            ] as [String : Any]
        
        assetWriterPixelBufferInput = AVAssetWriterInputPixelBufferAdaptor(assetWriterInput: assetWriterVideoInput,
                                                                           sourcePixelBufferAttributes: sourcePixelBufferAttributesDictionary)
        
        if assetWriter!.canAdd(assetWriterVideoInput) {
            assetWriter!.add(assetWriterVideoInput)
        } else {
            print("Cannot add input to video writer \(assetWriterVideoInput)")
        }
    }
    
    
    func setupLayer() {
        previewLayer = CALayer()
        // previewLayer.bounds = CGRectMake(0, 0, self.view.frame.size.height, self.view.frame.size.width)
        // previewLayer.position = CGPointMake(self.view.frame.size.width / 2.0, self.view.frame.size.height / 2.0)
        // previewLayer.setAffineTransform(CGAffineTransformMakeRotation(CGFloat(M_PI / 2.0)))
        previewLayer.bounds = view.bounds
        previewLayer.anchorPoint = CGPoint.zero
        self.view.layer.insertSublayer(previewLayer, at: 0)
    }
    
    func setupCaptureSession() {
        captureSession = AVCaptureSession()
        captureSession.beginConfiguration()
        captureSession.sessionPreset = .high
        
        self.currentDevice = AVCaptureDevice.default(for: .video)
        
        let deviceInput = try! AVCaptureDeviceInput(device: self.currentDevice!)
        if captureSession.canAddInput(deviceInput) {
            captureSession.addInput(deviceInput)
            self.currentDeviceInput = deviceInput
        }
        
        let dataOutput = AVCaptureVideoDataOutput()
        dataOutput.videoSettings = [kCVPixelBufferPixelFormatTypeKey as String : Int(kCVPixelFormatType_32BGRA)]
        dataOutput.alwaysDiscardsLateVideoFrames = true
        
        if captureSession.canAddOutput(dataOutput) {
            captureSession.addOutput(dataOutput)
        }
        
        dataOutput.setSampleBufferDelegate(self, queue: DispatchQueue(label: "VideoQueue"))
        
        let metadataOutput = AVCaptureMetadataOutput()
        metadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
        
        if captureSession.canAddOutput(metadataOutput) {
            captureSession.addOutput(metadataOutput)
            print(metadataOutput.availableMetadataObjectTypes)
            metadataOutput.metadataObjectTypes = [AVMetadataObject.ObjectType.face]
        }
        
        captureSession.commitConfiguration()
        
    }
    
    @IBAction func record(_ sender: UIButton) {
        if self.isWriting {
            self.isWriting = false
            self.assetWriterPixelBufferInput = nil
            self.recordsButton.isEnabled = false
            self.assetWriter?.finishWriting(completionHandler: {[unowned self] () -> Void in
                DispatchQueue.main.async {
                    print("Recording completed")
                    self.recordsButton.setTitle("processing...", for: .normal)
                }
                
                self.saveMovieToCameraRoll() {
                    DispatchQueue.main.async {
                        self.recordsButton.isEnabled = true
                        self.recordsButton.setTitle("start recoding", for: .normal)
                        //                        self.switchCameraButton.isEnabled = true
                    }
                }
            })
        } else {
            self.createWriter()
            self.recordsButton.setTitle("stop recoding", for: .normal)
            self.assetWriter?.startWriting()
            self.assetWriter?.startSession(atSourceTime: self.currentSampleTime!)
            self.isWriting = true
            //            self.switchCameraButton.isEnabled = false
        }
    }
    
    func saveMovieToCameraRoll(_ finishBlock: @escaping () -> Void) {
        ALAssetsLibrary().writeVideoAtPath(toSavedPhotosAlbum: movieURL() as URL!) { (url, error) in
            if let errorDescription = error?.localizedDescription {
                print("Write video error：\(errorDescription)")
            } else {
                self.checkForAndDeleteFile()
                print(" Successfully written to the video")
            }
            
            finishBlock()
        }
    }
    
    @IBAction func openCamera(_ sender: UIButton) {
        
        sender.isEnabled = false
        recordsButton.isEnabled = true
        takePhotoButton.isEnabled = true
        
        captureSession.startRunning()
        self.filterButtonsContainer.isHidden = false
    }
    
    @IBAction func applyFilter(_ sender: UIButton) {
        let filterName = filterNames[sender.tag]
        filter = CIFilter(name: filterName)
    }
    
    
    @IBAction func clickSwitchCameraButton(_ sender: UIButton) {

        guard let currentDeviceInput = self.currentDeviceInput else {
            return
        }
        
        captureSession.removeInput(currentDeviceInput)
        switch currentDevice!.position {
        case .back:
            currentDevice = captureDevice(postion: .front, anyDevice: false)
        case .front:
            currentDevice = captureDevice(postion: .back, anyDevice: false)
        case .unspecified:
            assert(false)
        }
        let input = try! AVCaptureDeviceInput(device: self.currentDevice!)
        if captureSession.canAddInput(input) {
            captureSession.addInput(input)
            
            self.currentDeviceInput = input
        }
        
        let animation = CATransition()
        animation.duration = 0.25
        animation.subtype = CATransitionSubtype.fromLeft
        animation.type = CATransitionType.fade
        self.view.layer.add(animation, forKey: nil)
        faceObject = nil
    }
    
    func captureDevice(postion: AVCaptureDevice.Position = .front, anyDevice :Bool = true) -> AVCaptureDevice{
        let captureDevices = AVCaptureDevice.devices(for: .video)
        var device = captureDevices.first
        
        if anyDevice {
            return device!
        }
        
        for captureDevice in captureDevices {
            if captureDevice.position == postion{
                device = captureDevice
                break
            }
        }
        return device!;
    }
    
    @IBAction func takePicture(_ sender: UIButton) {
        sender.isEnabled = false
        captureSession.stopRunning()
        
        let cgImage = context.createCGImage(ciImage, from: ciImage.extent)
        ALAssetsLibrary().writeImage(toSavedPhotosAlbum: cgImage, metadata: ciImage.properties) { (url, error) in
            if error == nil {
                print("Successfully saved")
                print(url!)
            } else {
                let alert = UIAlertController(title: "error", message: error?.localizedDescription, preferredStyle: .alert)
                self.present(alert, animated: true, completion: nil)
            }
            self.captureSession.startRunning()
            sender.isEnabled = true
        }
    }
    
    func  makeFaceWithCIImage(inputImage: CIImage, faceObjects: [AVMetadataFaceObject]) -> CIImage {
        var maskImage: CIImage!
        let filter = CIFilter(name: "CIPixellate")!
        filter.setValue(inputImage, forKey: kCIInputImageKey)
        filter.setValue(max(inputImage.extent.size.width, inputImage.extent.size.height) / 60, forKey: kCIInputScaleKey)

        let fullPixellatedImage = filter.outputImage
        
        for faceObject in faceObjects {

            let faceBounds = faceObject.bounds
            
            
            let centerX = inputImage.extent.size.width * (faceBounds.origin.x + faceBounds.size.width / 2)
            let centerY = inputImage.extent.size.height * (1 - faceBounds.origin.y - faceBounds.size.height / 2)
            let radius = faceBounds.size.width * inputImage.extent.size.width / 2
            let radialGradient = CIFilter(name: "CIRadialGradient",
                                          parameters: [
                                            "inputRadius0" : radius,
                                            "inputRadius1" : radius + 1,
                                            "inputColor0" : CIColor(red: 0, green: 1, blue: 0, alpha: 1),
                                            "inputColor1" : CIColor(red: 0, green: 0, blue: 0, alpha: 0),
                                            kCIInputCenterKey : CIVector(x: centerX, y: centerY)
                ])!
            
            let radialGradientOutputImage = radialGradient.outputImage!.cropped(to: inputImage.extent)
            if maskImage == nil {
                maskImage = radialGradientOutputImage
            } else {
                print(radialGradientOutputImage)
                maskImage = CIFilter(name: "CISourceOverCompositing",
                                     parameters: [
                                        kCIInputImageKey : radialGradientOutputImage,
                                        kCIInputBackgroundImageKey : maskImage
                    ])!.outputImage
            }
        }
        
        let blendFilter = CIFilter(name: "CIBlendWithMask")!
        blendFilter.setValue(fullPixellatedImage, forKey: kCIInputImageKey)
        blendFilter.setValue(inputImage, forKey: kCIInputBackgroundImageKey)
        blendFilter.setValue(maskImage, forKey: kCIInputMaskImageKey)
        
        return blendFilter.outputImage!
    }
    
    // MARK: - AVCaptureVideoDataOutputSampleBufferDelegate
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        autoreleasepool {
            let imageBuffer = CMSampleBufferGetImageBuffer(sampleBuffer)!
            
            //        CVPixelBufferLockBaseAddress(imageBuffer, .readOnly)
            //
            //        let width = CVPixelBufferGetWidthOfPlane(imageBuffer, 0)
            //        let height = CVPixelBufferGetWidthOfPlane(imageBuffer, 0)
            //        let bytesPerRow = CVPixelBufferGetBytesPerRowOfPlane(imageBuffer, 0)
            //        let lumaBuffer = CVPixelBufferGetBaseAddressOfPlane(imageBuffer, 0)
            //
            //        let grayColorSpace = CGColorSpaceCreateDeviceGray()
            //        let context = CGContext(data: lumaBuffer, width: width, height: height, bitsPerComponent: 8, bytesPerRow: bytesPerRow, space: grayColorSpace, bitmapInfo: 0)!
            //        let cgImage = context.makeImage()
            
            var outputImage = CIImage(cvImageBuffer: imageBuffer)
            
            if self.filter != nil {
                self.filter.setValue(outputImage, forKey: kCIInputImageKey)
                outputImage = self.filter.outputImage!
            }
            
            if self.faceObject != nil {
                outputImage = self.makeFaceWithCIImage(inputImage: outputImage, faceObjects: self.faceObject!)
            }
            
            // Recording video processing
            let formatDescription = CMSampleBufferGetFormatDescription(sampleBuffer)!
            self.currentVideoDimensions = CMVideoFormatDescriptionGetDimensions(formatDescription)
            self.currentSampleTime = CMSampleBufferGetOutputPresentationTimeStamp(sampleBuffer)
            
            if self.isWriting {
                if self.assetWriterPixelBufferInput?.assetWriterInput.isReadyForMoreMediaData == true {
                    var newPixelBuffer: CVPixelBuffer? = nil
                    
                    CVPixelBufferPoolCreatePixelBuffer(nil, self.assetWriterPixelBufferInput!.pixelBufferPool!, &newPixelBuffer)
                    
                    self.context.render(outputImage, to: newPixelBuffer!, bounds: outputImage.extent, colorSpace: nil)
                    
                    let success = self.assetWriterPixelBufferInput?.append(newPixelBuffer!, withPresentationTime: self.currentSampleTime!)
                    
                    if success == false {
                        print("Pixel Buffer No additional success")
                    }
                }
            }
            
            
            let orientation = UIDevice.current.orientation
            var t: CGAffineTransform!
            if orientation == UIDeviceOrientation.portrait {
                t = CGAffineTransform(rotationAngle: -CGFloat.pi / 2.0)
            } else if orientation == UIDeviceOrientation.portraitUpsideDown {
                t = CGAffineTransform(rotationAngle: CGFloat.pi / 2.0)
            } else if (orientation == UIDeviceOrientation.landscapeRight) {
                t = CGAffineTransform(rotationAngle: CGFloat.pi)
            } else {
                t = CGAffineTransform(rotationAngle: 0)
            }
            outputImage = outputImage.transformed(by: t)
            
            let cgImage = self.context.createCGImage(outputImage, from: outputImage.extent)
            self.ciImage = outputImage
            
            DispatchQueue.main.async {
                self.previewLayer.contents = cgImage
            }
        }
    }
    
    // MARK: - AVCaptureMetadataOutputObjectsDelegate
    
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        // print(metadataObjects)
        if metadataObjects.count > 0 {
            // The first face recognized
            faceObject = metadataObjects as? [AVMetadataFaceObject]
            /*
            if faceLayer == nil {
                faceLayer = CALayer()
                faceLayer?.borderColor = UIColor.red.cgColor
                faceLayer?.borderWidth = 1
                view.layer.addSublayer(faceLayer!)
            }
            let faceBounds = faceObject!.bounds
            let viewSize = view.bounds.size
            
            faceLayer?.position = CGPoint(x: viewSize.width * (1 - faceBounds.origin.y - faceBounds.size.height / 2),
                                          y: viewSize.height * (faceBounds.origin.x + faceBounds.size.width / 2))
            
            faceLayer?.bounds.size = CGSize(width: faceBounds.size.height * viewSize.width,
                                            height: faceBounds.size.width * viewSize.height)
            print(faceBounds.origin)
            print("###")
            print(faceLayer!.position)
            print("###")
            print(faceLayer!.bounds)
            */
        }
        else{
            faceObject = nil
        }
    }
}

