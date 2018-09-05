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
    
    @objc dynamic var songs:[Song] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let realm = try! Realm()
        let result = realm.objects(Song.self)
        songs = result.map { $0 }
    }
}
