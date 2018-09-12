//
//  mytableCellView.swift
//  NSTableViewSingleColumnWithUIs
//
//  Created by rhino Q on 12/09/2018.
//  Copyright © 2018 rhino Q. All rights reserved.
//

import Cocoa

class mytableCellView: NSTableCellView {
    @IBOutlet weak var imgView: NSImageView!
    @IBOutlet weak var summaryTextField: NSTextField!
    @IBOutlet weak var desc: NSTextField!
    @IBOutlet weak var detail: NSTextField!
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
    }
    
}
