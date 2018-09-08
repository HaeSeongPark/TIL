//
//  BulletPoint.swift
//  NSTextView
//
//  Created by rhino Q on 07/09/2018.
//  Copyright © 2018 rhino Q. All rights reserved.
// https://material.io/tools/icons/?search=check&icon=radio_button_checked&style=baseline

import Foundation
import Cocoa

// just nameSapce?
enum BulletPoint:String {
    static let regex = try! NSRegularExpression(pattern: "(\\uE837)", options: [])
    case Bullet = "\u{E837} "
    
    static let font = NSFont(name: "MaterialIcons-Regular", size: 13)
    
    // text - paragraph
    static func isCheckList(text: String) -> Bool {
        return text.contains(BulletPoint.Bullet.rawValue)
    }
    
    var chracter: String {
        return "\u{E837} "
    }
}
