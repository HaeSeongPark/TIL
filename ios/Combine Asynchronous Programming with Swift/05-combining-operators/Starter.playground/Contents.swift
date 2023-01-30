import UIKit
import Combine

var subscriptions = Set<AnyCancellable>()
example(of: "prepend(Output...)") {
    let pulisher = [3,4].publisher
    
    pulisher
        .prepend(1,2) // 두 번째
        .prepend(-1,0)// 아래서부터 들어간다 첫 번쨰
        .sink(receiveValue: { print($0)})
        .store(in: &subscriptions)
}

example(of: "prepend(Sequence)") {
    let publisher = [5,6,7].publisher
    
    publisher
        .prepend([3,4])
        .prepend(Set(1...2))
        .prepend(stride(from: 6, to: 11, by: 2))
        .sink(receiveValue: { print($0)})
        .store(in: &subscriptions)
}

example(of: "prepend(Pubisher)") {
    let p1 = [3,4].publisher
    let p2 = [1,2].publisher
    
    p1
        .prepend(p2)
        .sink(receiveValue: { print($0)})
        .store(in: &subscriptions)
}

example(of: "prepend(Publisher) #2") {
    // 1
    let publisher1 = [3, 4].publisher
    let publisher2 = PassthroughSubject<Int, Never>()
    
    // 2
    publisher1
        .prepend(publisher2)
        .sink(receiveValue: { print($0) })
        .store(in: &subscriptions)
    
    // 3
    publisher2.send(1)
    publisher2.send(2)
    publisher2.send(completion: .finished) // 반드시 종료되야 한다.
    
}

example(of: "append(Output...)") {
    // 1
    let publisher = [1].publisher
    
    // 2
    publisher // upstream 무조건 완료되야한다.
        .append(2, 3)
        .append(4)
        .sink(receiveValue: { print($0) })
        .store(in: &subscriptions)
}

example(of: "append(Output...) #2") {
    // 1
    let publisher = PassthroughSubject<Int, Never>()
    
    publisher
        .append(3, 4)
        .append(5)
        .sink(receiveValue: { print($0) })
        .store(in: &subscriptions)
    
    // 2
    publisher.send(1)
    publisher.send(2)
    publisher.send(completion: .finished)
}

example(of: "append(Sequence)") {
    // 1
    let publisher = [1, 2, 3].publisher
    
    publisher
        .append([4, 5]) // 2
        .append(Set([6, 7])) // 3
        .append(stride(from: 8, to: 11, by: 2)) // 4
        .sink(receiveValue: { print($0) })
        .store(in: &subscriptions)
}

example(of: "append(Publisher)") {
    // 1
    let publisher1 = [1, 2].publisher
    let publisher2 = [3, 4].publisher
    
    // 2
    publisher1
        .append(publisher2)
        .sink(receiveValue: { print($0) })
        .store(in: &subscriptions)
}

example(of: "switchToLatest") {
    let publisher1 = PassthroughSubject<Int,Never>()
    let publisher2 = PassthroughSubject<Int,Never>()
    let publisher3 = PassthroughSubject<Int,Never>()
    
    let publishers = PassthroughSubject<PassthroughSubject<Int,Never>,Never>()
    
    publishers
        .switchToLatest()
        .sink(receiveCompletion: { _ in print("Completed!")}, receiveValue: { print($0)})
        .store(in: &subscriptions)
    
    // 4
    publishers.send(publisher1)
    publisher1.send(1)
    publisher1.send(2)
    
    // 5
    publishers.send(publisher2)
    publisher1.send(3)
    publisher2.send(4)
    publisher2.send(5)
    
    // 6
    publishers.send(publisher3)
    publisher2.send(6)
    publisher3.send(7)
    publisher3.send(8)
    publisher3.send(9)
    
    // 7
    publisher3.send(completion: .finished)
    publishers.send(completion: .finished)
}
// switchToLatest
/*
 네트워크 요청을 하는 버튼이 있다고 했을때,
 사용자가 버튼응ㄹ 누르면 네트워크 요청을하고
 또 누르면 또 요청을 합니다
 두 번쨰 요청을 했을 때 진행중인 요청을 제거하고 최신것만 요청하게 하고 싶을 때 유용
 */
