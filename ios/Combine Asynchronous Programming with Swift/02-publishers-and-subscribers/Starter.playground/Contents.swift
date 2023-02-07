import Foundation
import Combine
import _Concurrency

var subscriptions = Set<AnyCancellable>()

example(of: "Publisher") {
    // 1
    let myNotification = Notification.Name("MyNotification")
    
    // 2
    let publisher = NotificationCenter.default
        .publisher(for: myNotification)
    
    // 3
    let center = NotificationCenter.default
    
    // 4
    let observer = center.addObserver(
        forName: myNotification,
        object: nil,
        queue: nil) { notification in
            print("Notification received! \(notification)")
        }
    
    // 5
    center.post(name: myNotification, object: nil)
    
    // 6
    center.removeObserver(observer)
}

example(of: "Subscriber") {
    let myNotification = Notification.Name("MyNotification")
    let center = NotificationCenter.default
    
    let publisher = center.publisher(for: myNotification)
    
    let subscriptino = publisher
        .sink { _ in
            print("Notification received from a publisher!")
        }
    
    center.post(name: myNotification, object: nil)
    
    subscriptino.cancel()
    
}

example(of: "Just") {
    let just = Just("Hello world!")
    
    _ = just
        .sink(receiveCompletion: {
            print("Received completion", $0)
        }, receiveValue: {
            print("Received value", $0)
        })
    
    _ = just
        .sink(receiveCompletion: {
            print("Received completion another", $0)
        }, receiveValue: {
            print("Received value another", $0)
        })
}

example(of: "assign(to:on:)") {
    class SomeObject {
        var value:String = "" {
            didSet {
                print(value)
            }
        }
    }
    
    let object = SomeObject()
    
    let publisher = ["Hello", "world!"].publisher
    
    _ = publisher
        .assign(to: \.value, on: object)
}

example(of: "assign(to:)") {
    class SomeObject {
        @Published var value = 0 // 그냥 value뿐만 아니라 값을 내보낼 수 있음, 클래스타입에만 가능
    }
    
    let object = SomeObject()
    
    object.$value // 그냥 값이 아니라 퍼블리셔 접근해서 구독
        .sink {
            print($0)
        }
    
    (0..<10).publisher
        .assign(to: &object.$value) // & -> 프로퍼티에 대한 inout 참초
    // AnyCancellable 토큰을 내보내지 않는다. 내부에서 라이프사이클 관리 그리고 @Publisehd 프로퍼티가 deinit되면 구독을 자동으로 취소
}

example(of: "assign(to:) 2") {
    class MyObject {
      @Published var word: String = ""
      var subscriptions = Set<AnyCancellable>()

      init() {
        ["A", "B", "C"].publisher
          .assign(to: \.word, on: self) // 이렇게 작성하고
          .store(in: &subscriptions) // AnyCancellable를 subscriptions에 넣으면 강한참조
      }
    }
    
    // 위와 같으 코드가 있을 때 강한 참조 사이클이생긴다.
    
    class MyObject2 {
      @Published var word: String = ""
      var subscriptions = Set<AnyCancellable>()

      init() {
        ["A", "B", "C"].publisher
          .assign(to: &$word) // 이렇게 하면 강한참조 사이클 문제 해결할 수 있음.
      }
    }

}

example(of: "Custom Subscriber") {
    let publisher = (1...6).publisher
//    let publisher = ["A", "B", "C", "D", "E", "F"].publisher // publiser의 Output, Failure 와 Subscriber의 Input, Failure타입이 맞아야 한다.

    
    final class IntSubscriber:Subscriber {
        typealias Input = Int
        typealias Failure = Never
        
        func receive(subscription: Subscription) {
            subscription.request(.max(3))
        }
        
        func receive(_ input: Int) -> Subscribers.Demand {
            print("Received value", input)
            return .none // 수요 조정 x
//            return .unlimited // 무한대로 받겠다
//            return .max(1) // 이벤트 받을 때 마다 수요늘 1씩 늘리기 때문에 .unlimited와 같은 결과가 나온다.
        }
        
        func receive(completion: Subscribers.Completion<Never>) {
            print("Received completion", completion)
        }
    }
    
    let subscriber = IntSubscriber()
    
    publisher.subscribe(subscriber)
}

