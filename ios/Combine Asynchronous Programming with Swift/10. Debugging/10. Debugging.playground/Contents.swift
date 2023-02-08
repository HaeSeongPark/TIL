import Foundation
import Combine

//class TimeLogger:TextOutputStream {
//    private var previos = Date()
//    private let formatter = NumberFormatter()
//
//    init() {
//        formatter.maximumFractionDigits = 5
//        formatter.minimumFractionDigits = 5
//    }
//
//    func write(_ string: String) {
//        let trimmed = string.trimmingCharacters(in: .whitespacesAndNewlines)
//        guard !trimmed.isEmpty else { return }
//        let now = Date()
//        print("+\(formatter.string(for: now.timeIntervalSince(previos))!)s: \(string)")
//
//        previos = now
//    }
//}
//
//let subscription = (1...3).publisher
//    .print("publisher",to: TimeLogger())
//    .sink { _ in }

//let request = URLSession.shared
//  .dataTaskPublisher(for: URL(string: "https://www.raywenderlich.com/")!)
//
//let subscription = request
//    .handleEvents(receiveSubscription: { _ in
//        print("Network reqest will start")
//    }, receiveOutput: { _ in
//        print("Network request data received")
//    }, receiveCancel: {
//        print("Network request cancelled")
//    })
//  .sink(receiveCompletion: { completion in
//    print("Sink received completion: \(completion)")
//  }) { (data, _) in
//    print("Sink received data: \(data)")
//  }
//

let subs = (10...20).publisher
//    .breakpointOnError() // 업스트림에서 에러가 나면 엑스코드가 해당라인에 break를 건다.
// breakpoint(receiveSubscription:receiveOutput:receiveCompletion:).
// 구독이나 완료에서도 사용할 수 있지만 취소는 안 됨
    .breakpoint(receiveOutput: { value in
        return value > 10 && value < 15 // error: Execution was interrupted, reason: signal SIGTRAP.
    })
    .sink { value in
        print("value \(value)")
    }
/* 11이면 break가 걸리는데 sink에서 print도 찍히네
 value 10
 value 11
 */
