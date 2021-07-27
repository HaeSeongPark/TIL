//
//  BabyStepsTimerTests.swift
//  BabyStepsTimerTests
//
//  Created by rhino Q on 2021/07/21.
//  Copyright © 2021 Quality Coding. All rights reserved.
//

import XCTest
@testable import BabyStepsTimer

class ViewControllerTests: XCTestCase {
    private var sut:ViewController!
    
    private var warningSoundPlayer:MockAVAudioPlayer {
        return sut.warningSoundPlayer as! MockAVAudioPlayer
    }
    
    private var failureSoundPlayer:MockAVAudioPlayer {
        return sut.failureSoundPlayer as! MockAVAudioPlayer
    }
    
    private var mockTimer: MockTimer {
        return sut.timer as! MockTimer
    }
    
    override func setUp() {
        let mainStroyBoard = UIStoryboard(name: "Main", bundle: nil)
        sut = mainStroyBoard.instantiateViewController(identifier: String(describing: ViewController.self))
        
        sut.makeSoundPlayer = { resource in
            let warningSoundPath = Bundle.main.path(forResource: resource, ofType: "wav")!
            let warningSoundPathURL = URL(fileURLWithPath: warningSoundPath)
            return try! MockAVAudioPlayer(contentsOf: warningSoundPathURL)
        }
        
        sut.timerProvider = MockTimer.self
        
        sut.loadViewIfNeeded()
        super.setUp()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    // MARK: Initial Tests
    
    func test_outlets_shouldBeConnnected() {
        XCTAssertNotNil(sut.timerLabel, "titleLabel should be connected")
        XCTAssertNotNil(sut.resetButton, "resetButton should be connected")
        XCTAssertNotNil(sut.startStopButton, "startStopButton should be connnected" )
    }
    
    func test_timerLabel_shouldHaveInitialText() {
        XCTAssertEqual(sut.timerLabel.text, "2:00")
    }
    
    func test_resetButton_shouldHaveInitialText() {
        XCTAssertEqual(sut.resetButton.titleLabel?.text, "Reset")
    }
    
    func test_startStopButton_shouldHaveInitialText() {
        XCTAssertEqual(sut.startStopButton.titleLabel?.text, "Start")
    }
    
    func test_resetButton_should_Disable_Initially() {
        XCTAssertFalse(sut.resetButton.isEnabled)
    }
    
    func test_startStopButton_should_able_Initially() {
        XCTAssertTrue(sut.startStopButton.isEnabled)
    }
    
    func test_isTimerRunning_should_false_Initially() {
        XCTAssertFalse(sut.isTimerRunning)
    }
    
    func test_elapsedSeconds_should_zero_Initially() {
        XCTAssertEqual(sut.elapsedSeconds, 0)
    }
    
    func test_AVAudioPlayers_should_NotNil_initially() {
        XCTAssertNotNil(sut.warningSoundPlayer)
        XCTAssertNotNil(sut.failureSoundPlayer)
    }
    
    func test_AVAudioPlayers_should_have_urls_Initially() {
        XCTAssertEqual(sut.warningSoundPlayer.url, makeURL(with: ViewController.SoundEffect.warning.rawValue))
        XCTAssertEqual(sut.failureSoundPlayer.url, makeURL(with: ViewController.SoundEffect.failure.rawValue))
    }
    
    func test_AVAudioPlayers_Should_Be_Ready_WhenViewdidLoad() {
        let warningSoundPlayer =  self.sut.warningSoundPlayer as! MockAVAudioPlayer
        let failureSoundPlayer =  self.sut.failureSoundPlayer as! MockAVAudioPlayer

        warningSoundPlayer.verifyPrePareToPlayMethdCalledOnce()
        failureSoundPlayer.verifyPrePareToPlayMethdCalledOnce()
    }
    
    // MARK: buttton tapping Tests
    func test_tappingStartStopButton_shouldStartState() {
        tap(sut.startStopButton)
        
        XCTAssertTrue(sut.isTimerRunning)
        XCTAssertEqual(sut.startStopButton.titleLabel?.text, "Stop")
        XCTAssertTrue(sut.resetButton.isEnabled)
        XCTAssertEqual(sut.view.backgroundColor, .white)
        XCTAssertEqual(sut.timerLabel.text, "2:00")
        XCTAssertEqual(sut.elapsedSeconds, 0)
    }
    
    func test_tappingStartStopButton_shouldStartTimer_And_shouldBeTimerLabel159() {
        tap(sut.startStopButton)
        MockTimer.currentTimer.fire()
        XCTAssertEqual(sut.timerLabel.text, "1:59")
        XCTAssertEqual(sut.view.backgroundColor, .white)
    }
    
    func test_tappingStartStopButton_WithRemainingTime010_should_warningPlaySound() {
        tap(sut.startStopButton)
        sut.elapsedSeconds = 109
        MockTimer.currentTimer.fire()
        XCTAssertEqual(sut.timerLabel.text, "0:10")
        
        warningSoundPlayer.verifyPlayMethdCalledOnce()
    }
    
    func test_tappingStartStopButton_WithRemainingTime000_shouldFailurePlaySound_SetBackgoundRed() {
        tap(sut.startStopButton)
        sut.elapsedSeconds = 119
        MockTimer.currentTimer.fire()
        XCTAssertEqual(sut.timerLabel.text, "0:00")
        failureSoundPlayer.verifyPlayMethdCalledOnce()

        XCTAssertEqual(sut.view.backgroundColor, .red)
    }
    
    func test_tappingStartStopButton_WithRemainingNegativeSecondTime() {
        tap(sut.startStopButton)
        sut.elapsedSeconds = 120
        MockTimer.currentTimer.fire()
        XCTAssertEqual(sut.timerLabel.text, "-0:01")
    }
    
    func test_tappingStartStopButton_withStartState_shouldBeStopState() {
        tap(sut.startStopButton)
        tap(sut.startStopButton)
        
        XCTAssertFalse(sut.isTimerRunning)
        XCTAssertEqual(sut.startStopButton.titleLabel?.text, "Start")
        XCTAssertFalse(sut.resetButton.isEnabled)
        XCTAssertEqual(mockTimer.invalidDateCallCount, 1)
        
        warningSoundPlayer.verifyPauseMethdCalledOnce()
        failureSoundPlayer.verifyPauseMethdCalledOnce()
        
        XCTAssertEqual(sut.warningSoundPlayer.currentTime, 0)
        XCTAssertEqual(sut.failureSoundPlayer.currentTime, 0)
    }
    
    func test_tappingResetButton_shouldReset() {
        tap(sut.startStopButton)
        let formermMockTimer = mockTimer
        tap(sut.resetButton)
        
        XCTAssertEqual(sut.timerLabel.text, "2:00")
        
        XCTAssertEqual(formermMockTimer.invalidDateCallCount, 1)

        XCTAssertEqual(sut.view.backgroundColor, .green)
        
        warningSoundPlayer.verifyPauseMethdCalledOnce()
        failureSoundPlayer.verifyPauseMethdCalledOnce()
        
        XCTAssertEqual(sut.warningSoundPlayer.currentTime, 0)
        XCTAssertEqual(sut.failureSoundPlayer.currentTime, 0)
        
    }
}

