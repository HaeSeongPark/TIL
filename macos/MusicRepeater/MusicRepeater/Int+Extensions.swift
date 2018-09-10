//
//  Int+Extensions.swift
//  MusicRepeater
//
//  Created by rhino Q on 10/09/2018.
//  Copyright © 2018 rhino Q. All rights reserved.
//

import Foundation
/*
 As we need to mutate the properties of our Int, we will need to add the mutating keyword. For the rest of the code, it is pretty straightforward. In particular, the subtract method performs an additional checking to verify if the existing number is valid for subtraction.
 */
extension Int {
    mutating func subtract() {
        self = (self <= 0 ) ? 0 : self - 1
    }
    
    mutating func add() {
        self += 1
    }
}
