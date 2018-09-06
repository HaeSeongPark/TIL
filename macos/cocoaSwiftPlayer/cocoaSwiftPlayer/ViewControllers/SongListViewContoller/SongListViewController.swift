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
        
        tableView.dataSource = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(changeSong(noti:)), name: Notification.Name.ChangeSong, object: nil)
    }
    
    // MARK: - Notification
    @objc func changeSong(noti: Notification) {
        guard let song = noti.userInfo?[NotiicationUserInfos.Song] as? Song else { return }
        
        let index = songs.index { s in
            return s.location == song.location
        }
        
        if let index = index {
            tableView.selectRowIndexes(NSIndexSet(index: index) as IndexSet, byExtendingSelection: false)
            tableView.scrollRowToVisible(index)
            
        }
        
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

extension SongListViewController: NSTableViewDataSource {
    func tableView(_ tableView: NSTableView, pasteboardWriterForRow row: Int) -> NSPasteboardWriting? {
        let song = songs[row]
        
        let pbItem = NSPasteboardItem()
        pbItem.setString(song.location, forType: NSPasteboard.PasteboardType.string)
        return pbItem
    }
}
