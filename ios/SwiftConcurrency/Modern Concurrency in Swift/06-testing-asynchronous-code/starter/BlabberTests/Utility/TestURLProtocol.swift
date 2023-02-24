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

/// A catch-all URL protocol that returns successful response and records all requests.
class TestURLProtocol: URLProtocol {
  // URLProtocol을 URLSessionConfiguration에 넣는 방식 때문에, 인스턴스 프로퍼티에 접근하기 쉽지 않다.
  // 그래서 static으로 선언해서 쉽게 접근할 수 있게 한다.
  // 이 챕터의 간단한 테스트를 위해서는 이렇게 해도 괜찮다.
  static var lastRequest:URLRequest? {
    didSet {
      if let lastRequest {
        continuation?.yield(lastRequest)
      }
    }
  }
  
  static private var continuation:AsyncStream<URLRequest>.Continuation?
  
  static var requests:AsyncStream<URLRequest> = {
    return AsyncStream { continuation in
      TestURLProtocol.continuation = continuation
    }
  }()
  
  override class func canInit(with request: URLRequest) -> Bool {
    // 현재 프로토콜이 파라미터러 온 request를 처리해야할 때 true
    // 모든 리퀘스트를 처리하고싶기 떄문에 항상 true
    return true
  }

  override class func canonicalRequest(for request: URLRequest) -> URLRequest {
    // request를 변경할 수 있는 중간 메서드
    return request
  }

  /// Store the URL request and send success response back to the client.
  override func startLoading() {
    // 요청을 로드하고 clinet에 리스폰스를 보낸다.
    guard let client = client,
          let url = request.url,
          let response = HTTPURLResponse(url: url,
                                         statusCode: 200,
                                         httpVersion: nil,
                                         headerFields: nil) else {
      fatalError("Client or URL missing")
    }

    client.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)
    client.urlProtocol(self, didLoad: Data())
    client.urlProtocolDidFinishLoading(self)
    
    guard let stream = request.httpBodyStream else {
      fatalError("Unexpectd test scenario")
    }
    
    print("request.httpBodyStream \(request.httpBodyStream)")
    print("request.httpBody \(request.httpBody)")
    
    var request = request
    request.httpBody = stream.data
    Self.lastRequest = request
  }

  // 작업이 취소되거나 세션이 요청을 중지해야할 때 이메소드를 호출한다.?
  // 테스트용으로는 아무것도 안 해도 된다.
  override func stopLoading() {
  }
}
