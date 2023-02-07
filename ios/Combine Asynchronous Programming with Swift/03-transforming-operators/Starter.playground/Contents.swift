import Foundation
import Combine

var subscriptions = Set<AnyCancellable>()

example(of: "collect") {
    ["A", "B", "C", "D", "E"].publisher
        .collect(2)
        .sink(receiveCompletion: { print($0)}
              , receiveValue: { print ($0)}
        )
        .store(in: &subscriptions)
    
    /*
     not .collect()
     A
     B
     C
     D
     E
     finished
     
     .collect()
     ["A", "B", "C", "D", "E"]
     finished
     
     .collect(2)
     ["A", "B"]
     ["C", "D"]
     ["E"]
     finished
     */
}

example(of: "map") {
    let formatter = NumberFormatter()
    formatter.numberStyle = .spellOut
    
    [123,4,56].publisher
        .map {
            formatter.string(for: NSNumber(integerLiteral: $0)) ?? ""
        }
        .sink(receiveValue: {print($0)})
        .store(in: &subscriptions)
}

example(of: "mapping key paths") {
    let publisher = PassthroughSubject<Coordinate, Never>()
    
    publisher
        .map(\.x, \.y)
        .sink( receiveValue: {x, y in
            print("The coordinate at (\(x), \(y)) is in quadrant", quadrantOf(x: x, y: y))
        })
        .store(in: &subscriptions)
    
    publisher.send(Coordinate(x: 10, y: -8))
    publisher.send(Coordinate(x: 0, y: 5))
}

example(of: "tryMap") {
    Just("Directory name that does not exist")
        .tryMap { try FileManager.default.contentsOfDirectory(atPath: $0)}
        .sink(receiveCompletion: { print($0)},
              receiveValue:{ print($0)})
        .store(in: &subscriptions)
}

example(of: "flatMap") {
    func decode(_ codes:[Int]) -> AnyPublisher<String,Never> {
        Just(
            codes
                .compactMap { code in
                    guard (32...255).contains(code) else { return nil }
                    return String(UnicodeScalar(code) ?? " ")
                }
                .joined()
        )
        .eraseToAnyPublisher()
    }
    
    [72, 101, 108, 108, 111, 44, 32, 87, 111, 114, 108, 100, 33]
        .publisher
        .collect()
        .flatMap(decode)
        .sink(receiveValue: {print($0)})
        .store(in: &subscriptions)
    
    // https://felix-mr.tistory.com/9
    // 여러 개의 upstream publisher들을 하나의 downstream publishser로 병합
    struct Person {
        let name: CurrentValueSubject<String, Never>
    }
    
    let personA = Person(name: .init("Felix"))
    let personB = Person(name: .init("James"))
    let personC = Person(name: .init("Dochoi"))
    
    let subject = PassthroughSubject<Person,Never>()
    
    subject
        .flatMap(maxPublishers:.max(2)) { $0.name }
        .sink { print($0)}
        .store(in: &subscriptions)
    
    subject.send(personA)
    subject.send(personB)
    subject.send(personC)
    
    personB.name.send("Itzel")
}

example(of: "replaceNil") {
    ["A", nil, "C"].publisher
        .eraseToAnyPublisher()
        .replaceNil(with: "-")
        .sink(receiveValue: { print($0)})
        .store(in: &subscriptions)
    
    // eraseToAnyPublisher쓴 이유
    // replaceNil 오버로드 함수가 여러개 있는데 eraseToAnyPublisher 안 쓰면
    // 다른 replaceNil함수를 써서 옵셔널 언랩이 되지 않는다.
    // https://forums.swift.org/t/unexpected-behavior-of-replacenil-with/40800/4
}

example(of: "replaceEmpty(with:)") {
    // 1
    let empty = Empty<Int, Never>()
    // Empty타입은 즉시 completion 이벤트 방출. completeImmediately false로 하면 아무것도 방출 안 한다. 기본값 true
    // 데모나 테스팅 목적으로 사용됨
    // 2
    empty
        .replaceEmpty(with: 1)
        .sink(receiveCompletion: { print($0) },
              receiveValue: { print($0) })
        .store(in: &subscriptions)
}

example(of: "scan") {
    (1...3)
        .publisher
        .scan(0, +)
        .sink(receiveValue: {print($0)})
        .store(in: &subscriptions)
    // 1
    var dailyGainLoss: Int { .random(in: -10...10) }
    
    // 2
    let august2019 = (0..<22)
        .map { _ in dailyGainLoss }
        .publisher
    
    // 3
    august2019
        .scan(50) { latest, current in
            print("latest \(latest) current \(current)")
            return max(0, latest + current)
        }
        .sink(receiveValue: {  print($0)})
        .store(in: &subscriptions)
    
}
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
