//
//  MockAVAudioPlayer.swift
//  BabyStepsTimerTests
//
//  Created by rhino Q on 2021/07/22.
//  Copyright © 2021 Quality Coding. All rights reserved.


import Foundation
@testable import BabyStepsTimer
import XCTest

final class MockAVAudioPlayer:AVAudioPlayerAble {
    private enum playState {
        case initial
        case prepareToPlay
        case playing
        case pause
    }
    
    private var playState:playState = .initial
    private var prePareToPlayCallCount = 0
    private var playCount = 0
    private var pauseCount = 0
    
    let url: URL?
    
    init(contentsOf url: URL) throws {
        self.url = url
    }
    
    var currentTime: TimeInterval = 0
    
    
    func prepareToPlay() -> Bool {
        prePareToPlayCallCount += 1
        self.playState = .prepareToPlay
        return true
    }
    
    func play() -> Bool {
        playCount += 1
        self.playState = .playing
        return true
    }
    
    func pause() {
        pauseCount += 1
        self.playState = .pause
    }
    
    func verifyPrePareToPlayMethdCalledOnce(file:StaticString = #file, line:UInt = #line) {
        if prePareToPlayCallCount == 0 {
            XCTFail("Wanted but not invoked: \(#function)", file: file, line: line)
        }
        
        if prePareToPlayCallCount > 1 {
            XCTFail("Wanted 1 time but ws called \(prePareToPlayCallCount) times." + "\(#function)", file: file, line: line)
        }
        
        if self.playState != .prepareToPlay {
            XCTFail("Expected playState to prepareToplay but \(self.playState)" + " \(#function)", file: file, line: line)
        }
    }
    
    func verifyPlayMethdCalledOnce(file:StaticString = #file, line:UInt = #line) {
        if playCount == 0 {
            XCTFail("Wanted but not invoked: \(#function)", file: file, line: line)
        }
        
        if playCount > 1 {
            XCTFail("Wanted 1 time but ws called \(prePareToPlayCallCount) times." + "\(#function)", file: file, line: line)
        }
        
        if self.playState != .playing {
            XCTFail("Expected playState to prepareToplay but \(self.playState)" + " \(#function)", file: file, line: line)
        }
    }
    
    
    func verifyPauseMethdCalledOnce(file:StaticString = #file, line:UInt = #line) {
        if pauseCount == 0 {
            XCTFail("Wanted but not invoked: \(#function)", file: file, line: line)
        }
        
        if pauseCount > 1 {
            XCTFail("Wanted 1 time but ws called \(prePareToPlayCallCount) times." + "\(#function)", file: file, line: line)
        }
        
        if self.playState != .pause {
            XCTFail("Expected playState to prepareToplay but \(self.playState)" + " \(#function)", file: file, line: line)
        }
    }
}
