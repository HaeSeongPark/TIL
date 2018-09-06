//
//  CustomTableHeaderView.swift
//  cocoaSwiftPlayer
//
//  Created by rhino Q on 06/09/2018.
//  Copyright © 2018 rhino Q. All rights reserved.
//

import Cocoa

class CustomTableHeaderView: NSTableHeaderView {
    
    override var allowsVibrancy: Bool {
        return false
    }
    
    override func awakeFromNib() {
        wantsLayer = true
        layer?.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
}
