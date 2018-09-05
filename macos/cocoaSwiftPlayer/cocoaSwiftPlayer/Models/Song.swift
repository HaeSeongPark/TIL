//
//  Song.swift
//  cocoaSwiftPlayer
//
//  Created by rhino Q on 05/09/2018.
//  Copyright © 2018 rhino Q. All rights reserved.
//

import Cocoa
import RealmSwift
import iTunesLibrary

class Song: Object {
    
    static let formatter = DateComponentsFormatter()
    
    @objc dynamic var title: String = ""
    @objc dynamic var location : String = ""
    @objc dynamic var length: Double = 0.0
    @objc dynamic var lengthText: String {
        return Song.formatter.string(from: length)!
    }
    
    convenience init(item : ITLibMediaItem) {
        self.init()
        self.title = item.title
        self.location = item.location?.path ?? ""
        self.length = TimeInterval(item.totalTime) / 1000.0
    }
    
    override static func ignoredProperties() -> [String] {
        return ["lengthText"]
    }
}
