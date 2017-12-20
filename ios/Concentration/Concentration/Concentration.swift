//
//  Concentration.swift
//  Concentration
//
//  Created by hellonature on 2017. 12. 10..
//  Copyright © 2017년 rhino. All rights reserved.
//

import Foundation

class Concentration
{
    var cards = [Card]()
    
    var indexOfOneAndOnlyFacUpCard :Int? {
        get{
            var foundIndex: Int?
            for index in cards.indices{
                if foundIndex == nil {
                    foundIndex = index
                } else {
                    return nil
                }
            }
            return foundIndex
        }
        
        set{
            for index in cards.indices{
                cards[index].isFaceUP = (index == newValue)
            }
        }
    }
    
    func chooseCard(at index:Int)
    {
        if !cards[index].isMatched
        {
            if let matchIndex = indexOfOneAndOnlyFacUpCard, matchIndex != index
            {
                // check if cards match
                if cards[matchIndex].identifier == cards[index].identifier
                {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUP = true
            }
            else
            {
                indexOfOneAndOnlyFacUpCard = index
            }
        }
    }
    init(numberOfPairsOfCards:Int)
    {
        for _ in 0..<numberOfPairsOfCards
        {
            let card = Card()
            cards += [card, card]
        }
        for index in cards.indices{
            let randomIndex = Int(arc4random_uniform(UInt32(cards.count)))
            (cards[index], cards[randomIndex]) = (cards[randomIndex], cards[index])
        }
    }
}
