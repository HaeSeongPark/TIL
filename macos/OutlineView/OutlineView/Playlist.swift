//
//  Playlist.swift
//  OutlineView
//
//  Created by rhino Q on 03/09/2018.
//  Copyright © 2018 rhino Q. All rights reserved.
//

import Cocoa

class Playlist: NSObject {
    // KVO complie
    @objc dynamic var name: String = "New Playlist"
    @objc dynamic var creator: String = "User"
    
    @objc func isLeaf() -> Bool {
        return true
    }
}