//example(of: "Future") {
//    // Future는 만들어지지 마자 실행된다. 다른 Publisher처럼 subscriber가 필요없다.
//    // rxswift hot observable같은 건가
//    func futureIncrement(integer:Int, afterDelay delay:TimeInterval) -> Future<Int,Never> {
//        Future<Int,Never> { promise in
//            print("Original") // 구독이 없어도 만들어지지마자 한 번만 호출됨
//
//            DispatchQueue.global().asyncAfter(deadline: .now() + delay) {
//                promise(.success(integer+1))
//            }
//        }
//    }
//
//    let future = futureIncrement(integer: 1, afterDelay: 3)
//
//    future
//        .sink {
//            print($0)
//        } receiveValue: {
//            print($0)
//        }
//        .store(in: &subscriptions)
//
//    future
//      .sink(receiveCompletion: { print("Second", $0) },
//            receiveValue: { print("Second", $0) })
//      .store(in: &subscriptions)
//
//
//}

example(of: "PassthroughSubject") { // 현재값 갖고 있지 않음 rxswift의 PublishSubject
    enum MyError:Error {
        case test
    }
    
    final class StringSubscriber:Subscriber {
        typealias Input = String
        typealias Failure = MyError
        
        func receive(subscription: Subscription) {
            subscription.request(.max(2))
        }
        
        func receive(_ input: String) -> Subscribers.Demand {
            print("Received value", input)
            
            return input == "World" ? .max(1) : .none
        }
        
        func receive(completion: Subscribers.Completion<MyError>) {
            print("Received completion", completion)
        }
    }
    
    let subscriber = StringSubscriber()
    
    let subject = PassthroughSubject<String, MyError>()
    
    subject.subscribe(subscriber) // 1번재 구독
    
    let subscription = subject //2번째 구독
        .sink { completion in
            print("Recevied completion (sink)", completion)
        } receiveValue: { value in
            print("Received value (sink)",value)
        }
    
    subject.send("Hello")
    subject.send("World")
    
    subscription.cancel() // 2번쨰 구독 취소
    subject.send("Still there?")
    
    subject.send(completion: .failure(.test))
    subject.send(completion: .finished)
    subject.send("How about another one?")
}

example(of: "CurrentValueSubject") {
    var sbus = Set<AnyCancellable>()
    
    let subject = CurrentValueSubject<Int,Never>(0)
    
    subject
        .print()
        .sink(receiveValue: { print("sink \($0)")})
        .store(in: &sbus)
    
    subject.send(1)
    subject.send(2)
    
    print("1 cuurentValue : \(subject.value)")
    
    subject.value = 3
    print("2 cuurentValue : \(subject.value)")
    
    subject
        .print()
        .sink(receiveValue: { print("Second subscriptnion", $0)})
        .store(in: &sbus)
    
//    subject.value = .finisehd // value는 그냥 값
    subject.send(completion: .finished)
}

example(of: "Dynamically adjusting Demand") {
    final class IntSubscriber:Subscriber {
        typealias Input = Int
        typealias Failure = Never
        
        func receive(subscription: Subscription) {
            subscription.request(.max(2))
        }
        
        func receive(_ input: Int) -> Subscribers.Demand {
            print("Received value", input)
            
            switch input {
            case 1:
                return .max(2) // 기존 2에 + 2 = 4
            case 3:
                return .max(1) // 기존 4에 + 1 = 5 그래서 1~5까지만 받는다.
            default:
                return .none
            }
        }
        
        func receive(completion: Subscribers.Completion<Never>) {
            print("Received completion", completion)
        }
    }
    
    let subscriber = IntSubscriber()
    
    let subject = PassthroughSubject<Int,Never>()
    
    subject.subscribe(subscriber)
    
    subject.send(1)
    subject.send(2)
    subject.send(3)
    subject.send(4)
    subject.send(5)
    subject.send(6)
}

example(of: "Type erasure") {
    // subscriber가 publishe에 대한 정보를 접근하지 않으면서 publisher를 구독해서 이벤받을 때 사용?
    let subject = PassthroughSubject<Int,Never>()
    
    let publisher = subject.eraseToAnyPublisher()
    // PassthroughSubject타입을 숨긴다 왜...?
    // publisher는 AnyPublisher<Int, Never> 타입
    
    publisher
        .sink(receiveValue: { print($0)})
        .store(in: &subscriptions)
    
    subject.send(0)
    
    struct Test {
        // 내부에서만 send하고
        private let subject = PassthroughSubject<Int,Never>()
        // 외부에서는 구독만 받겍끔
        public var subejct:AnyPublisher<Int,Never> { subject.eraseToAnyPublisher() }
    }
    
//    publisher.send(1) // Value of type 'AnyPublisher<Int, Never>' has no member 'send'
}


example(of: "async/awiat") {
    let subject = CurrentValueSubject<Int,Never>(0)
    
    Task { // 비동기 task 생성
        for await element in subject.values {
            print("Element :\(element)")
        }
        print("Completed")
    }
    
    subject.send(1)
    subject.send(2)
    subject.send(3)
    
    subject.send(completion: .finished)
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
