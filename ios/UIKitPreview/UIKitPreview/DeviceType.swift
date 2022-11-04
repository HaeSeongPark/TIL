//
//  DeviceType.swift
//  UIKitPreview
//
//  Created by rhino Q on 2022/11/04.
//

import Foundation

enum DeviceType:CaseIterable {
    case iPhoneSE2
    case iPhone8
    case iPhone12Pro
    case iPhone12ProMax

    var name:String {
        switch self {
        case .iPhoneSE2:
            return "iPhone SE"
        case .iPhone8:
            return "iPhone 8"
        case .iPhone12Pro:
            return "iPhone 12 Pro"
        case .iPhone12ProMax:
            return "iPhone 12 Pro Max"
        }
    }
}
