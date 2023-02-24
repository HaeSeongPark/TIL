/// Copyright (c) 2021 Razeware LLC
///
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
///
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
///
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
///
/// This project and source code may use libraries or frameworks that are
/// released under various Open-Source licenses. Use of those libraries and
/// frameworks are governed by their own individual licenses.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import XCTest
@testable import Blabber

class BlabberTests: XCTestCase {
  let model:BlabberModel = {
    let model = BlabberModel()
    model.username = "test"
    
    let testConfiguation = URLSessionConfiguration.default
    testConfiguation.protocolClasses = [TestURLProtocol.self]
    
    model.urlSession = URLSession(configuration: testConfiguation)
    model.sleep = { try await Task.sleep(nanoseconds: $0 / 1_000_000_000)}
    return model
  }()
  
  func testModelSay() async throws {
    try await model.say("Hello!")
    
    let request = try XCTUnwrap(TestURLProtocol.lastRequest)
    
    XCTAssertEqual(request.url?.absoluteString, "http://localhost:8080/chat/say")
    
    let httpBodyy = try XCTUnwrap(request.httpBody)
    let message = try XCTUnwrap(try? JSONDecoder().decode(Message.self, from: httpBodyy))
    
    XCTAssertEqual(message.message, "Hello!")
  }
  
  func testModelCountdown() async throws {
//    try await model.countdown(to: "Tada!")
//
//    try await TimeoutTask(seconds:10) {
//      for await request in TestURLProtocol.requests {
//        print("request \(request)")
//      }
//    }
//    .value
    
    async let countdown:Void = model.countdown(to: "Tada!")
    async let message = TimeoutTask(seconds: 10) {
      
      await TestURLProtocol.requests
        .prefix(4)
        .reduce(into: []) { result, request in
          result.append(request)
        }
        .compactMap(\.httpBody)
        .compactMap { data in
          try? JSONDecoder().decode(Message.self, from: data).message
        }
    }.value
    
    let (messagesResult, _) = try await ( message, countdown)
    
    XCTAssertEqual(
    ["3...", "2...", "1...", "🎉 Tada!"],
      messagesResult
    )
      
  }
}
