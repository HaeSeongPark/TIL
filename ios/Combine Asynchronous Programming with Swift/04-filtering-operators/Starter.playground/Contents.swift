import Foundation
import Combine

var subscriptions = Set<AnyCancellable>()

example(of: "filter") {
    let numbers = (1...10).publisher
    
    numbers
        .filter { $0.isMultiple(of: 3)}
        .sink { n in
            print("\(n) is a multiple of 3!")
        }
        .store(in: &subscriptions)
}

example(of: "removeDuplicates") {
    let words = "hey hey there! want to listen to mister mister ?"
        .components(separatedBy: " ")
        .publisher
    
    words
        .removeDuplicates()
        .sink(receiveValue: { print( $0 )})
        .store(in: &subscriptions)
}

example(of: "infinite test removeDuplicates") {
    // 무한해도 되네. rxswift의 distinctUntilChanged
    let subject = PassthroughSubject<Int,Never>()
    
    subject
        .removeDuplicates()
        .sink(receiveValue: { print( $0 )})
        .store(in: &subscriptions)
    
    subject.send(1)
    subject.send(1)
    subject.send(2)
}

example(of: "compactMap") {
    // 1
    let strings = ["a", "1.24", "3",
                   "def", "45", "0.23"].publisher
    
    // 2
    strings
        .compactMap { Float($0) }
        .sink(receiveValue: {
            // 3
            print($0)
        })
        .store(in: &subscriptions)
}

example(of: "ignoreOutput") {
    let numbers = (1...10_000).publisher
    
    numbers
        .ignoreOutput()
        .sink(receiveCompletion: { print("Complted with: \($0)")},
              receiveValue: { print($0)})
        .store(in: &subscriptions)
}
// Finding values
// lazy하게 동작, 조건에 맞을 떄까지만 이벤트 받고 조건에 맞으면 구독취소하고 완료된다.
example(of: "first(where:)") {
    let numbers = (1...9).publisher
    
    numbers
        .print("numbers")
        .first(where: { $0 % 2 == 0})
        .sink(receiveCompletion: { print("Completed with: \($0)")},
              receiveValue: { print($0)})
        .store(in: &subscriptions)
    
}

// publisher가 끝날 때까지 끼다린다. 따라서 upsteram이 유한해야한다. 반드시 종료되야 한다.
example(of: "last(where:)") {
    let numbers = (1...9).publisher
    
    numbers
        .last(where: { $0 % 2 == 0})
        .sink(receiveCompletion: { print("Completed with: \($0)")},
              receiveValue: { print($0)})
        .store(in: &subscriptions)
}

example(of: "last(where:)") {
    let numbers = PassthroughSubject<Int, Never>()
    
    numbers
        .last(where: { $0 % 2 == 0 })
        .sink(receiveCompletion: { print("Completed with: \($0)") },
              receiveValue: { print($0) })
        .store(in: &subscriptions)
    
    numbers.send(1)
    numbers.send(2)
    numbers.send(3)
    numbers.send(4)
    numbers.send(5)
    
    // 값 안 나옴
    
    numbers.send(completion: .finished)
    
    // 끝나야 값 나옴
}

example(of: "dropFirst") {
    let numbers = (1...10).publisher
    
    numbers
        .dropFirst(8)
        .sink(receiveValue: { print($0)})
        .store(in: &subscriptions)
}

example(of: "drop(while:)") {
  // 1
  let numbers = (1...10).publisher
  
  // 2
  numbers
    .drop(while: { $0 % 5 != 0 }) // true이면 이벤트 무시, 5일 떄 false가 되서 거기서부터 이벤트 받는다.
    .sink(receiveValue: { print($0) })
    .store(in: &subscriptions)
}
// filter vs drop
/*
 filter는 클로저가 true를 반환할 때 이벤트를 방출
 drop은 클로저가 true를 반환하면 이벤트 무시
 
 filter는 upstream에서 방출하는 모든 이벤트 검사
 drop은 조건에 부합하면 그 이후로는 검사 x
 
 */
example(of: "test drop(while:)") {
  // 1
  let numbers = (1...10).publisher
  
  // 2
  numbers
    .drop(while: {
        print("X")
        return $0 % 5 != 0
    }) // true이면 이벤트 무시, 5일 떄 false가 되서 거기서부터 이벤트 받는다.
    .sink(receiveValue: { print($0) })
    .store(in: &subscriptions)
    // 조건에 부합한 이 후로는 X가 출력되지 않는다. ( 감사하지 않는다. )
    /*
     --- Example of: test drop(while:) ---
     X
     X
     X
     X
     X
     5
     6
     7
     8
     9
     10
     */
}

example(of: "drop(untilOutputFrom)") {
    let isReady = PassthroughSubject<Void, Never>()
    let taps = PassthroughSubject<Int, Never>()
    
    taps
        .drop(untilOutputFrom: isReady)
        .sink(receiveValue: { print($0)})
        .store(in: &subscriptions)
    
    (1...5).forEach { n in
        taps.send(n)
        
        if n == 3 {
            isReady.send()
        }
    }
}
// prefix drop
// drop은 조건에 만족할 떄까지 값 drop
// prefix는 조건에 만족할 떄까지만 값 방출
example(of: "prefix") {
  // 1
  let numbers = (1...10).publisher
  
  // 2
  numbers
    .prefix(2)
    .sink(receiveCompletion: { print("Completed with: \($0)") },
          receiveValue: { print($0) })
    .store(in: &subscriptions)
    
    /*
     --- Example of: prefix ---
     1
     2
     Completed with: finished

     */
}

example(of: "prefix(while:)") {
  // 1
  let numbers = (1...10).publisher
  
  // 2
  numbers
    .prefix(while: { $0 < 3 })
    .sink(receiveCompletion: { print("Completed with: \($0)") },
          receiveValue: { print($0) })
    .store(in: &subscriptions)
}

example(of: "prefix(untilOutputFrom:)") {
  // 1
  let isReady = PassthroughSubject<Void, Never>()
  let taps = PassthroughSubject<Int, Never>()
  
  // 2
  taps
    .prefix(untilOutputFrom: isReady)
    .sink(receiveCompletion: { print("Completed with: \($0)") },
          receiveValue: { print($0) })
    .store(in: &subscriptions)
    // 유저가 탭을 2번까지만 칠 수 있게
  // 3
  (1...5).forEach { n in
    taps.send(n)
    
    if n == 2 {
      isReady.send()
    }
  }
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
