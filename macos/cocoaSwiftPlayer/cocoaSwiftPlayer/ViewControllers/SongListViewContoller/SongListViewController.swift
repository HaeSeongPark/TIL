//
//  SongListViewController.swift
//  cocoaSwiftPlayer
//
//  Created by rhino Q on 05/09/2018.
//  Copyright © 2018 rhino Q. All rights reserved.
//

import Cocoa
import RealmSwift

class SongListViewController: NSViewController {
    @IBOutlet weak var tableView: NSTableView!
    
    @objc dynamic var songs:[Song] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        RealmMigrationManager.migrate()
        
        let defaults = UserDefaults.standard
        if !defaults.bool(forKey: "APP_LAUNCHED") {
            // TODO: First Time only
            let songManager = SongManager()
            try! songManager.importSongs()
            defaults.set(true, forKey: "APP_LAUNCHED")
        }
        
        let realm = try! Realm()
        let result = realm.objects(Song.self)
        songs = result.map { $0 }
        
        tableView.doubleAction = #selector(doubleCLick(sender:))
    }
    
    @objc func doubleCLick(sender: NSTableView) {
        let manager = PlayerManager.sharedManager
        if tableView.selectedRow != -1 {
            manager.currentPlayList = songs
            manager.currentSong = songs[tableView.selectedRow]
            manager.play()
        }
    }
}
