//
//  AnyShape.swift
//  Cards
//
//  Created by rhino Q on 2023/03/17.
//

import SwiftUI

struct AnyShape: Shape {
    private let path:(CGRect) -> Path
    
    init<CustomShape: Shape>(_ shape: CustomShape) {
      self.path = { rect in
        shape.path(in: rect)
      }
    }
    
    func path(in rect: CGRect) -> Path {
        path(rect)
    }
}
