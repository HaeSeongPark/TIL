//
//  TimeoutTask.swift
//  BlabberTests
//
//  Created by rhino Q on 2023/02/24.
//

import Foundation

class TimeoutTask<Success> {
  let nanoseconds: UInt64
  let operation: @Sendable () async throws -> Success
  
  private var continuation:CheckedContinuation<Success, Error>?
  
  var value:Success {
    get async throws {
      try await withCheckedThrowingContinuation { continuation in
        self.continuation = continuation
        
        Task {
          try await Task.sleep(nanoseconds:nanoseconds)
          self.continuation?.resume(throwing: TimeoutError())
          self.continuation = nil
        }
        
        Task {
          let result = try await operation()
          self.continuation?.resume(returning: result)
          self.continuation = nil
        }
      }
    }
  }
  
  // @escaping 클로저를 저장해서 init함수 영역 밖에서 실행
  // @Sendable 클로저나 함수에 프로토콜을 채택할 수 없는데 @Sendable을 하면 클로저나 함수에 Sendable protocol을 채택할 수 있다.
  // 이는 동시성 도메인간에 전송해도 안전하다 -> thread safe하다 라는 의미
  // async : concurrent asynchronous 맥락에서 실행되야 한다.
  // throws : 에러를 발생할 수 있다.
  init(seconds: TimeInterval, operation: @escaping @Sendable () async throws -> Success) {
    self.nanoseconds = UInt64(seconds * 1_000_000_000)
    self.operation = operation
  }
  
  func cancel() {
    continuation?.resume(throwing: CancellationError())
    continuation = nil
  }
}

extension TimeoutTask {
  struct TimeoutError:LocalizedError {
    var errorDescription: String? {
      return "The operation timed out."
    }
  }
}
