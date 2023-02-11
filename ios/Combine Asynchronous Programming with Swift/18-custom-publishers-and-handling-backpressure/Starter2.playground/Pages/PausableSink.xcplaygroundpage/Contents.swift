import Combine
import Foundation

protocol Pausable {
    var paused: Bool { get }
    func resume()
}

// 객체가 복사되지 않고 라이프사이클 특정시점에 변경이 가능해야 한다 그래서 class
final class PausableSubscriber<Input, Failure:Error>:Subscriber, Pausable, Cancellable {
    
    // combine이 publihser stream을 관리하고 최적화하기 필요??
    let combineIdentifier = CombineIdentifier()
    
    // 3
    // true면 값을 더 받고
    // false면 구독 중지
    let receiveValue: (Input) -> Bool
    
    // 4
    // publisher로 부터 완료 이벤트를 받으면 호출됨
    let receiveCompletion: (Subscribers.Completion<Failure>) -> Void
    
    // 5
    // 중지 이후에 값을 더 요청하기 위해 구독을 저장
    // 필요 없을 떄는 nil값 넣어서 retain cylce 생기지 않게
    private var subscription: Subscription? = nil
    
    // 6
    //
    var paused = false
    
    // 7
    init(receiveValue: @escaping (Input) -> Bool,
         receiveCompletion: @escaping (Subscribers.Completion<Failure>) -> Void) {
        self.receiveValue = receiveValue
        self.receiveCompletion = receiveCompletion
    }
    
    // 8
    func cancel() {
        subscription?.cancel()
        subscription = nil
    }
    
    
    
    func receive(subscription: Subscription) {
        // 나중에 구독 중지 다시 시작을 위해 저장
        self.subscription = subscription
        
        // 즉시 1개의 값 요청
        // 언제 중지가 필요할지 모르니까 1개씩 요청
        subscription.request(.max(1))
    }
    
    func receive(_ input: Input) -> Subscribers.Demand {
        // 새로운 값 받았을 떄 receiveValue 호출해서 paused값 갱신
        paused = receiveValue(input) == false
        
        // paused 이면 .none을 보내서 더 이상 값 안 받는다고 요청
        // 아니면 한 개의 값 요청
        return paused ? .none : .max(1)
    }
    
    func receive(completion: Subscribers.Completion<Failure>) {
        // completion event받은 후 receiveCompletion에 넘겨준다
        // 그 다음 subscription nil로 함, 더 이상 필요 없으니
        receiveCompletion(completion)
        subscription = nil
    }
    
    func resume() {
        guard paused else { return }
        paused = false
        subscription?.request(.max(1))
    }
}

extension Publisher {
    func pausableSink(receiveCompletion:@escaping ((Subscribers.Completion<Failure>)->Void),
                      receiveValue:@escaping((Output)->Bool)) -> Pausable & Cancellable {
        let pausable = PausableSubscriber(receiveValue: receiveValue, receiveCompletion: receiveCompletion)
        self.subscribe(pausable)
        return pausable
    }
}

let subscription = [1,2,3,4,5,6]
    .publisher
// publisher가 값을 가지고 있을 수 없거나 요청할 때깢 ㅣ기다실 수 없을 때 buffer(size:prefetch:whenFull: 사용
// size만큼 값을 가지고 있다가 구독자가 받을 준비가 되면 전달 할 수 있다.
// prefetch 버퍼를 어떻게 채울지( 구독할 떄 한번, 아니면 요청에 따라 버퍼를 채울지 )
// whenFull 버퍼가 가둑 찼을 때 마지막 값을 버릴지, 오래된것을 버릴지, 에러와 함꼐 종료할지
//    .buffer(size: 3, prefetch: ., whenFull: <#T##Publishers.BufferingStrategy<Never>#>)
    .pausableSink { completion in
        print("Pausable subscription completed: \(completion)")
    } receiveValue: { value in
        print("Receive value:\(value)")
        if value % 2 == 1 {
            print("Pausing")
            return false
        }
        return true
    }

let timer = Timer.publish(every: 1, on: .main, in: .common)
    .autoconnect()
    .sink { _ in
        guard subscription.paused else { return }
        print("Subscription is paused, resuming")
        subscription.resume()
    }

//: [Next](5@next)
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
