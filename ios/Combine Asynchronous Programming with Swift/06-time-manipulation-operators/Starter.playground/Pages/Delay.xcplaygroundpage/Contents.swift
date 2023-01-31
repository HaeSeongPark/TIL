import Combine
import SwiftUI
import PlaygroundSupport
// 타임라인에 나오는 숫자는 인덱스 방출되는 이벤트 값아님
let valuesPerSecond = 1.0
let delayInSeconds = 1.5

let sourcePublisher = PassthroughSubject<Date,Never>()

let delayedPublisher = sourcePublisher.delay(for: .seconds(delayInSeconds), scheduler: DispatchQueue.main)

let subscription = Timer
    .publish(every: 1.0 / valuesPerSecond, on: .main, in: .common) // 매초마다 메인스레에서 값을 넘겨준다.
    .autoconnect() // 즉시 시작을위해 사용 -> 첫 번째 구독시 자동으로 즉시 연결
    .subscribe(sourcePublisher) // 여기에 값을 넣는다.

let sourceTimeline = TimelineView(title: "Emiteed values (\(valuesPerSecond) per sec.):")
let delayedTimeline = TimelineView(title: "Delayed values (with a \(delayInSeconds)s delay.):")

let view = VStack(spacing: 50) {
    sourceTimeline
    delayedTimeline
}

sourcePublisher.displayEvents(in: sourceTimeline)
delayedPublisher.displayEvents(in: delayedTimeline)

PlaygroundPage.current.liveView = UIHostingController(rootView: view.frame(width: 375, height: 600))

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

