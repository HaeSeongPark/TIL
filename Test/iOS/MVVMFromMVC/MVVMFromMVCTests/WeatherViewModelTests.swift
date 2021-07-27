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

class WeatherViewModelTests: XCTestCase {
  private var sut:WeatherViewModel!
  private var mockLocationGeocoder:MockLocationGeocoder!
  private var mockWeatherbitService:MockWeatherbitService!
  
  override func setUp() {
    super.setUp()
    mockLocationGeocoder = MockLocationGeocoder()
    mockWeatherbitService = MockWeatherbitService()
    
    sut = WeatherViewModel(geocoder: mockLocationGeocoder,
                           weatherbitService: mockWeatherbitService)
  }
  
  override func tearDown() {
    mockLocationGeocoder = nil
    sut = nil
    super.tearDown()
  }
  
  func test_changeLocation_with_location_should_be_equal_locationName() {
    let testLocationName = "test"
    sut.changeLocation(to: testLocationName)
    let testLocation = Location(name: testLocationName, latitude: 1.2, longitude: 1.2)
    
    mockLocationGeocoder.gecodeArgsCallback.first?([testLocation])
    
    // when init, call changeLocation func, so geocodeCallCount 2
    XCTAssertEqual(mockLocationGeocoder.geocodeCallCount, 2)
    XCTAssertEqual(sut.locationName.value, testLocationName)
  }
  
  func test_changeLocation_without_location_should_be_NotFound() {
    sut.changeLocation(to: "test")
    mockLocationGeocoder.gecodeArgsCallback.first?([])
    
    XCTAssertEqual(mockLocationGeocoder.geocodeCallCount, 2)
    XCTAssertEqual(sut.locationName.value, "Not found")
    XCTAssertEqual(sut.date.value, "")
    XCTAssertEqual(sut.icon.value, "")
    XCTAssertEqual(sut.summary.value, "")
    XCTAssertEqual(sut.forecastSummary.value, "")
  }
  
  func test_fetchWeatherForLocation_with_weatherData() {
    let testLocation = Location(name: "test", latitude: 1.2, longitude: 1.2)
    mockLocationGeocoder.gecodeArgsCallback.first?([testLocation])
    
    let exampleJSONData = makeRightExampleJSONData(type: type(of: self))
    let decoder = JSONDecoder()
    let testWeatherData = try! decoder.decode(WeatherbitData.self, from: exampleJSONData)

    mockWeatherbitService.weatherDataForLocationCompletion.first?(testWeatherData, nil)
    
    XCTAssertEqual(mockWeatherbitService.weatherDataForLocationCallCount, 1)
    XCTAssertEqual(sut.date.value, "Monday, Aug 28")
    XCTAssertEqual(sut.icon.value, "c03d")
    XCTAssertEqual(sut.summary.value, "Broken clouds - 24℉")
    XCTAssertEqual(sut.forecastSummary.value, "\nSummary: Broken clouds")
  }
  
  func test_fetchWeatherForLocation_without_weatherData() {
    let testLocation = Location(name: "test", latitude: 1.2, longitude: 1.2)
    mockLocationGeocoder.gecodeArgsCallback.first?([testLocation])
    
    mockWeatherbitService.weatherDataForLocationCompletion.first?(nil, nil)
    
    XCTAssertEqual(mockWeatherbitService.weatherDataForLocationCallCount, 1)
    XCTAssertEqual(sut.date.value, " ")
    XCTAssertEqual(sut.icon.value, " ")
    XCTAssertEqual(sut.summary.value, " ")
    XCTAssertEqual(sut.forecastSummary.value, " ")
  }
}


class MockWeatherbitService:WeatherbitServiceProtocol {
  var weatherDataForLocationCallCount = 0
  var weatherDataForLocationLatitue:[Double] = []
  var weatherDataForLocationLongitude:[Double] = []
  var weatherDataForLocationCompletion: [WeatherDataCompletion] = []
//  typealias WeatherDataCompletion = (WeatherbitData?, WeatherbitError?) -> ()
  
  func weatherDataForLocation(latitude: Double, longitude: Double, completion: @escaping WeatherDataCompletion) {
    weatherDataForLocationCallCount += 1
    weatherDataForLocationLatitue.append(latitude)
    weatherDataForLocationLongitude.append(longitude)
    weatherDataForLocationCompletion.append(completion)
  }
}

class MockLocationGeocoder:LocationGeocoderProtocol {
  var geocodeCallCount = 0
  var geocodeArgsString: [String] = []
  var gecodeArgsCallback:[ ([Location]) -> ()] = []
  
  func geocode(addressString: String, callback: @escaping ([Location]) -> ()) {
    geocodeCallCount += 1
    geocodeArgsString.append(addressString)
    gecodeArgsCallback.append(callback)
  }
}
