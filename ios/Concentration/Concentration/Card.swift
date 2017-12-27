//
//  Card.swift
//  Concentration
//
//  Created by hellonature on 2017. 12. 10..
//  Copyright © 2017년 rhino. All rights reserved.
//

import Foundation

struct Card:Hashable
{
    var hashValue:Int {
        return identifier
    }
    
    static func ==(lhs: Card, rhs: Card) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    
    var isFaceUP = false
    var isMatched = false
    private var identifier : Int
    
    private static var identifierFactory = 0
    
    private static func getUniqueIdentifier() -> Int{
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}
