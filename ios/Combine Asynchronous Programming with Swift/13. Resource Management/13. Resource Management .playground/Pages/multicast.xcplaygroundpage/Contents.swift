import Foundation
import Combine
// share에 문제를 multicast로 해결
// multicast는 subject를 이용해서 구독자들한테 값 전달
// multicast는 ConnectablePublisher로 connect() 될 떄 구독시작 및 이벤트 방출
let subject = PassthroughSubject<Data, URLError>()

let multicasted = URLSession.shared
  .dataTaskPublisher(for: URL(string: "https://www.raywenderlich.com")!)
  .map(\.data)
  .print("multicast")
  .multicast(subject: subject)


let subscription1 = multicasted
  .sink(
    receiveCompletion: { _ in },
    receiveValue: { print("subscription1 received: '\($0)'") }
  )

let subscription2 = multicasted
  .sink(
    receiveCompletion: { _ in },
    receiveValue: { print("subscription2 received: '\($0)'") }
  )

let cancellable = multicasted.connect()

/*
 autoconnect()는 share()처럼 움직임 // 바로 구독하고 이벤트 방출
 */
