//
//  Card.swift
//  Concentration
//
//  Created by hellonature on 2017. 12. 10..
//  Copyright © 2017년 rhino. All rights reserved.
//

import Foundation

struct Card
{
    var isFaceUP = false
    var isMatched = false
    var identifier : Int
    
    static var identifierFactory = 0
    
    static func getUniqueIdentifier() -> Int{
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}
