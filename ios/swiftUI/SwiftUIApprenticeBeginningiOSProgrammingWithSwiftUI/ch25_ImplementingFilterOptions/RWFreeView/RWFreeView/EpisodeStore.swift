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

import Foundation

final class EpisodeStore: ObservableObject, Decodable {
  @Published var loading = false
  @Published var episodes: [Episode] = []
  @Published var domainFilters: [String: Bool] = [
    "1": true,
    "2": false,
    "3": false,
    "5": false,
    "8": false,
    "9": false
  ]
  @Published var difficultyFilters: [String: Bool] = [
    "advanced": false,
    "beginner": true,
    "intermediate": false
  ]
  
  func queryDomain(_ id: String) -> URLQueryItem {
    URLQueryItem(name: "filter[domain_ids][]", value: id)
  }
  
  func queryDifficulty(_ label: String) -> URLQueryItem {
    URLQueryItem(name: "filter[difficulties][]", value: label)
  }
  
  let filtersDictionary = [
    "1": "iOS & Swift",
    "2": "Android & Kotlin",
    "3": "Unity",
    "5": "macOS",
    "8": "Server-Side Swift",
    "9": "Flutter",
    "advanced": "Advanced",
    "beginner": "Beginner",
    "intermediate": "Intermediate"
  ]
  
  init() {
    //    #if DEBUG
    //    createDevData()
    //    #endif
    fetchContents()
  }
  
  func clearQueryFilters() {
    domainFilters.keys.forEach { domainFilters[$0] = false }
    difficultyFilters.keys.forEach {
      difficultyFilters[$0] = false
    }
  }
  
  enum CodingKeys:String, CodingKey {
    case episodes = "data" // array of dictionary
  }
  
  init(from decoder:Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    episodes = try container.decode([Episode].self, forKey: .episodes)
  }
  
  let baseURLString = "https://api.raywenderlich.com/api/contents"
  var baseParams = [
    "filter[subscription_types][]": "free",
    "filter[content_types][]": "episode",
    "sort": "-popularity",
    "page[size]": "20",
    "filter[q]": ""
  ]
  
  func fetchContents() {
    guard var urlComponents = URLComponents(string: baseURLString) else {
      return
    }
    
    urlComponents.setQueryItems(with: baseParams)
    
    let selectedDomains = domainFilters.filter {
      $0.value }.keys
    
    let domainQueryItems = selectedDomains.map {
      queryDomain($0)
    }
    
    let selectedDifficulties = difficultyFilters.filter {
      $0.value } .keys
    
    let difficultyQueryItems = selectedDifficulties.map {
      queryDifficulty($0)
    }
    
    urlComponents.queryItems! += domainQueryItems
    urlComponents.queryItems! += difficultyQueryItems
    
    guard let contentsURL = urlComponents.url else { return }
    print(contentsURL)
    
    loading = true
    
    URLSession.shared
      .dataTask(with: contentsURL) { data, response, error in
        defer {
          DispatchQueue.main.async {
            self.loading = false
          }
        }
        
        
        if let data = data,
           let response = response as? HTTPURLResponse {  // 4
          print(response.statusCode)
          if let decodedResponse = try? JSONDecoder().decode(
            EpisodeStore.self, from: data) {
            DispatchQueue.main.async {
              self.episodes = decodedResponse.episodes
            }
            return
          }
        }
        print(
          "Contents fetch failed: " +
          "\(error?.localizedDescription ?? "Unknown error")")  // 5
      }
      .resume()
  }
}
