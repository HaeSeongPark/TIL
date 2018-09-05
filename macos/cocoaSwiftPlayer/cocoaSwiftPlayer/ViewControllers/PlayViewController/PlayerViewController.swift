//
//  PlayerViewController.swift
//  cocoaSwiftPlayer
//
//  Created by rhino Q on 05/09/2018.
//  Copyright © 2018 rhino Q. All rights reserved.
//

import Cocoa

class PlayerViewController: NSViewController {
    @IBOutlet weak var playButton: NSButton!
    @IBOutlet weak var rewindButton: NSButton!
    @IBOutlet weak var nextButton: NSButton!
    @IBOutlet weak var volumeSlider: NSSlider!
    @IBOutlet weak var timeLabel: NSTextField!
    @IBOutlet weak var shuffleButton: NSButton!
    @IBOutlet weak var repeatButton: NSButton!
    
    let manager = PlayerManager.sharedManager
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //MARK: -IBAction
    @IBAction func play(_ sender: NSButton) {
        timeLabel.stringValue = "1:00"
        manager.play()
    }
    
    @IBAction func rewind(_ sender: NSButton) {
        manager.rewind()
    }
    
    @IBAction func next(_ sender: NSButton) {
        manager.next()
    }
    
    @IBAction func shuffle(_ sender: NSButton) {
        manager.isShuffle = !manager.isShuffle
    }
    
    @IBAction func repeatPlayList(_ sender: NSButton) {
        manager.isRepeated = !manager.isRepeated
    }
}
