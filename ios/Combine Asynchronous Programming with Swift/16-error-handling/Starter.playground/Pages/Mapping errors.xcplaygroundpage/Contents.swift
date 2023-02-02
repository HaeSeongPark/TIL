//: [Previous](@previous)
import Foundation
import Combine

var subscriptions = Set<AnyCancellable>()
//:## Mapping errors
/*
 map은 기존 실패 유형을 전달하고 퍼블리셔의 값만 조작
 tryMap은 기존 실패 유형을 일단 Swift Erorr로 변환
 */

example(of: "map vs tryMap") {
    enum NameError:Error {
        case tooShort(String)
        case unknown
    }
    
    Just("Hello")
        .setFailureType(to: NameError.self)
        .tryMap { $0 + " World!"} // 일반 Swift.Erorr를
//        .tryMap { throw NameError.tooShort($0)} // 출력 Hello is too short!)
        .mapError { $0 as? NameError ?? .unknown} // NameError로 바꾼다.
        .sink { completion in
            // map 이면 let completion: Subscribers.Completion<NameError>
            switch completion {
            case .finished:
                print("Done")
            case .failure(.tooShort(let name)):
                print("\(name) is too short!)")
            case .failure(.unknown):
                print("An unknown name error occurred")
//            case .failure(let error):
//                print("\(error)")
            }
        } receiveValue: { value in
            print("Got value \(value)")
        }
        .store(in: &subscriptions)
}
//: [Next](@next)

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
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.
