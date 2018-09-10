//
//  MRPlayingView.swift
//  MusicRepeater
//
//  Created by rhino Q on 10/09/2018.
//  Copyright © 2018 rhino Q. All rights reserved.
//

import Cocoa

protocol MRPlayingViewDelegate {
    func didTapRestart()
}

class MRPlayingView: NSView {
    @IBOutlet weak var staticLabel: NSTextField!
    @IBOutlet weak var restartButton: NSButton!
    
    var delegate: MRPlayingViewDelegate?
    
    @IBAction func onRestart(_ sender: NSButton) {
        self.delegate?.didTapRestart()
    }
}
