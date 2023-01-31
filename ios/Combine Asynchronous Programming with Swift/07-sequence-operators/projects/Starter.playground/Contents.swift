import Foundation
import Combine

var subscriptions = Set<AnyCancellable>()

example(of: "min") {
    let publisher = [1,-50,246,0].publisher
    
    publisher
        .print("publisher")
        .min()
        .sink(receiveValue: { print("Lowest value is \($0)")})
        .store(in: &subscriptions)
}

example(of: "min non-Comparable") {
    let publisher = ["12345", "ab", "hellow world"].map { Data($0.utf8)}
        .publisher
    
    publisher
        .print("publisher")
        .min(by: { $0.count < $1.count})
        .sink { data in
            let string = String(data: data, encoding: .utf8)!
            print("Smallest data is \(string), \(data.count) bytes")
        }
        .store(in: &subscriptions)
}

example(of: "max") {
  
  let publisher = ["A", "F", "Z", "E"].publisher

  
  publisher
    .print("publisher")
    .max()
    .sink(receiveValue: { print("Highest value is \($0)") })
    .store(in: &subscriptions)
}

example(of: "first") {
  
  let publisher = ["A", "B", "C"].publisher

  
  publisher
    .print("publisher")
    .first()
    .sink(receiveCompletion: { print($0)}, receiveValue: {print("First value is \($0)") })
    .store(in: &subscriptions)
    
    /* first이벤트 방출하고 구독 취소
     ——— Example of: first ———
     publisher: receive subscription: (["A", "B", "C"])
     publisher: request unlimited
     publisher: receive value: (A)
     publisher: receive cancel
     First value is A
     finished
     */
}
example(of: "first(where:)") {
  
  let publisher = ["J", "O", "H", "N"].publisher

  
  publisher
    .print("publisher")
    .first(where: { "Hello World".contains($0) })
    .sink(receiveValue: { print("First match is \($0)") })
    .store(in: &subscriptions)
}

example(of: "last") {
    let publisher = ["A", "B", "C"].publisher
    
    publisher
        .print("publisher")
        .last()
        .sink(receiveValue:  { print("last value is \($0)")})
        .store(in: &subscriptions)
}

example(of: "output(at:)") {
    let publisher = ["A", "B", "C"].publisher
    publisher
        .print("publisher")
        .output(at: 1)
        .sink(receiveValue: { print("Value at index 1 is \($0)")})
        .store(in: &subscriptions)
    
    /* index 1에 해당하는 이벤트만 방출
     publisher: receive subscription: (["A", "B", "C"])
     publisher: request unlimited
     publisher: receive value: (A)
     publisher: request max: (1) (synchronous)
     publisher: receive value: (B)
     Value at index 1 is B
     publisher: receive cancel
     */
}
example(of: "output(in:)") {
  
  let publisher = ["A", "B", "C", "D", "E"].publisher

  
  publisher
    .output(in: 1...3)
    .sink(receiveCompletion: { print($0) },
          receiveValue: { print("Value in range: \($0)") })
    .store(in: &subscriptions)
}

example(of: "count") {
    let publisher = ["A", "B", "C"].publisher
    
    publisher
        .print("publisher")
        .count()
        .sink(receiveValue: { print("I have \($0) items")})
        .store(in: &subscriptions)
}

example(of: "contains") {
    let publisher = ["A", "B", "C", "D", "E"].publisher
    let letter = "C"
    
    publisher
        .print("publisher")
        .contains(letter) // 조건에 맞을 때까지 찾고 찾으면 구독 취소
        .sink(receiveValue: { contains in
            print(contains ? "Publisher emitted \(letter)!" : "Publisher never emiited \(letter)!")
        })
        .store(in: &subscriptions)
}

example(of: "contains(where:)") {
  struct Person {
    let id: Int
    let name: String
  }

  let people = [
    (123, "Shai Mishali"),
    (777, "Marin Todorov"),
    (214, "Florent Pillet")
  ]
  .map(Person.init)
  .publisher

  people
        .contains(where: { $0.id == 800 || $0.name == "Marin Todorov"})
    .sink(receiveValue: { contains in
      print(contains ? "Criteria matches!" : "Couldn't find a match for the criteria")
    })
    .store(in: &subscriptions)
}

example(of: "allSatisfy") {
//  let publisher = stride(from: 0, to: 5, by: 2).publisher
    /*
     publisher: receive subscription: (Sequence)
     publisher: request unlimited
     publisher: receive value: (0)
     publisher: receive value: (2)
     publisher: receive value: (4)
     publisher: receive finished
     All numbers are even
     */
    let publisher = stride(from: 0, to: 5, by: 1).publisher
    /* 만족하지 못한 이벤트 값이 날라오면 바로 구독 취소
     publisher: receive subscription: (Sequence)
     publisher: request unlimited
     publisher: receive value: (0)
     publisher: receive value: (1)
     publisher: receive cancel
     Something is odd...
     */
  
  publisher
    .print("publisher")
    .allSatisfy { $0 % 2 == 0 }
    .sink(receiveValue: { allEven in
      print(allEven ? "All numbers are even": "Something is odd...")
    })
    .store(in: &subscriptions)
}

example(of: "reduce") {
  let publisher = ["Hel", "lo", " ", "Wor", "ld", "!"].publisher
  
  publisher
    .print("publisher")
    .reduce("", +)
//    .reduce("") { accumulator, value in
//      accumulator + value
//    }
    .sink(receiveValue: { print("Reduced into: \($0)") })
    .store(in: &subscriptions)
    
    /*
     publisher: receive subscription: (["Hel", "lo", " ", "Wor", "ld", "!"])
     publisher: request unlimited
     publisher: receive value: (Hel)
     publisher: receive value: (lo)
     publisher: receive value: ( )
     publisher: receive value: (Wor)
     publisher: receive value: (ld)
     publisher: receive value: (!)
     publisher: receive finished
     
     Reduced into: Hello World!
     */
}
/*
 scan vs reduce
 scan은 연산할 때마다 이벤트 방출
 reduce은 업스트림이 종료된 후 최종 값만 방출
 */

example(of: "reduce") {
  // 1
  let publisher = ["Hel", "lo", " ", "Wor", "ld", "!"].publisher
  
  publisher
//    .print("publisher")
    .scan("", +)
    .sink(receiveValue: { print("Reduced into: \($0)") })
    .store(in: &subscriptions)
    
    /*
     Reduced into: Hel
     Reduced into: Hello
     Reduced into: Hello
     Reduced into: Hello Wor
     Reduced into: Hello World
     Reduced into: Hello World!
     */
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
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.
