//
//  Story.swift
//  HackerNewsUIKit
//
//  Created by rhino Q on 2023/02/01.
//

import Foundation

public struct Story: Codable {
  public let id: Int
  public let title: String
  public let by: String
  public let time: TimeInterval
  public let url: String
}

extension Story: Comparable {
  public static func < (lhs: Story, rhs: Story) -> Bool {
    return lhs.time > rhs.time
  }
}

extension Story: CustomDebugStringConvertible {
  public var debugDescription: String {
    return "\n\(title)\nby \(by)\n\(url)\n-----"
  }
}

extension Story:Hashable {
//    func hash(into hasher: inout Hasher) {
//      hasher.combine(id)
//    }
//
//    static func == (lhs: Video, rhs: Video) -> Bool {
//      lhs.id == rhs.id
//    }
}
