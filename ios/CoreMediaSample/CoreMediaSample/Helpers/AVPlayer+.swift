//
//  AVPlayer+.swift
//  CoreMediaSample
//
//  Created by rhino Q on 24/11/2018.
//  Copyright © 2018 rhino Q. All rights reserved.
//

import Foundation
import AVFoundation

extension AVPlayer {
    
    enum observableKey: String {
        case loadedTimeRanges = "currentItem.loadedTimeRanges"
    }
    
}
