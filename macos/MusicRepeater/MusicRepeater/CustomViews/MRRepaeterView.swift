//
//  MRRepaeterView.swift
//  MusicRepeater
//
//  Created by rhino Q on 10/09/2018.
//  Copyright © 2018 rhino Q. All rights reserved.
//

import Cocoa

protocol MRRepeaterViewDelegate {
    func didTapNext()
}

class MRRepeaterView:NSView {
    
    @IBOutlet weak var numberLabel: NSTextField!
    

    var delegate: MRRepeaterViewDelegate?

    var currentCount = 0 {
        didSet {
            numberLabel.stringValue = "\(currentCount)"
        }
    }
//
    override func awakeFromNib() {
        numberLabel.isEditable = false
        numberLabel.isSelectable = false
        numberLabel.stringValue = "0"
    }
    
    @IBAction func onSubtract(_ sender: Any) {
        //        currentCount.subtract()
    }
    
    @IBAction func onAdd(_ sender: Any) {
                currentCount.add()
    }
    @IBAction func didTapNext(_ sender: Any) {
                self.delegate?.didTapNext()
    }

}
