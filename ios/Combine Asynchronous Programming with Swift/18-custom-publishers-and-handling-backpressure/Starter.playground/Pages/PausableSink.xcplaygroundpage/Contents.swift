import Combine
import Foundation

protocol Pausable {
    var paused:Bool { get }
    func resume()
}

final class PausableSubscriber<Input, Failure:Error>: Subscriber, Pausable, Cancellable {
    let combineIdentifier = CombineIdentifier()
    // subscriber는 unique identifier를 무조건 제공해야한다.
    // 그래야 컴파인이 관리하고 최적화 할 수 있따.
    // true면 값을 더 받을 수 있고
    // false면 값을 받을 수 없다 -> 구독이 중지돼야 한다.
    let receiveValue:(Input) -> Bool
    
    // 퍼블리셔로 부터 completion이벤트를 받으면 호출
    let receiveCompletion:(Subscribers.Completion<Failure>) -> Void
    
    // pause된 후에 더 많은 값을 요청하기 위해 값을 가지고 있음
    // 필요없는데 nil로 해서 리테인사이클 피하기
    private var subscription:Subscription? = nil
    
//    매 Pausable 프로토콜마다 paused 노출???
    var paused = false
    
    init(receiveValue:@escaping (Input) -> Bool,
         receiveCompletion:@escaping (Subscribers.Completion<Failure>)->Void) {
        self.receiveValue = receiveValue
        self.receiveCompletion = receiveCompletion
    }
    
    func receive(subscription: Subscription) {
        self.subscription = subscription
        subscription.request(.max(1))
    }
    
    func receive(_ input: Input) -> Subscribers.Demand {
        paused = receiveValue(input) == false
        return paused ? .none : .max(1)
    }
    
    func receive(completion: Subscribers.Completion<Failure>) {
        receiveCompletion(completion)
        subscription = nil
    }
        
    func resume() {
        guard paused else { return }
        paused = false
        subscription?.request(.max(1))
    }
    
    func cancel() {
        subscription?.cancel()
        subscription = nil
        subscription?.request(.max(1))
    }
    
}

extension Publisher {
    func pausableSink(
        receiveCompletion: @escaping((Subscribers.Completion<Failure>) -> Void),
        receiveValue: @escaping((Output)->Bool)) -> Pausable & Cancellable {
            let pausable = PausableSubscriber(
                receiveValue:receiveValue,
            receiveCompletion: receiveCompletion)
            
            self.subscribe(pausable)
            return pausable
        }
}

let subscription = [1,2,3,4,5,6].publisher
    .pausableSink(receiveCompletion: { completion in
        print("Pausable subscription completed: \(completion)")
    }, receiveValue: { value in
        print("Receive value: \(value)")
        if value % 2 == 1 {
            print("Pausing")
            return false
        }
        return true
    })
let timer = Timer.publish(every: 1, on: .main, in: .common)
    .autoconnect()
    .sink { _ in
        guard subscription.paused else { return }
        print("Subscription is paused, resuming")
        subscription.resume()
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
