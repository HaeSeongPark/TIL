//
//  ViewController.swift
//  EventHandling
//
//  Created by rhino Q on 05/09/2018.
//  Copyright © 2018 rhino Q. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    @IBOutlet weak var statusLabel: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear() {
        super.viewDidAppear()
        view.window?.makeFirstResponder(self)
    }
    
    override func keyDown(with event: NSEvent) {
//        statusLabel.stringValue = "KeyDown: \(event.characters)"
        
        statusLabel.stringValue = "No Specific Event"
        
        if (event.modifierFlags.rawValue & NSEvent.ModifierFlags.deviceIndependentFlagsMask.rawValue)
            == NSEvent.ModifierFlags.shift.rawValue {
            if event.keyCode == 49 {
                statusLabel.stringValue = "keyDown Shift + Space"
            }
        } else {
            
            if event.keyCode == 49 { // spacebar
                statusLabel.stringValue = "space"
            }
        }
    }
}

