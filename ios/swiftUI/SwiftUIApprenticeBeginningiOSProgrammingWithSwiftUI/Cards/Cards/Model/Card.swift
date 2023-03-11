//
//  Card.swift
//  Cards
//
//  Created by rhino Q on 2023/03/11.
//

import SwiftUI

struct Card:Identifiable {
    let id = UUID()
    var backgroundColor:Color = .yellow
    var elements:[CardElement] = []
    
    mutating func remove(_ element:CardElement) {
        if let index = element.index(in: elements) {
            elements.remove(at: index)
        }
    }
}
