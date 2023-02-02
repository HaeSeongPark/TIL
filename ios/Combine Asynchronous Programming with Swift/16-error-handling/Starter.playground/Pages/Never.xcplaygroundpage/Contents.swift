import Foundation
import Combine
//: ## Never
var subscriptions = Set<AnyCancellable>()

example(of: "Never sink") {
    Just("Hello")
        .sink(receiveValue: { print($0)}) // 실패가없는 퍼블리셔에만 사용가능
        .store(in: &subscriptions)
}

enum MyError:Error {
    case ohNo
}

example(of: "setFailureType") {
    Just("Hello")
        .setFailureType(to: MyError.self)
        .sink { completion in
            switch completion {
            case .failure(.ohNo):
                print("Finished with Oh no!")
            case .finished:
                print("Finished successfully!")
            }
        } receiveValue: { value in
            print("Got value:\(value)")
        }
        .store(in: &subscriptions)

}

example(of: "assign(to:on:)") {
    class Person {
        let id = UUID()
        var name = "Unknown"
    }
    
    let person = Person()
    print("1", person.name)
    
    Just("Shai") // Publisher<String, Never>
//        .setFailureType(to: Error.self) // Publisher<String, Error>
    // Referencing instance method 'assign(to:on:)' on 'Publisher' requires the types 'any Error' and 'Never' be equivalent
        .handleEvents(receiveCompletion: { _ in print("2", person.name)})
        .assign(to: \.name, on: person)
        .store(in: &subscriptions)
}

example(of: "assign(to:)") {
    class myViewModel:ObservableObject {
        @Published var currentDate = Date()
        
        init() {
            Timer.publish(every: 1, on: .main, in: .common)
                .autoconnect()
                .prefix(3)
//                .assign(to: \.currentDate, on: self) // retainCycle  여기서 self <-> subscriptions
//                .store(in: &subscriptions)
                .assign(to: &$currentDate) // inout reference, break retainCycle
            // 내부적으로 구독에 관해서 메모리 관리를 한다.
        }
    }
    
//    let vm = myViewModel()
//    vm.$currentDate
//        .sink(receiveValue: { print($0)})
//        .store(in: &subscriptions)
}

example(of: "assertNoFailure") {
    Just("Hello")
        .setFailureType(to: MyError.self) // infallible -> fallible
//        .tryMap { _ in throw MyError.ohNo }
    //error: Execution was interrupted, reason: EXC_BREAKPOINT (code=1, subcode=0x19bb27588).
        .assertNoFailure() // fallible -> infallible
    // 개발할 때 크래쉬 파악 용이, 프로덕션에는 사용 x
        .sink(receiveValue: { print("Got value: \($0)")})
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
