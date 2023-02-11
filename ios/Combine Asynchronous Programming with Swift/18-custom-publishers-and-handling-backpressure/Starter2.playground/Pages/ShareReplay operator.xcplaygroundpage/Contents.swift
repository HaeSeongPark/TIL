import Foundation
import Combine

// 1
// 구독자와 publisher가 구독을 변경하거나 접근해야 해서 class로 선언
fileprivate final class ShareReplaySubscription<Output, Failure:Error>:Subscription {
    // 2
    // shareReplay 할 버터. 최대 수
    let capacity: Int
    
    // 3
    // 구독할 동안 참조할 구독자 프로퍼티, AnySubscriber으로 여러 타입 대응
    var subscriber: AnySubscriber<Output,Failure>? = nil
    
    // 4
    // 구독자로부터 퍼블리셔가 받는 수요를 누적할 프로퍼티
    var demand: Subscribers.Demand = .none
    
    // 5
    // 지연된 값들을 저장할 버터, 전달되거나 없어질 때까지 저장
    var buffer: [Output]
    
    // 6
    // 완료이벤트 저장, 새 구독자가 값을 오청하는 즉시 제공할 준비??
    var completion: Subscribers.Completion<Failure>? = nil
    
    init<S>(subscriber: S,
            replay: [Output],
            capacity: Int,
            completion: Subscribers.Completion<Failure>?)
    where S: Subscriber,
    Failure == S.Failure,
    Output == S.Input {
        // 7
        self.subscriber = AnySubscriber(subscriber)
        // 8
        self.buffer = replay
        self.capacity = capacity
        self.completion = completion
    }
    
    private func complete(with completion: Subscribers.Completion<Failure>) {
        // 9
        // completiont시에 구독자가 잘못 호출할 수 있는 동작 방지?
        guard let subscriber = self.subscriber else { return }
        self.subscriber = nil
        // 10
        self.completion = nil
        self.buffer.removeAll()
        // 11
        subscriber.receive(completion: completion)
    }
    
    private func emitAsNeeded() {
        // 구독자가 있으면
        guard let subscriber = subscriber else { return }
        
        // 12
        while self.demand > .none && !buffer.isEmpty {
            // 13
            self.demand -= .max(1)
            // 14
            let nextDemand = subscriber.receive(buffer.removeFirst())
            // 15
            if nextDemand != .none {
                // nextDemand가 none이 아닐 떄만 더하기
                // 그렇지 않으면 크래쉬가 난다
                // combine에서는 Subscribers.Demand.none를 0으로 취급하지 않고
                // none을 더하거나 때면 exectpion이 발생
                self.demand += nextDemand
            }
        }
        // 16
        // 지연된 completion있으면 보낸다.
        if let completion = completion {
            complete(with: completion)
        }
    }
    
    func receive(_ input:Output) {
        guard subscriber != nil else { return }
        
        buffer.append(input)
        if buffer.count > capacity {
            buffer.removeFirst()
        }
        
        emitAsNeeded()
    }
    
    func receive(completion: Subscribers.Completion<Failure>) {
        guard let subscriber = self.subscriber else { return }
        self.subscriber = nil
        self.buffer.removeAll()
        subscriber.receive(completion: completion)
    }
    
    
    func request(_ demand: Subscribers.Demand) {
        print("func request(_ demand: Subscribers.Demand) {")
        // crash 피하기 위해서
        if demand != .none {
            self.demand += demand
        }
        
        // demnad가 none인 경우에도 호출해서
        // 이미 발생한 completion 이벤트를 전달
        emitAsNeeded()
    }
    
    func cancel() {
        complete(with: .finished)
    }
}

extension Publishers {
    // 여러 구독자가 하나의 인스턴스를 공유해야 하기에 class
    final class ShareReply<Upstream:Publisher>:Publisher {
        typealias Output = Upstream.Output
        typealias Failure = Upstream.Failure
        
        // 22
        // 여러 구독자에 동시에 값을 보내야 하기 때문에 변경 가능한 값들에 접근을 독점적으로 하기 위해 NSLock? NSRecursiveLock?
        private let lock = NSRecursiveLock()
        
        // 23
        // upstream참조, 구독 라이프사이클의 여러지머에서 필요함
        private let upstream: Upstream
        
        // 24
        // 얼마나 기록할 건지
        private let capacity: Int
        
        // 25
        // 공유 값들의 저장소?
        private var replay = [Output]()
        
        // 26
        // 여러 구독자한테 값을 방출할 거기 때문에 구독을 저장
        private var subscriptions = [ShareReplaySubscription<Output, Failure>]()
        
        // 27
        // Share 오퍼레이터는 completion후에 값을 replay해야 하기 때문에 upstrem의 completion을 저장하고 있어야 한다.
        private var completion: Subscribers.Completion<Failure>? = nil
        
