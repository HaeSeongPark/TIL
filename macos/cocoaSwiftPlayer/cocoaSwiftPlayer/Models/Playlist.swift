//
//  Playlist.swift
//  cocoaSwiftPlayer
//
//  Created by rhino Q on 06/09/2018.
//  Copyright © 2018 rhino Q. All rights reserved.
//

import Cocoa
import RealmSwift

class Playlist: Object {
    @objc dynamic var name: String = "PlayList"
    let songs = List<Song>()
}
