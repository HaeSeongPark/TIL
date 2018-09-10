//
//  RepeaterView.swift
//  MusicRepeater
//
//  Created by rhino Q on 10/09/2018.
//  Copyright © 2018 rhino Q. All rights reserved.
//

import Cocoa

class MRRepeaterView: NSView {
    /*
      Everytime when we unarchive our view from the xib file, a message will be sent to this class. Then this method will be called, so it will be a good place for us to do some initialisation later on.
 */
    
    var currentCount = 0 {
        didSet {
            numberLabel.stringValue = "\(currentCount)"
        }
    }
    
    override func awakeFromNib() {
        numberLabel.isEditable = false
        numberLabel.isSelectable = false
        numberLabel.stringValue = "0"
    }

    @IBOutlet weak var numberLabel: NSTextField!
    
    @IBAction func onSubtract(_ sender: NSButton) {
        currentCount -= 1
    }
    
    @IBAction func onAdd(_ sender: NSButton) {
        currentCount += 1
    }
    
    @IBAction func didTapNext(_ sender: NSButton) {
        
    }
}
