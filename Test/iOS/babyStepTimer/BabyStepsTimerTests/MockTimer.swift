//
//  MockTimer.swift
//  BabyStepsTimerTests
//
//  Created by rhino Q on 2021/07/22.
//  Copyright © 2021 Quality Coding. All rights reserved.
//

import Foundation

class MockTimer: Timer {
    
    var block: ((Timer) -> Void)!
    var invalidDateCallCount = 0
    static var currentTimer: MockTimer!

    override func fire() {
        block(self)
    }
    
    override func invalidate() {
        invalidDateCallCount += 1
    }
    
    override open class func scheduledTimer(withTimeInterval interval: TimeInterval,
                                            repeats: Bool,
                                            block: @escaping (Timer) -> Void) -> Timer {
        let mockTimer = MockTimer()
        mockTimer.block = block
        
        MockTimer.currentTimer = mockTimer
        
        return mockTimer
    }
}
