//
//  UISilder+.swift
//  CoreMediaSample
//
//  Created by rhino Q on 24/11/2018.
//  Copyright © 2018 rhino Q. All rights reserved.
//

import UIKit
import AVFoundation

extension UISlider {
    
    func setSliderValue(for player: AVPlayer, progress: CMTime) {
        guard let duration = player.currentItem?.duration else { return }
        let totalSeconds = CMTimeGetSeconds(duration)
        let progressSeconds = CMTimeGetSeconds(progress)
        self.value = Float(progressSeconds / totalSeconds)
    }
    
}
