//
//  ImageCollectionView.swift
//  NewNSCollectionView
//
//  Created by rhino Q on 05/09/2018.
//  Copyright © 2018 rhino Q. All rights reserved.
//

import Cocoa

class ImageCollectionView: NSView {
    var mouseInside: Bool = false {
        didSet {
            needsDisplay = true
        }
    }
    
    override func awakeFromNib() {
        wantsLayer = true
    }
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        
        layer?.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        
        if mouseInside {
            layer?.backgroundColor = NSColor.yellow.cgColor
        }
    }
    
}
