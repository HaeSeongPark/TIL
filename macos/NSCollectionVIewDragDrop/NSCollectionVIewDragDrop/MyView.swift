
//
//  MyView.swift
//  NSCollectionVIewDragDrop
//
//  Created by rhino Q on 07/09/2018.
//  Copyright © 2018 rhino Q. All rights reserved.
//

import Cocoa

class MyView: NSView {
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        
        NSColor.yellow.setFill()
        dirtyRect.fill()
    }
}
