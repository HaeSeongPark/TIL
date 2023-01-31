import Combine
import SwiftUI
import PlaygroundSupport
// 타임라인에 나오는 숫자는 인덱스 방출되는 이벤트 값아님
let valuesPerSecond = 1.0
let collectImeStride = 4
let collectMaxCount = 2

let sourcePublisher = PassthroughSubject<Date,Never>()


let collectedPulisher = sourcePublisher
    .collect(.byTime(DispatchQueue.main, .seconds(collectImeStride)))
    .flatMap { dates in dates.publisher }

let collectedPulisher2 = sourcePublisher
    .collect(.byTimeOrCount(DispatchQueue.main, .seconds(collectImeStride), collectMaxCount))
    .flatMap { dates in dates.publisher }

let subscription = Timer
    .publish(every: 1.0 / valuesPerSecond, on: .main, in: .common)
    .autoconnect()
    .subscribe(sourcePublisher)

let sourceTImeline = TimelineView(title: "Emitted values:")
let collectedTimeline = TimelineView(title: "Collected values (evey \(collectImeStride)s")
let collectedTimeline2 = TimelineView(title: "Collected values (at most \(collectMaxCount) every \(collectImeStride)s):")


let view = VStack(spacing: 40) {
    sourceTImeline
    collectedTimeline
    collectedTimeline2
}

PlaygroundPage.current.liveView = UIHostingController(rootView: view.frame(width: 375, height: 600))
sourcePublisher.displayEvents(in: sourceTImeline)
collectedPulisher.displayEvents(in: collectedTimeline)
collectedPulisher2.displayEvents(in: collectedTimeline2)

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

