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
@testable import Grados

class WeatherbitServiceTest: XCTestCase {
  private var sut:WeatherbitService!
  private var mockURLSession:MockURLSession!
  private var weatherbitData:Data!
  
  override func setUp() {
    super.setUp()
    mockURLSession = MockURLSession()
    sut = WeatherbitService(session: mockURLSession)
    
  }
  
  override func tearDown() {
    sut = nil
    mockURLSession = nil
    weatherbitData = nil
    super.tearDown()
  }
  
  func test_weatherDataForLocation_with_Error_should_be_failedRequest_Error() {
    var testWeatherbitData:WeatherbitData?
    var testWeatherbitError: WeatherbitError?
    
    let completionCalled = expectation(description: "completion called")
    
    sut.weatherDataForLocation(latitude: 1.3, longitude: 1.3) { weatherbitData, weatherbitError in
      
      testWeatherbitData = weatherbitData
      testWeatherbitError = weatherbitError
      completionCalled.fulfill()
    }
    mockURLSession.dataTaskArgsCompletionHandler.first?(nil,nil,TestError())
    
    waitForExpectations(timeout: 0.01)
    
    XCTAssertNil(testWeatherbitData)
    XCTAssertNotNil(testWeatherbitError)
    XCTAssertEqual(testWeatherbitError, .failedRequest)
    XCTAssertEqual(mockURLSession.dataTaskCallCount, 1)
//    XCTAssertEqual(mockURLSession.dataTaskArgsURL.first, sut.makeURL(latitude: 1.3, longitude: 1.3))
  }
  
  func test_weatherDataForLocation_with_NoData_should_be_noData_Error() {
    var testWeatherbitData:WeatherbitData?
    var testWeatherbitError: WeatherbitError?
    
    let completionCalled = expectation(description: "completion called")
    
    sut.weatherDataForLocation(latitude: 1.3, longitude: 1.3) { weatherbitData, weatherbitError in
      
      testWeatherbitData = weatherbitData
      testWeatherbitError = weatherbitError
      completionCalled.fulfill()
    }
    mockURLSession.dataTaskArgsCompletionHandler.first?(nil,nil,nil)
    
    waitForExpectations(timeout: 0.01)
    
    XCTAssertNil(testWeatherbitData)
    XCTAssertNotNil(testWeatherbitError)
    XCTAssertEqual(testWeatherbitError, .noData)
    XCTAssertEqual(mockURLSession.dataTaskCallCount, 1)
  }
  
  func test_weatherDataForLocation_with_NoResponse_should_be_invalidResponse_Error() {
    var testWeatherbitData:WeatherbitData?
    var testWeatherbitError: WeatherbitError?
    
    let completionCalled = expectation(description: "completion called")
    
    sut.weatherDataForLocation(latitude: 1.3, longitude: 1.3) { weatherbitData, weatherbitError in
      
      testWeatherbitData = weatherbitData
      testWeatherbitError = weatherbitError
      completionCalled.fulfill()
    }
    let data = makeRightExampleJSONData(type: type(of: self))
    mockURLSession.dataTaskArgsCompletionHandler.first?(data,nil,nil)
    
    waitForExpectations(timeout: 0.01)
    
    XCTAssertNil(testWeatherbitData)
    XCTAssertNotNil(testWeatherbitError)
    XCTAssertEqual(testWeatherbitError, .invalidResponse)
    XCTAssertEqual(mockURLSession.dataTaskCallCount, 1)
  }
  
  func test_weatherDataForLocation_with_Not200Response_should_be_failedRequest_Error() {
    var testWeatherbitData:WeatherbitData?
    var testWeatherbitError: WeatherbitError?
    
    let completionCalled = expectation(description: "completion called")
    
    sut.weatherDataForLocation(latitude: 1.3, longitude: 1.3) { weatherbitData, weatherbitError in
      
      testWeatherbitData = weatherbitData
      testWeatherbitError = weatherbitError
      completionCalled.fulfill()
    }
    let data = makeRightExampleJSONData(type: type(of: self))
    let badResponse = response(statusCode: 404)
    mockURLSession.dataTaskArgsCompletionHandler.first?(data,badResponse,nil)
    
    waitForExpectations(timeout: 0.01)
    
    XCTAssertNil(testWeatherbitData)
    XCTAssertNotNil(testWeatherbitError)
    XCTAssertEqual(testWeatherbitError, .failedRequest)
    XCTAssertEqual(mockURLSession.dataTaskCallCount, 1)
  }
  
  func test_weatherDataForLocation_with_RightData_should_be_data_not_nil() {
    var testWeatherbitData:WeatherbitData?
    var testWeatherbitError: WeatherbitError?
    
    let completionCalled = expectation(description: "completion called")
    
    sut.weatherDataForLocation(latitude: 1.3, longitude: 1.3) { weatherbitData, weatherbitError in
      
      testWeatherbitData = weatherbitData
      testWeatherbitError = weatherbitError
      completionCalled.fulfill()
    }
    let data = makeRightExampleJSONData(type: type(of: self))
    let badResponse = response(statusCode: 200)
    mockURLSession.dataTaskArgsCompletionHandler.first?(data,badResponse,nil)
    
    waitForExpectations(timeout: 0.01)
    
    XCTAssertNotNil(testWeatherbitData)
    XCTAssertNil(testWeatherbitError)
    XCTAssertEqual(mockURLSession.dataTaskCallCount, 1)
  }
  
  func test_weatherDataForLocation_with_wrongData_should_be_invalidData_Error() {
    var testWeatherbitData:WeatherbitData?
    var testWeatherbitError: WeatherbitError?
    
    let completionCalled = expectation(description: "completion called")
    
    sut.weatherDataForLocation(latitude: 1.3, longitude: 1.3) { weatherbitData, weatherbitError in
      
      testWeatherbitData = weatherbitData
      testWeatherbitError = weatherbitError
      completionCalled.fulfill()
    }
    
    let badResponse = response(statusCode: 200)
    mockURLSession.dataTaskArgsCompletionHandler.first?(Data(),badResponse,nil)
    
    waitForExpectations(timeout: 0.01)
    
    XCTAssertNil(testWeatherbitData)
    XCTAssertNotNil(testWeatherbitError)
    XCTAssertEqual(testWeatherbitError, .invalidData)
    XCTAssertEqual(mockURLSession.dataTaskCallCount, 1)
  }
}
