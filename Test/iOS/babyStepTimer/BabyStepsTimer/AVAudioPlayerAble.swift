//
//  AVAudioPlayerAble.swift
//  BabyStepsTimer
//
//  Created by rhino Q on 2021/07/21.
//  Copyright © 2021 Quality Coding. All rights reserved.
//

import AVFoundation

protocol AVAudioPlayerAble {
    init(contentsOf url: URL) throws
    var currentTime:TimeInterval { get set }
    var url: URL? { get }
    @discardableResult func prepareToPlay() -> Bool
    @discardableResult func play() -> Bool
    func pause()
}

extension AVAudioPlayer: AVAudioPlayerAble {}
