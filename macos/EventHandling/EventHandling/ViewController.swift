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
    
    override func mouseDown(with event: NSEvent) {
        print("mouseDown")
        statusLabel.stringValue = "mouseDown \(event.locationInWindow)"
    }
    
    override func mouseUp(with event: NSEvent) {
        print("mouseUp")
        statusLabel.stringValue = "mouseUp \(event.locationInWindow)"
    }
    
    override func mouseDragged(with event: NSEvent) {
        print("mouseDragged")
        statusLabel.stringValue = "mouseDragged \(event.locationInWindow)"
    }
    
    override func rightMouseDown(with event: NSEvent) {
        print("rightMouseDown")
        statusLabel.stringValue = "rightMouseDown \(event.locationInWindow)"
    }
}

