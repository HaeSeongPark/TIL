//
//  main.swift
//  UnitConverter
//
//  Created by rhino Q on 2018. 3. 5..
//  Copyright © 2018년 rhino Q. All rights reserved.
//

import Foundation

//let cm:String = "120cm"
//let cmIndex = cm.index(of: "c") ?? cm.endIndex
//let numberOfCm = cm[..<cmIndex]
//let doubleOfCm = Double(numberOfCm)!
//let numberOfm = doubleOfCm * 0.01
//print("\(numberOfm)m")



let m:String = "1.86m"
let mIndex = m.index(of: "m") ?? m.endIndex
let numberOfm = m[..<mIndex]
let doubleOfm = Double(numberOfm)!
let numberOfcm = Int(doubleOfm * 100)
print("\(numberOfcm)cm")