//example(of: "switchToLatest - Network Request") {
//    let url = URL(string: "https://source.unsplash.com/random")!
//    // 1
//    func getImage() -> AnyPublisher<UIImage?, Never> {
//        URLSession.shared
//            .dataTaskPublisher(for: url)
//            .map { data, _ in UIImage(data: data)}
//            .print("image")
//            .replaceError(with: nil)
//            .eraseToAnyPublisher()
//    }
//    // 2
//    let taps = PassthroughSubject<Void,Never>()
//
//    taps
//        .map { _ in getImage() } // 3
//        .switchToLatest() // 4
//        .sink(receiveValue: { _ in })
//        .store(in: &subscriptions)
//
//    // 5
//    taps.send()
//
//    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
//        taps.send()
//    }
//
//    DispatchQueue.main.asyncAfter(deadline: .now() + 3.1) {
//        taps.send()
//    }
//
//    /*
//     ——— Example of: switchToLatest - Network Request ———
//     image: receive subscription: (DataTaskPublisher)
//     image: request unlimited
//     image: receive value: (Optional(<UIImage:0x60000154c3f0 anonymous {1080, 1674} renderingMode=automatic(original)>))
//     image: receive finished
//     image: receive subscription: (DataTaskPublisher)
//     image: request unlimited
//     image: receive cancel -> 취소됨
//     image: receive subscription: (DataTaskPublisher)
//     image: request unlimited
//     image: receive value: (Optional(<UIImage:0x600001548d80 anonymous {1080, 1620} renderingMode=automatic(original)>))
//     image: receive finished
//     */
//}

example(of: "merge(with:)") {
    let p1 = PassthroughSubject<Int,Never>()
    let p2 = PassthroughSubject<Int,Never>()
    
    
    p1.merge(with: p2)
        .sink(receiveCompletion: { _ in print("Completed")},
              receiveValue: { print($0)})
        .store(in: &subscriptions)
    
    p1.send(1)
    p1.send(2)
    
    p2.send(3)
    p1.send(4)
    p2.send(5)
    
    [p1,p2].forEach {
        $0.send(completion: .finished)
    }
}

example(of: "combineLatest") {
    let p1 = PassthroughSubject<Int,Never>()
    let p2 = PassthroughSubject<String,Never>()
    
    p1
    .combineLatest(p2)
    .sink(receiveCompletion: { _ in print("Completed")},
          receiveValue: { print("P1: \($0), P2: \($1)")})
    .store(in: &subscriptions)
    
    p1.send(1)
    p1.send(2)
    
    p2.send("a")
    p2.send("b")
    
    p1.send(3)
    p2.send("c")
    
    p1.send(completion: .finished)
    p2.send(completion: .finished)
}


example(of: "zip") {
    // 1
    let publisher1 = PassthroughSubject<Int, Never>()
    let publisher2 = PassthroughSubject<String, Never>()
    
    publisher1
        .zip(publisher2)
        .sink(receiveCompletion: { _ in print("Completed")},
              receiveValue: { print("P1: \($0), P2: \($1)")})
        .store(in: &subscriptions)

    publisher1.send(1)
    publisher1.send(2)
    publisher2.send("a")
    publisher2.send("b")
    publisher1.send(3)
    publisher2.send("c")
    publisher2.send("d")
    
    publisher1.send(completion: .finished)
    publisher2.send(completion: .finished)
    
}

/*
 While switchToLatest is relatively complex, it’s extremely useful.
 It takes a publisher that emits publishers, switches to the latest publisher
 and cancels the subscription to the previous publisher.
 
 */
// Copyright (c) 2021 Razeware LLC
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
// distribute, sublicense, create a derivative work, and/or sell copies of the
// Software in any work that is designed, intended, or marketed for pedagogical or
// instructional purposes related to programming, coding, application development,
// or information technology.  Permission for such use, copying, modification,
// merger, publication, distribution, sublicensing, creation of derivative works,
// or sale is expressly withheld.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
