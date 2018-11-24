//
//  String+.swift
//  CoreMediaSample
//
//  Created by rhino Q on 24/11/2018.
//  Copyright © 2018 rhino Q. All rights reserved.
//

import Foundation
import AVFoundation

extension String {
    
    static func duration(from time: CMTime) -> String {
        let totalSeconds = CMTimeGetSeconds(time)
        let secondsText = String(format: "%02d", Int(totalSeconds) % 60)
        let minutesText = String(format: "%02d", Int(totalSeconds) / 60)
        return  "\(minutesText):\(secondsText)"
    }
    
}
