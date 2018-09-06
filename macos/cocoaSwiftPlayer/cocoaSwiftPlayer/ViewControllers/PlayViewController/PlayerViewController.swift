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
    
    @IBOutlet weak var songTitleLabel: NSTextField!
    
    let manager = PlayerManager.sharedManager
    var songTimer: Timer?
    var songProgress: Double = 0.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timeLabel.stringValue = "0:00"
        addNotifications()
    }
    
    fileprivate func addNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(startPlaying(noti:)), name: Notification.Name.StartPlaying, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(pausePlaying(noti:)), name: Notification.Name.PausePlaying, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(changeSong(noti:)), name: Notification.Name.ChangeSong, object: nil)
    }
    
    //MARK: -IBAction
    @IBAction func play(_ sender: NSButton) {
        manager.play()
        playButton.image = PlayerManager.sharedManager.isPlaying ? #imageLiteral(resourceName: "Pause") : #imageLiteral(resourceName: "Play")
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
    
    //MARK: - Helpers
    
    @objc func changeSong(noti:Notification) {
        guard let song = noti.userInfo?[NotiicationUserInfos.Song] as? Song else {
            return
        }
        
        timeLabel.stringValue = "0:00"
        songProgress = 0
        songTimer?.invalidate()
        songTimer = nil
        
        songTitleLabel.stringValue = song.title
    }
    
    @objc func startPlaying(noti: NSNotification) {
        songTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateProgress), userInfo: nil, repeats: true)
    }
    
    @objc func pausePlaying(noti: Notification) {
        songTimer?.invalidate()
        songTimer = nil
    }
    
    // MARK: - Timer
    @objc func updateProgress() {
        songProgress += 1
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.minute, .second]
        formatter.zeroFormattingBehavior = .pad
        timeLabel.stringValue = "\(formatter.string(from: songProgress)!)"
    }
}
