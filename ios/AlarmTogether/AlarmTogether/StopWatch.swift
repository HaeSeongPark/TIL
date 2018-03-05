//
//  StopWatch.swift
//  AlarmTogether
//
//  Created by rhino Q on 2018. 3. 4..
//  Copyright © 2018년 rhino Q. All rights reserved.
//

import Foundation

struct StopWatch {
    private var startTime:TimeInterval = 0
    private var stopTime:TimeInterval = 0
    
    mutating func start(){
        startTime = Date().timeIntervalSince1970
    }
    mutating func stop(){
        stopTime = Date().timeIntervalSince1970
    }
    
    func getElapsedTime() -> TimeInterval {
        return stopTime - startTime
    }
    
    func getStartTime() -> TimeInterval {
        return startTime
    }
    
    func getStopTime() -> TimeInterval {
        return stopTime
    }
}
