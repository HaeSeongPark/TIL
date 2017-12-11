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
    
    var indexOfOneAndOnlyFacUpCard :Int?
    
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
                indexOfOneAndOnlyFacUpCard = nil
            } else{
                // either no cards or 2 cards are face up
                for flipDownIndex in cards.indices{
                    cards[flipDownIndex].isFaceUP = false
                }  
                cards[index].isFaceUP = true
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
        // TODO: Shuffle the cards
        
    }
}
