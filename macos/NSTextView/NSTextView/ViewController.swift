//
//  ViewController.swift
//  NSTextView
//
//  Created by rhino Q on 07/09/2018.
//  Copyright © 2018 rhino Q. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    @IBOutlet var textVIew: MyTextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textVIew.string = "\u{E837}"
        textVIew.font = BulletPoint.font
        textVIew.delegate = textVIew
        
    }
}

