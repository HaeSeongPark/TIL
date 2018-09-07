//
//  BulletPoint.swift
//  NSTextView
//
//  Created by rhino Q on 07/09/2018.
//  Copyright © 2018 rhino Q. All rights reserved.
//

import Foundation

// just nameSapce?
enum BulletPoint {
    
    // text - paragraph
    static func isCheckList(text: String) -> Bool {
        return text.contains("- ")
    }
}
