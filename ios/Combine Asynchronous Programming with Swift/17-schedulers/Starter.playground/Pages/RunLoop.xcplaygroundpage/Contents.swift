import Combine
import SwiftUI
import PlaygroundSupport


var threadRecorder: ThreadRecorder? = nil

let source = Timer
    .publish(every: 1.0, on: .main, in: .common)
    .autoconnect()
    .scan(0) { (counter, _) in counter + 1 }

let setupPublisher = { recorder in
    source
    // 1
//        .receive(on: DispatchQueue.global())
        .subscribe(on: DispatchQueue.global())
        .recordThread(using: recorder)
    // 2
        .receive(on: RunLoop.current)
        .recordThread(using: recorder)
        .handleEvents(receiveSubscription: { _ in
            threadRecorder = recorder
            })
        .eraseToAnyPublisher()
}
/*
 1
 //    .receive(on: DispatchQueue.global())
 // DispatchQueue.global()이기 떄문에 다른 스레드 5, 6, etc 찍힘
2
 //         .receive(on: RunLoop.current)
 RunLoop.current -> 현재 돌아가는 스레드
 setupPublisher클로저가 실행되는게 ThreadRecorderView안에서 실행됨
 즉 메인스레드 실행되서 메인스레드 인 1번 스레드 가 찍힘

 */

/*
 1
 //    .subscribe(on: DispatchQueue.global())
 // 메인스레드 인 1번 스레드 가 찍힘
 // 이유 subscribe를 해도 Timer는 main runloop를 사용해서 값을 방출하기 때문에
2
 //         .receive(on: RunLoop.current)
 RunLoop.current -> 현재 돌아가는 스레드
 setupPublisher클로저가 실행되는게 ThreadRecorderView안에서 실행됨
 즉 메인스레드 실행되서 메인스레드 인 1번 스레드 가 찍힘
 */

let view = ThreadRecorderView(title: "Using RunLoop", setup: setupPublisher)
PlaygroundPage.current.liveView = UIHostingController(rootView: view)

RunLoop.current.schedule(after: .init(Date(timeIntervalSinceNow: 4.5)), tolerance: .milliseconds(500)) {
    threadRecorder?.subscription?.cancel()
}

//: [Next](@next)
/*:
 Copyright (c) 2021 Razeware LLC
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.
 
 Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
 distribute, sublicense, create a derivative work, and/or sell copies of the
 Software in any work that is designed, intended, or marketed for pedagogical or
 instructional purposes related to programming, coding, application development,
 or information technology.  Permission for such use, copying, modification,
 merger, publication, distribution, sublicensing, creation of derivative works,
 or sale is expressly withheld.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
 */

