//
//  ViewController.swift
//  AutoLayout
//
//  Created by rhino Q on 07/09/2018.
//  Copyright © 2018 rhino Q. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var rightView: NSView!
    @IBOutlet weak var leftView: NSView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rightView.wantsLayer = true
        rightView.layer?.backgroundColor = NSColor.green.cgColor
        
        leftView.wantsLayer = true
        leftView.layer?.backgroundColor = NSColor.red.cgColor
        
//        let bottomLeftConstraint = NSLayoutConstraint(item: leftView, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1.0, constant: 0)
//        view.addConstraint(bottomLeftConstraint)
        
        let centerView = NSView(frame: NSRect(x: 100, y: 0, width: 65, height: 100))
        centerView.wantsLayer = true
        centerView.layer?.backgroundColor = NSColor.blue.cgColor
        
        let topCenterConstraint = NSLayoutConstraint(item: centerView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1.0, constant: 0)
        view.addConstraint(topCenterConstraint)
        
        view.addSubview(centerView)
        
    }
}

