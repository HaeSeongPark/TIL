//
//  ViewController.swift
//  simpleVideoPlayer
//
//  Created by rhino Q on 30/08/2018.
//  Copyright © 2018 rhino Q. All rights reserved.
//

import Cocoa
import AVKit
import AVFoundation

class ViewController: NSViewController {

    @IBOutlet weak var playerView: AVPlayerView!
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let url = URL(string:  "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4") else {
            return
        }
        
        // Create a new AVPlayer and associate it with the player view
        
        let player = AVPlayer(url: url)
        playerView.player = player
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

