import Foundation
import Combine

struct DispatchTimerConfiguration {
    // 타이머가 실행된 큐, 선택사항 -> 타이머가 선택할 큐에서 실행
    let queue:DispatchQueue?
    
    // 타이머가 실행되는 가녁
    let interval:DispatchTimeInterval
    
    //  deadline 후에 시스템이 타이머 이벤트를 전달을 지연할 수 있는 시간??
    let leeway:DispatchTimeInterval
    
    // 타이머가 발생할 이벤트 수
    let times:Subscribers.Demand
}

extension Publishers {
    struct DispatchTimer: Publisher {
        // 5
        typealias Output = DispatchTime
        typealias Failure = Never
        // 6
        let configuration: DispatchTimerConfiguration
        
        init(configuration: DispatchTimerConfiguration) {
            self.configuration = configuration
        }
        
        func receive<S>(subscriber: S) where S : Subscriber, Failure == S.Failure, Output == S.Input {
            let subscription = DispatchTimerSubscription(
                subscriber:subscriber,
                configuration:configuration)
            
            subscriber.receive(subscription: subscription)
        }
    }
}

private final class DispatchTimerSubscription
  <S: Subscriber>: Subscription where S.Input == DispatchTime {
    
    
    let configuration: DispatchTimerConfiguration
    
    // 타이머가 이벤트 방출할 최대 수
    var times: Subscribers.Demand
    
    // 현재 요청 수
    var requested: Subscribers.Demand = .none
    
    var source: DispatchSourceTimer? = nil
    
    // 구독은 구독자를 리테인해야한다. 완료,실패,취소 되기 전까지는
    var subscriber: S?

    init(subscriber: S,
         configuration: DispatchTimerConfiguration) {
      self.configuration = configuration
      self.subscriber = subscriber
      self.times = configuration.times
    }

    
    func request(_ demand: Subscribers.Demand) {
        guard times > .none else {
            // 최대 수 만큼 다 보냈으면 완료 이벤트 보낸다.
            subscriber?.receive(completion: .finished)
            return
        }
        
        requested += demand
        
        if source == nil, requested > .none {
            let source = DispatchSource.makeTimerSource(queue: configuration.queue)
            
            source.schedule(deadline: .now() + configuration.interval,
                            repeating: configuration.interval,
                            leeway: configuration.leeway)
            
            source.setEventHandler { [weak self] in
                guard let self = self, self.requested > .none else { return }
                
                self.requested -= .max(1)
                self.times -= .max(1)
                
                _ = self.subscriber?.receive(.now())
                
                if self.times == .none {
                    self.subscriber?.receive(completion: .finished)
                }
            }
            
            self.source = source
            source.activate()
        }
    }
    
    func cancel() {
      source = nil
      subscriber = nil
    }
}


extension Publishers {
    static func timer(queue:DispatchQueue? = nil,
                      interval:DispatchTimeInterval,
                      leewat:DispatchTimeInterval = .nanoseconds(0),
                      times:Subscribers.Demand = .unlimited) -> Publishers.DispatchTimer {
        return Publishers.DispatchTimer(configuration: .init(queue: queue,
                                                             interval: interval,
                                                             leeway: leewat,
                                                             times: times))
    }
}

var logger = TimeLogger(sinceOrigin: true)

let publihser = Publishers.timer(interval: .seconds(1), times: .max(6))

let subscription = publihser.sink { time in
    print("Timer emits: \(time)", to: &logger)
}

DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) {
    subscription.cancel()
}
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
