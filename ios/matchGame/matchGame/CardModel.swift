//
//  CardModel.swift
//  matchGame
//
//  Created by rhino Q on 2018. 1. 24..
//  Copyright © 2018년 rhino Q. All rights reserved.
//

import Foundation

class CardModel{
    func getCards() -> [Card]{
        // Declare an array to store the generated cards
        var generatedCardsArray = [Card]()
        
        // Randomly generate pairs of cards
        for _ in 1...8{
            // Get a random number
            let randomNumber = arc4random_uniform(13) + 1
            
            // Log the number
            print("ranomNubmer : \(randomNumber)")
            
            // Create the first card object
            let cardOne = Card()
            cardOne.imageName = "card\(randomNumber)"
            generatedCardsArray.append(cardOne)
            
            let cardTwo = Card()
            cardTwo.imageName = "card\(randomNumber)"
            generatedCardsArray.append(cardTwo)
            
            // OPTIONAL : Make it so we only have unique pairs of cards

        }
    
        // TODO: Randomize the array
        
        
        // Return the array
        return generatedCardsArray
    }
}
