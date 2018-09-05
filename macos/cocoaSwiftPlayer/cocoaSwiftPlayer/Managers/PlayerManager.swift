//
//  PlayerManager.swift
//  cocoaSwiftPlayer
//
//  Created by rhino Q on 05/09/2018.
//  Copyright © 2018 rhino Q. All rights reserved.
//

import Cocoa
import AVFoundation

class PlayerManager: NSObject, AVAudioPlayerDelegate {
    static var sharedManager = PlayerManager()
    
    var isPlaying = false
    var player: AVAudioPlayer?
    
    // MARK: Player Control
    
    func play() {
        if isPlaying {
            pause()
        }
    }
    
    func pause() {
        
    }
    
    func next() {
        
    }
    
    func rewind() {
        
    }
    
    func shuffle() {
        
    }
    
    func repeatPlaylist() {
        
    }
}
