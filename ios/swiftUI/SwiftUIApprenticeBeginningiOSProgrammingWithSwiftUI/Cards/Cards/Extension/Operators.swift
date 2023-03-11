//
//  Operators.swift
//  Cards
//
//  Created by rhino Q on 2023/03/10.
//

import Foundation

func + (left: CGSize, right:CGSize) -> CGSize {
    CGSize(
        width: left.width + right.width,
        height: left.height + right.height)
}

func * (left: CGSize, right: CGFloat) -> CGSize {
  CGSize(
    width: left.width * right,
    height: left.height * right
  )
}
