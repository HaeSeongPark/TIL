//
//  ViewController.swift
//  EventHandling
//
//  Created by rhino Q on 05/09/2018.
//  Copyright © 2018 rhino Q. All rights reserved.
//

import Cocoa

class ViewController: NSViewController, NSGestureRecognizerDelegate{
    @IBOutlet weak var statusLabel: NSTextField!
    var click:NSGestureRecognizer?
    var doubleClick:NSGestureRecognizer?
    
    var startPoint: NSPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let click = NSClickGestureRecognizer(target: self, action: #selector(click(gesture:)))
        view.addGestureRecognizer(click)
        click.delegate = self
        self.click = click
        
        let doubleClick = NSClickGestureRecognizer(target: self, action: #selector(doubleClick(gestrue:)))
        doubleClick.numberOfClicksRequired = 2
        view.addGestureRecognizer(doubleClick)
        self.doubleClick = doubleClick
        
        let shiftClick = ShiftClickGestureRecognizer(target: self, action: #selector(shiftClick(gesture:)))
        view.addGestureRecognizer(shiftClick)
        
        let rightClick = NSClickGestureRecognizer(target: self, action: #selector(rightClick(rightclick:)))
        rightClick.buttonMask = 0x2
//        click.buttonMask = 0x2 // right mouse click
        view.addGestureRecognizer(rightClick)
        
        let pan = NSPanGestureRecognizer(target: self, action: #selector(panned(pan:)))
        view.addGestureRecognizer(pan)
    }
    
    @objc func panned(pan: NSPanGestureRecognizer) {
        print("panning")
        statusLabel.stringValue = "panning"
        
        switch pan.state {
        case .began: startPoint = pan.location(in: view)
        case .changed:
            let currentPoint = pan.location(in: view)
            if startPoint.x < currentPoint.x {
                statusLabel.stringValue = "panning to right"
            } else {
                statusLabel.stringValue = "panning to left"
            }
            
            // move window position using pan
            if let window = view.window {
                var windowFrame = window.frame
                windowFrame.origin.x += currentPoint.x - startPoint.x
                windowFrame.origin.y += currentPoint.y - startPoint.y
                window.setFrame(windowFrame, display:true)
                
            }
        case .ended:
            startPoint = nil
            statusLabel.stringValue = "Panning Finished"
        default: break
        }
    }
    
    @objc func rightClick(rightclick: NSClickGestureRecognizer) {
        print("right cilck")
        statusLabel.stringValue = "right click"
    }
    
    @objc func shiftClick(gesture:ShiftClickGestureRecognizer) {
        print("shiftClick")
        statusLabel.stringValue = "shiftclick"
    }
    
    @objc func click(gesture:NSGestureRecognizer){
        print("click gr")
        statusLabel.stringValue = "click for gr"
    }
    
    @objc func doubleClick(gestrue:NSGestureRecognizer) {
        print("double click gr")
        statusLabel.stringValue = "double click for gr"
    }
    
    func gestureRecognizer(_ gestureRecognizer: NSGestureRecognizer, shouldRequireFailureOf otherGestureRecognizer: NSGestureRecognizer) -> Bool {
        if gestureRecognizer == click && otherGestureRecognizer == doubleClick {
            return true
        }
        return false
    }
    
    override func viewDidAppear() {
        super.viewDidAppear()
        view.window?.makeFirstResponder(self)
    }
    
    // MARK: Gesture Recognizers
    
    // MARK: Key Events
    
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

