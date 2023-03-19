//
//  Transform.swift
//  Cards
//
//  Created by rhino Q on 2023/03/10.
//

import SwiftUI

struct Transform {
    var size = CGSize(width: Settings.defaultElementSize.width, height: Settings.defaultElementSize.height)
    var rotation:Angle = .zero
    var offset:CGSize = .zero
}

extension Transform:Codable {}
