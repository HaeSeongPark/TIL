//
//  ShiftClickGestureRecognizer.swift
//  EventHandling
//
//  Created by rhino Q on 05/09/2018.
//  Copyright © 2018 rhino Q. All rights reserved.
//

import Cocoa

class ShiftClickGestureRecognizer: NSClickGestureRecognizer {
    
    override init(target: Any?, action: Selector?) {
        super.init(target: target, action: action)
    }
    
    // storyboard
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func mouseDown(with event: NSEvent) {
        if (event.modifierFlags.rawValue & NSEvent.ModifierFlags.shift.rawValue) == NSEvent.ModifierFlags.shift.rawValue {
            super.mouseDown(with: event)
        }
    }
}
