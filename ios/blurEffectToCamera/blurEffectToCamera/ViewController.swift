//
//  ViewController.swift
//  blurEffectToCamera
//
//  Created by rhino Q on 14/11/2018.
//  Copyright © 2018 rhino Q. All rights reserved.
// http://prabhu.xyz/2017/05/07/adding-blur-effect-to-a-camera-session.html
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    let sesstion: AVCaptureSession = AVCaptureSession()
    var slider:UISlider!
    var blurView:UIVisualEffectView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUp()
        addBlurView()
        addSlider()
    }
    
    func addSlider() {
        slider = UISlider(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 20))
        slider.center = self.view.center
        slider.minimumValue = 0
        slider.maximumValue = 1
        slider.value = 1
        slider.tintColor = .cyan
        slider.thumbTintColor = .red
        slider.isContinuous = true
        slider.addTarget(self, action: #selector(sliderInAction(sender:)), for: .valueChanged)
        self.view.addSubview(slider)
    }
    
    @objc func sliderInAction(sender: UISlider) {
        blurView.alpha = CGFloat(sender.value)
    }
    
    func setUp() {
        sesstion.sessionPreset = AVCaptureSession.Preset.high
        if let device = AVCaptureDevice.default(for: .video) {
            do {
                try sesstion.addInput(AVCaptureDeviceInput(device: device))
            } catch {
                print(error.localizedDescription)
            }
            
            let previewLayer = AVCaptureVideoPreviewLayer(session: sesstion)
            
            self.view.layer.addSublayer(previewLayer)
            previewLayer.frame = self.view.layer.bounds
            
            sesstion.startRunning()
        }
    }
    
    func addBlurView() {
        let blur = UIBlurEffect(style: .light)
        blurView = UIVisualEffectView(effect: blur)
        blurView.frame = self.view.bounds
        blurView.alpha = 1.0
        blurView.frame = CGRect(x: self.view.bounds.minX, y: self.view.bounds.minY, width: self.view.bounds.width / 2, height: self.view.bounds.height / 2)
        blurView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.view.addSubview(blurView)
    }
}

