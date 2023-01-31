import Foundation
import Combine


let shared = URLSession.shared
    .dataTaskPublisher(for: URL(string: "https://www.raywenderlich.com")!)
    .map(\.data)
    .print("shared")
    .share()

print("subscribing first")

let sub1 = shared.sink(receiveCompletion: { _ in },
                       receiveValue: { print("subscription1 received: '\($0)'")})

print("subscribing second")

//let sub2 = shared.sink(receiveCompletion: { _ in },
//                       receiveValue: { print("subscription2 received: '\($0)'")})


/*
 subscribing first
 shared: receive subscription: (DataTaskPublisher)
 shared: request unlimited -> 처음 구독하면 DataTaskPublisher를 트리거 한다.
 subscribing second // 두 번쨰 구독은 그냥 publisher에 connent
 shared: receive value: (267036 bytes) // 리퀘스트가 끝나면
 subscription2 received: '267036 bytes' // 같은 값 공유 받는다.
 subscription1 received: '267036 bytes'
 shared: receive finished

 */
// share 없는 버전
/*
 subscribing first
 shared: receive subscription: (DataTaskPublisher)
 shared: request unlimited
 subscribing second
 shared: receive subscription: (DataTaskPublisher)
 shared: request unlimited
 shared: receive value: (267036 bytes)
 subscription1 received: '267036 bytes'
 shared: receive finished
 shared: receive value: (267036 bytes)
 subscription2 received: '267036 bytes'
 shared: receive finished

 */
// sub2가 리퀘스트가 끝나고(pulisher가 completed되고나서) 구독하면?
var sub2:AnyCancellable? = nil
DispatchQueue.main.asyncAfter(deadline: .now()+5) {
    print("subscribing second")
    sub2 =
    shared.sink(receiveCompletion: { print("sub2 completion \($0)") },
                           receiveValue: { print("subscription2 received: '\($0)'")})

}
/*
 completion finished 만 받는다.
 
 sub2 completion finished
 */
