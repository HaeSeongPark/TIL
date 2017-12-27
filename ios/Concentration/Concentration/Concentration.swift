//
//  Concentration.swift
//  Concentration
//
//  Created by hellonature on 2017. 12. 10..
//  Copyright © 2017년 rhino. All rights reserved.
//

import Foundation

struct Concentration
{
    private(set) var cards = [Card]()
    
    private var indexOfOneAndOnlyFacUpCard :Int? {
        get{
            var foundIndex: Int?
            for index in cards.indices{
                if cards[index].isFaceUP {
                    if foundIndex == nil {
                        foundIndex = index
                    } else {
                        return nil
                    }
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
    
    mutating func chooseCard(at index:Int)
    {
        assert(cards.indices.contains(index), "Concentration.chooseCard(at:\(index)): chosen index not in the cards")
        if !cards[index].isMatched
        {
            if let matchIndex = indexOfOneAndOnlyFacUpCard, matchIndex != index
            {
                // check if cards match
                if cards[matchIndex] == cards[index]
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
        assert(numberOfPairsOfCards > 0, "Concentration.init(\(numberOfPairsOfCards): you must at least one pair of cards")
        for _ in 0..<numberOfPairsOfCards
        {
            let card = Card()
            cards += [card, card]
        }
        cards.shuffle()
    }
}
extension Array{
    mutating func shuffle(){
        for index in self.indices{
            let randomIndex = self.count.arc4random
            (self[index], self[randomIndex]) = (self[randomIndex], self[index])
        }
    }
}
