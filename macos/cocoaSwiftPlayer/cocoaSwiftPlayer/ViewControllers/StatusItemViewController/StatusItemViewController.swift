//
//  StatusItemViewController.swift
//  cocoaSwiftPlayer
//
//  Created by rhino Q on 06/09/2018.
//  Copyright © 2018 rhino Q. All rights reserved.
//

import Cocoa

class StatusItemViewController: PlayerViewController {
    
    // ========================
    // MARK: - Static functions
    // ========================
    
    class func loadFromNib() -> StatusItemViewController {
        let vc = NSStoryboard(name: NSStoryboard.Name(rawValue: "Main"), bundle: nil).instantiateController(withIdentifier: NSStoryboard.SceneIdentifier(rawValue: "StatusItemViewController")) as! StatusItemViewController
        return vc
    }
    
    // =========================
    // MARK: - Lifecycle methods
    // =========================

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let manager = PlayerManager.sharedManager
        volumeSlider.floatValue = manager.volume
        
        if manager.isPlaying {
            songTitleLabel.stringValue = manager.currentSong!.title
            timeLabel.stringValue = manager.songProgressText
        }
    }
}
