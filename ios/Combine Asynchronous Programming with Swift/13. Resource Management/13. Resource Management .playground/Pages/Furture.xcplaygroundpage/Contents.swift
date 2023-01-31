import Foundation
import Combine

func performSomeWork() throws -> Int {
  print("Performing some work and returning a result")
  return 5
}

// Future도 share가능
// subscribers 없어도 바로 시작
// Future is class not a struct
// 한 번만 동작, 값 하나 구독자들한테 전달
// stream이 아니다.

let future = Future<Int,Error> { fulfilll in
    do {
        let reulst = try performSomeWork()
        fulfilll(.success(reulst))
    } catch {
        fulfilll(.failure(error))
    }
}

print("Subscribing to future...")

let sub1 = future
    .sink(receiveCompletion: { _ in print("sub1 completed")},
          receiveValue: { print("sub1 received \($0)")})

let sub2 = future
    .sink(receiveCompletion: { _ in print("sub2 completed")},
          receiveValue: { print("sub2 received \($0)")})

/*
 Performing some work and returning a result
 Subscribing to future...
 sub1 received 5
 sub1 completed
 sub2 received 5
 sub2 completed

 */
