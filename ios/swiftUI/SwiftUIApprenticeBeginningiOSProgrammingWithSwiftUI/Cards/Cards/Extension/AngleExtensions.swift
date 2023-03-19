//
//  AngleExtensions.swift
//  Cards
//
//  Created by rhino Q on 2023/03/19.
//

import SwiftUI

extension Angle:Codable {
    enum CodingKeys:CodingKey {
        case degrees
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let degress = try container.decode(Double.self, forKey: .degrees)
        self.init(degrees: degress)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(degrees, forKey: .degrees)
    }
}

