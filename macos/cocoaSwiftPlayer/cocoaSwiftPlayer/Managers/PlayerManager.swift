//
//  PlayerManager.swift
//  cocoaSwiftPlayer
//
//  Created by rhino Q on 05/09/2018.
//  Copyright © 2018 rhino Q. All rights reserved.
//

import Cocoa
import AVFoundation
import RealmSwift

class PlayerManager: NSObject, AVAudioPlayerDelegate {
    static var sharedManager = PlayerManager()
    
    var isPlaying:Bool {
        if let player = player {
            return player.isPlaying
        } else {
            return false
        }
    }
    var player: AVAudioPlayer?
    var currentSong: Song? = nil {
        didSet {
            if let currentSong = currentSong {
                if currentSong.location != player?.url?.path {
                    player = try? AVAudioPlayer(contentsOf: URL(fileURLWithPath: currentSong.location))
                    player?.volume = volume
                }
            }
        }
    }
    var currentPlayList: [Song] = []
    var isRepeated = false
    var isShuffle = false
    var volume:Float = 0.5
    
    // MARK: Player Control
    
    func play() {
        if isPlaying {
            pause()
            return
        }
        
        if currentPlayList.isEmpty {
            loadAllSongs()
        }
        
        if currentSong == nil {
            // play the frist song of the whole list if nil
            currentSong = currentPlayList[0]
        }
        
        player?.play()
    }
    
    func pause() {
        player?.pause()
    }
    
    func next() {
        
    }
    
    func rewind() {
        
    }
    
    func shuffle() {
        
    }
    
    func repeatPlaylist() {
        
    }
    
    private func loadAllSongs() {
        let realm = try! Realm()
        currentPlayList = realm.objects(Song.self).map { $0 }
    }
}