        init(upstream:Upstream, capacity:Int) {
            self.upstream = upstream
            self.capacity = capacity
        }
        
        private func relay(_ value:Output) {
            // 여러 구독자가 publisher를 공유하니까, 변경 가능한 변수에 접근을 lock으로 보호
            lock.lock(); defer { lock.unlock() }
            
            // upstream이 끝나지 않았을 때만 값을 전달
            guard completion == nil else { return }
            
            // 버퍼에 값 저장
            replay.append(value)
            
            // capacity보다 크면 맨 앞에거 제거
            if replay.count > capacity {
                replay.removeFirst()
            }
            
            // 값을 구독(자)에 전달
            subscriptions.forEach {
                $0.receive(value)
            }
            
        }
        
        private func complete(_ completion: Subscribers.Completion<Failure>) {
            lock.lock()
            defer { lock.unlock() }
            // 32
            // 나중에 오는 구독자에게 전달해야해서 따로 저장
            self.completion = completion
            
            // 33
            // completion을 구독(자)에 전달
            subscriptions.forEach {
                $0.receive(completion: completion)
            }
        }
        
        
        func receive<S>(subscriber: S) where S : Subscriber, Upstream.Failure == S.Failure, Upstream.Output == S.Input {
            lock.lock()
            defer { lock.unlock() }
            
            // 새로운 구독은 subsciber, current replay buffer, cacpacity를 가진다. 그리고 completion까지도
            let subscription = ShareReplaySubscription(
                subscriber: subscriber,
                replay: replay,
                capacity: capacity,
                completion: completion)
            
            // 나중에 올 이벤트를 전달하기 위해서 subscription을 저장
            subscriptions.append(subscription)
            
            // 지금이나 나중에 값을 요청할 구독자에게 구독을넘긴다
            subscriber.receive(subscription: subscription)
            
            // 37
            // upstream publisher를 오직 한 번 구독
            guard subscriptions.count == 1 else { return }

            let sink = AnySubscriber(
              // 38
              receiveSubscription: { subscription in
                subscription.request(.unlimited)
              },
              // 39
              receiveValue: { [weak self] (value: Output) -> Subscribers.Demand in
                self?.relay(value)
                return .none
              },
              // 40
              receiveCompletion: { [weak self] in
                self?.complete($0)
              }
            )
            
            upstream.subscribe(sink)
        }
    }
}

extension Publisher {
    func shareReplay(capacity:Int = .max) ->Publishers.ShareReply<Self> {
        return Publishers.ShareReply(upstream: self, capacity: capacity)
    }
}

var logger = TimeLogger(sinceOrigin: true)
let subject = PassthroughSubject<Int,Never>()
let publisher = subject
    .print("shareReplay")
    .shareReplay(capacity: 2)
subject.send(0)

let subscription1 = publisher.sink(
  receiveCompletion: {
    print("subscription1 completed: \($0)", to: &logger)
  },
  receiveValue: {
    print("subscription1 received \($0)", to: &logger)
  }
)

subject.send(1)
subject.send(2)
subject.send(3)

let subscription2 = publisher.sink(
  receiveCompletion: {
    print("subscription2 completed: \($0)", to: &logger)
  },
  receiveValue: {
    print("subscription2 received \($0)", to: &logger)
  }
)

subject.send(4)
subject.send(5)
subject.send(completion: .finished)

var subscription3: Cancellable? = nil

DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
  print("Subscribing to shareReplay after upstream completed")
  subscription3 = publisher.sink(
    receiveCompletion: {
      print("subscription3 completed: \($0)", to: &logger)
    },
    receiveValue: {
      print("subscription3 received \($0)", to: &logger)
    }
  )
}

/*
 shareReplay: receive subscription: (PassthroughSubject) --> 구독은 한 번만
 shareReplay: request unlimited
 shareReplay: receive value: (1)
 +0.05040s: subscription1 received 1
 shareReplay: receive value: (2)
 +0.05166s: subscription1 received 2
 shareReplay: receive value: (3)
 +0.05199s: subscription1 received 3
 +0.05233s: subscription2 received 2
 +0.05236s: subscription2 received 3
 shareReplay: receive value: (4)
 +0.05250s: subscription1 received 4
 +0.05257s: subscription2 received 4
 shareReplay: receive value: (5)
 +0.05284s: subscription1 received 5
 +0.05290s: subscription2 received 5
 shareReplay: receive finished
 +0.05391s: subscription1 completed: finished
 +0.05398s: subscription2 completed: finished
 Subscribing to shareReplay after upstream completed
 +1.10343s: subscription3 received 4
 +1.10366s: subscription3 received 5
 +1.10428s: subscription3 completed: finished

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
