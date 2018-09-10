//
//  UploadView.swift
//  MusicRepeater
//
//  Created by rhino Q on 10/09/2018.
//  Copyright © 2018 rhino Q. All rights reserved.
//

import Cocoa

protocol UploadViewDelegate {
    func didTapUploadFile()
}

class MRUploadView: NSView {
    @IBOutlet weak var uploadButton: NSButton!
    @IBOutlet weak var staticLabel: NSTextField!
    
    var delegate: UploadViewDelegate?
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
    }
    
    @IBAction func onUploadFile(_ sender: NSButton) {
        self.delegate?.didTapUploadFile()
    }
}
