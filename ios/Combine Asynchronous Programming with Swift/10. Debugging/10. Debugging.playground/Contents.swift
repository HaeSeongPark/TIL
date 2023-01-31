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
    .breakpoint(receiveOutput: { value in
        return value > 10 && value < 15 // error: Execution was interrupted, reason: signal SIGTRAP.
    })
    .sink { value in
        print("value \(value)")
    }
