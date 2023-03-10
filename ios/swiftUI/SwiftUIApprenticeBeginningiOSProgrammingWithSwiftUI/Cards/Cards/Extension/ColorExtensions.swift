//
//  ColorExtensions.swift
//  Cards
//
//  Created by rhino Q on 2023/03/10.
//

import SwiftUI

extension Color {
  static let colors: [Color] = [
    .green, .red, .blue, .gray, .yellow, .pink, .orange, .purple
  ]
    
    static func random() -> Color {
        colors.randomElement() ?? .black
    }
}
