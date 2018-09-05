//
//  MutableCollection.swift
//  cocoaSwiftPlayer
//
//  Created by rhino Q on 05/09/2018.
//  Copyright © 2018 rhino Q. All rights reserved.
//

import Foundation

extension MutableCollection where Index == Int {
    mutating func shuffleInPlace() {
        if count < 2 { return }
        
        for i in 0..<count - 1 {
            let j = Int(arc4random_uniform(UInt32(count-i))) + 1
            guard i != j else { continue }
            self.swapAt(i, j)
        }
    }
}
