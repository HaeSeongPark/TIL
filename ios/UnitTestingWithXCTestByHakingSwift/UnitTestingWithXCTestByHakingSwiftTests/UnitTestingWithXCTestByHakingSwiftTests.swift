//
//  UnitTestingWithXCTestByHakingSwiftTests.swift
//  UnitTestingWithXCTestByHakingSwiftTests
//
//  Created by rhino Q on 2018. 3. 18..
//  Copyright © 2018년 rhino Q. All rights reserved.
//

import XCTest
@testable import UnitTestingWithXCTestByHakingSwift

class UnitTestingWithXCTestByHakingSwiftTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testAllWordsLoaded(){
        let playData = PlayData()
        XCTAssertEqual(playData.allWorrds.count, 18440, "allWords must be 18440")
    }
    
    func testWordCountsAreCorrect(){
        let playData = PlayData()
        XCTAssertEqual(playData.wordCounts.count(for: "home"), 174, "Home does not appear 174 times")
        XCTAssertEqual(playData.wordCounts.count(for: "fun"), 4, "Fun does not appear 4 time")
    }
    
    func testUserFilterWorks(){
        let playData = PlayData()
        
        playData.applyUserFilter("100")
        XCTAssertEqual(playData.filteredWords.count, 495)
        
        playData.applyUserFilter("1000")
        XCTAssertEqual(playData.filteredWords.count, 55)
        
        playData.applyUserFilter("10000")
        XCTAssertEqual(playData.filteredWords.count, 1)
        
        playData.applyUserFilter("test")
        XCTAssertEqual(playData.filteredWords.count, 56)
        
        playData.applyUserFilter("swift")
        XCTAssertEqual(playData.filteredWords.count, 7)
        
        playData.applyUserFilter("objective-c")
        XCTAssertEqual(playData.filteredWords.count, 0)
    }
    
    func testWordsLoadQuickly(){
        measure {
            _ = PlayData()
        }
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}
