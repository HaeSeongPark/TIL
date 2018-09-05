//
//  ViewController.swift
//  CoreAnimation
//
//  Created by rhino Q on 05/09/2018.
//  Copyright © 2018 rhino Q. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    var transformLayer: CALayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.wantsLayer = true
        transformLayer = CALayer()
        transformLayer.frame = view.bounds.insetBy(dx: 50, dy: 50)
        transformLayer.backgroundColor = NSColor.red.cgColor
        view.layer?.addSublayer(transformLayer)
    }
    
    @IBAction func leftClick(_ sender: NSButton) {
        setAngle(degress: 45)
    }
    
    @IBAction func rightClick(_ sender: NSButton) {
        setAngle(degress: -45)
    }
    
    func setAngle(degress:CGFloat) {
        let radians = CGFloat(Double.pi) * degress / 180.0
        var transform = CATransform3DIdentity
        transform.m34 = 1 / 250 // negative left, positive right
        transform = CATransform3DRotate(transform, radians, 0, 1, 0)
        transformLayer.transform = transform
    }
}

