//: [<- Episode](@previous)
//: ## VideoURL
import Foundation
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

//struct ResponseData: Codable {
//    let data: Video
//}
//struct Video: Codable {
//    let attributes: VideoAttributes
//}
//struct VideoAttributes: Codable {
//    let url: URL
//}

struct VideoURLString {
    // data: attributes: url
    var urlString: String
    enum CodingKeys: CodingKey {
        case data
    }
    enum DataKeys: CodingKey {
        case attributes
    }
}
struct VideoAttributes: Codable {
    var url: String
}
/*
 Note: You always put this decoding initializer in an extension.
 If you put it in the main VideoURLString structure,
 you lose the default initializer that Swift creates for structures.
 */
extension VideoURLString: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let dataContainer = try container.nestedContainer(keyedBy: DataKeys.self, forKey: .data)
        let attr = try dataContainer.decode(VideoAttributes.self, forKey: .attributes)
        urlString = attr.url
    }
}

//let videoId = 3021
VideoURL(videoId: 3021)
class VideoURL {  // 1
  var urlString = ""

  init(videoId: Int) {
    let baseURLString = "https://api.raywenderlich.com/api/videos/"
    let queryURLString = baseURLString + String(videoId) + "/stream"
    guard let queryURL = URL(string: queryURLString) else { return }  // 2
    URLSession.shared
      .dataTask(with: queryURL) { data, response, error in
        defer { PlaygroundPage.current.finishExecution() }  // 3
        if let data = data,
           let response = response as? HTTPURLResponse {
          print("\(videoId) \(response.statusCode)")
          if let decodedResponse = try? JSONDecoder().decode(
              VideoURLString.self, from: data) {
            DispatchQueue.main.async {
              self.urlString = decodedResponse.urlString  // 4
              print(self.urlString)
            }
            return
          }
        }
        print(
          "Videos fetch failed: " +
            "\(error?.localizedDescription ?? "Unknown error")")
      }
      .resume()
  }
}


//let baseURLString = "https://api.raywenderlich.com/api/videos/"
//let queryURLString = baseURLString + String(videoId) + "/stream"
//let queryURL = URL(string: queryURLString)!
//URLSession.shared
//    .dataTask(with: queryURL) { data, response, error in
//        defer { PlaygroundPage.current.finishExecution() }
//        if let data = data,
//           let response = response as? HTTPURLResponse {
//            print("\(videoId) \(response.statusCode)")
//            // Decode response and display it
//
//            if let decodedResponse = try? JSONDecoder().decode(VideoURLString.self, from: data) {
//                DispatchQueue.main.async {
//                    print(decodedResponse.urlString)
//                }
//                return
//            }
//        }
//        print(
//            "Videos fetch failed: " +
//            "\(error?.localizedDescription ?? "Unknown error")")
//    } .resume()

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
//: [<- Episode](@previous)
