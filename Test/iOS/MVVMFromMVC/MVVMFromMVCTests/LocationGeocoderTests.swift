/// Copyright (c) 2019 Razeware LLC
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
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import XCTest
@testable import Grados
import CoreLocation
import MapKit

class LocationGeocoderTests: XCTestCase {
  let mockGeocoder:MockGeocoder = MockGeocoder()
  lazy var geocoder = LocationGeocoder(geocoderAble: mockGeocoder)
  
  func test_gecode_with_error_should_be_locations_count_zero() {
    
    mockGeocoder.error = TestError()
    mockGeocoder.makePlaceMark = nil
    
    geocoder.geocode(addressString: "test") { locations in
      XCTAssertEqual(self.mockGeocoder.geocodeAddressStringCallcount, 1)
      XCTAssertEqual(locations.count,0)
    }
  }
  
  func test_gecode_with_placemark_should_be_locations_count_one() {
    mockGeocoder.error = nil
    mockGeocoder.makePlaceMark = { string in
      let mockLocation = CLLocation(latitude: 1.1, longitude: 1.1)
      
      let components = string.components(separatedBy: ", ")
      var locality = string
      var administrativeArea = ""
      if components.count > 1 {
        locality = components[0]
        administrativeArea = components[1]
      }
      
      let mockPlacemark = MockPlacemark(fakeLocality: locality, fakeLocation: mockLocation, fakeAdministrativeArea: administrativeArea)
      return [mockPlacemark]
    }

    geocoder.geocode(addressString: "Anchorage, AK") { locations in
      XCTAssertEqual(self.mockGeocoder.geocodeAddressStringCallcount, 1)
      XCTAssertEqual(locations.count,1)
      XCTAssertEqual(locations.first?.name, "Anchorage, AK")
    }
  }
}


class MockGeocoder:CLGeocoderAble {
  var error:Error?
  var makePlaceMark:((String) -> [CLPlacemark])?
  
  var geocodeAddressStringCallcount = 0
  func geocodeAddressString(_ addressString: String, completionHandler: @escaping CLGeocodeCompletionHandler) {
    geocodeAddressStringCallcount += 1
    let placemark = makePlaceMark?(addressString)
    completionHandler(placemark,error)
  }
}

// https://stackoverflow.com/a/61672930
class MockPlacemark: CLPlacemark {
  static let coordinate = CLLocationCoordinate2D(latitude: CLLocationDegrees(35), longitude: CLLocationDegrees(-80))
  
  override init() {
    let mkPlacemark = MKPlacemark(coordinate: MockPlacemark.coordinate) as CLPlacemark
    super.init(placemark: mkPlacemark)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  convenience init(fakeLocality:String?,
                   fakeLocation:CLLocation?,
                   fakeAdministrativeArea:String?) {
    self.init()
    self.fakeLocality = fakeLocality
    self.fakeLocation = fakeLocation
    self.fakeAdministrativeArea = fakeAdministrativeArea
  }
  
  override var locality: String? {
    return fakeLocality
  }
  
  override var administrativeArea: String? {
    return fakeAdministrativeArea
  }
  
  override var location: CLLocation? {
    return fakeLocation
  }
  
  var fakeLocality:String?
  var fakeLocation:CLLocation?
  var fakeAdministrativeArea:String?
}

struct TestError:Error {
  
}
