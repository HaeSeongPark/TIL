//
//  SongTests.swift
//  AlertTests
//
//  Created by rhino Q on 03/09/2018.
//  Copyright © 2018 rhino Q. All rights reserved.
//

import XCTest
@testable import Alert

class SongTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testInit() {
        let song = Song(title: Constants.title, author: Constants.author, duration: Constants.duration)
        XCTAssertEqual(song.title, Constants.title)
        XCTAssertEqual(song.author, Constants.author)
        XCTAssertEqual(song.duration, Constants.duration)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
