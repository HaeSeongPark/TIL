import Combine
import SwiftUI
import PlaygroundSupport

let throttleDelay = 1.0

let subject = PassthroughSubject<String, Never>()

let throttled = subject
    .throttle(for: .seconds(throttleDelay), scheduler: DispatchQueue.main, latest: false)
    // TimeInterval(여기서는 1초) 동안 방출된 이벤트 중 첫 번째 값만 보낸다. latest : false일 때
    .share()

let subjectTimeline = TimelineView(title: "Emitted values")
let throttledTimeline = TimelineView(title: "Throttled values")

let view = VStack(spacing: 100) {
    subjectTimeline
    throttledTimeline
}

PlaygroundPage.current.liveView = UIHostingController(rootView: view.frame(width: 375, height: 600))
subject.displayEvents(in: subjectTimeline)
throttled.displayEvents(in: throttledTimeline)

let subscription1 = subject
  .sink { string in
    print("+\(deltaTime)s: Subject emitted: \(string)")
  }

let subscription2 = throttled
  .sink { string in
    print("+\(deltaTime)s: Throttled emitted: \(string)")
  }

subject.feed(with: typingHelloWorld)
/*
 latest = false
 +0.0s: Subject emitted: H
 +0.0s: Throttled emitted: H  --> subject가 값 방출하면, 그 값을 전달하고 타이머 시작
 +0.1s: Subject emitted: He
 +0.2s: Subject emitted: Hel
 +0.3s: Subject emitted: Hell
 +0.5s: Subject emitted: Hello
 +0.6s: Subject emitted: Hello
 +1.0s: Throttled emitted: He --> 1초뒤에 처음값 He 내보냄
 +2.1s: Subject emitted: Hello W
 +2.1s: Throttled emitted: Hello W --> subject가 값 방출하면, 그 값을 전달하고 타이머 시작
 +2.2s: Subject emitted: Hello Wo
 +2.2s: Subject emitted: Hello Wor
 +2.5s: Subject emitted: Hello Worl
 +2.5s: Subject emitted: Hello World
 +3.1s: Throttled emitted: Hello Wo --> --> 1초뒤에 처음값 Hello Wo 내보냄

 */

/*
 debouncesms 값을 받고 설정한 interval동안 정지 후에 마지막 값 방출
 throttle 설정한 interval동안 기다리고 처음 값이나 마지막 값 내보낸다.
 */

/*
 latest = true
 +0.0s: Subject emitted: H
 +0.0s: Throttled emitted: H --> subject가 값 방출하면, 그 값을 전달하고 타이머 시작
 +0.1s: Subject emitted: He
 +0.2s: Subject emitted: Hel
 +0.3s: Subject emitted: Hell
 +0.5s: Subject emitted: Hello
 +0.6s: Subject emitted: Hello
 +1.0s: Throttled emitted: Hello --> 1초뒤에 최신값  Hello 내보냄
 +2.1s: Subject emitted: Hello W
 +2.1s: Throttled emitted: Hello W --> subject가 값 방출하면, 그 값을 전달하고 타이머 시작
 +2.2s: Subject emitted: Hello Wo
 +2.2s: Subject emitted: Hello Wor
 +2.5s: Subject emitted: Hello Worl
 +2.5s: Subject emitted: Hello World
 +3.1s: Throttled emitted: Hello World --> 1초뒤에 최신값  Hello World 내보냄

 */
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

