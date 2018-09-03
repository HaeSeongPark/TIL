//
//  Song.swift
//  Alert
//
//  Created by rhino Q on 03/09/2018.
//  Copyright © 2018 rhino Q. All rights reserved.
//

import Foundation

class Song:NSObject {
    var title: String
    var author: String
    var duration: Double
    
    init(title:String, author: String, duration:Double) {
        self.title = title
        self.author = author
        self.duration = duration
    }
}
