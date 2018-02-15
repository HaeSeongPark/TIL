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
        
        // Declare an array to store numbers we've already generated
        var generatedNumberArray = [Int]()
        
        // Declare an array to store the generated cards
        var generatedCardsArray = [Card]()
        
        // Randomly generate pairs of cards
        while generatedNumberArray.count < 8{
            // Get a random number
            let randomNumber = arc4random_uniform(13) + 1
            
            // Ensure that the random number isn't one we already have
            if generatedNumberArray.contains(Int(randomNumber)) == false {
                // Log the number
                print("ranomNubmer : \(randomNumber)")
                
                //Store the nnumber into the generatedNumbersArray
                generatedNumberArray.append(Int(randomNumber))
                
                // Create the first card object
                let cardOne = Card()
                cardOne.imageName = "card\(randomNumber)"
                generatedCardsArray.append(cardOne)
                
                let cardTwo = Card()
                cardTwo.imageName = "card\(randomNumber)"
                generatedCardsArray.append(cardTwo)
            }
            // OPTIONAL : Make it so we only have unique pairs of cards
        }
    
        // TODO: Randomize the array
        let randomNumber = Int(arc4random_uniform(UInt32(generatedCardsArray.count)))
        
        for i in 0...generatedCardsArray.count-1 {
            let temporaryStorage = generatedCardsArray[i]
            generatedCardsArray[i] = generatedCardsArray[randomNumber]
            generatedCardsArray[randomNumber] = temporaryStorage
        }
        // Return the array
        return generatedCardsArray
    }
}
