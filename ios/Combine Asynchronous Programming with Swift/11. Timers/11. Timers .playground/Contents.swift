import Foundation
import Combine

//let publisher = Timer
//    .publish(every: 1.0, on: .main, in: .common)
//    .autoconnect()
//    .scan(0) { counter, _ in
//        counter + 1
//    }
//    .sink { counter in
//        print("Counter is \(counter)")
//    }
// on(runLoop) 타이머가 실행되는 런 루프
// in(mode) 타이머를 실행할 런 루프 모드


let queue = DispatchQueue.main

let source = PassthroughSubject<Int, Never>()

var counter = 0

let cancellable = queue.schedule(after: queue.now,
                                 interval: .seconds(1)) {
    source.send(counter)
    counter += 1
}

let subscription = source.sink {
    print("Timer emiited \($0)")
}
