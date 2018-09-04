//
//  HeaderView.swift
//  NewNSCollectionView
//
//  Created by rhino Q on 04/09/2018.
//  Copyright © 2018 rhino Q. All rights reserved.
//

import Cocoa

class HeaderView: NSView {
    
    lazy var titleTextField: NSTextField? = {
        for view in self.subviews {
            if view is NSTextField {
                return view as? NSTextField
            }
        }
        return nil
    }()
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        self.wantsLayer = true
        self.layer?.backgroundColor = NSColor.green.cgColor
    }
}
