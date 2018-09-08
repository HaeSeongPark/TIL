//
//  MyItemVIew.swift
//  NSCollectionVIewCode
//
//  Created by rhino Q on 08/09/2018.
//  Copyright © 2018 rhino Q. All rights reserved.
//

import Cocoa

class MyItemView: NSView {
    
    var label: NSTextField!
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
    }
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        commonInit()
    }
    
    required init?(coder decoder: NSCoder) {
        super.init(coder: decoder)
        commonInit()
    }
    
    private func commonInit() {
        label = NSTextField(frame: NSMakeRect(0, 0, 60, 30))
        label.stringValue = "Label"
        addSubview(label)
    }
}
