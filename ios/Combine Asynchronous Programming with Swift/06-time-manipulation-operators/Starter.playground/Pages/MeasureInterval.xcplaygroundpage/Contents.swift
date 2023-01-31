import Combine
import SwiftUI
import PlaygroundSupport

let subject = PassthroughSubject<String, Never>()

let measureSubject = subject.measureInterval(using: DispatchQueue.main)
// measureSubject는 지정한 스케줄러(여기서는 메인큐)에서 측정값을 보낸다.
// measureInterval에서 방출하는 값은 제공된 스케줄러의 시간 간격
// 여기서는 DispatchQueue
// DispatchQueue읙 경우 TimeInterval은 나노초 단위로 생성한 값


let measureSubject2 = subject.measureInterval(using: RunLoop.main)

let subjectTimeline = TimelineView(title: "Emitted values")
let measureTimeline = TimelineView(title: "Measured values")

let view = VStack(spacing: 100) {
    subjectTimeline
    measureTimeline
}

PlaygroundPage.current.liveView = UIHostingController(rootView: view.frame(width: 375, height: 600))

subject.displayEvents(in: subjectTimeline)
measureSubject.displayEvents(in: measureTimeline)

let subscription1 = subject.sink {
  print("+\(deltaTime)s: Subject emitted: \($0)")
}

let subscription2 = measureSubject.sink {
    print("+\(deltaTime)s: Measure emitted: \(Double($0.magnitude)/1_000_000_000.0)")
}

//let subscription3 = measureSubject2.sink {
//  print("+\(deltaTime)s: Measure2 emitted: \($0)")
//}

subject.feed(with: typingHelloWorld)

/*
 +0.0s: Subject emitted: H
 +0.0s: Measure emitted: Stride(_nanoseconds: 38517875)
 +0.1s: Subject emitted: He
 +0.1s: Measure emitted: Stride(_nanoseconds: 67067584)
 +0.2s: Subject emitted: Hel
 +0.2s: Measure emitted: Stride(_nanoseconds: 103111208)
 +0.3s: Subject emitted: Hell
 +0.3s: Measure emitted: Stride(_nanoseconds: 105951542)
 +0.5s: Subject emitted: Hello
 +0.5s: Measure emitted: Stride(_nanoseconds: 191451875)
 +0.6s: Subject emitted: Hello
 +0.6s: Measure emitted: Stride(_nanoseconds: 122934166)
 +2.1s: Subject emitted: Hello W
 +2.1s: Measure emitted: Stride(_nanoseconds: 1469036709)
 +2.2s: Subject emitted: Hello Wo
 +2.2s: Measure emitted: Stride(_nanoseconds: 101697500)
 +2.3s: Subject emitted: Hello Wor
 +2.3s: Measure emitted: Stride(_nanoseconds: 109258083)
 +2.5s: Subject emitted: Hello Worl
 +2.5s: Measure emitted: Stride(_nanoseconds: 207160292)
 +2.5s: Subject emitted: Hello World
 +2.5s: Measure emitted: Stride(_nanoseconds: 55958)
 */

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

