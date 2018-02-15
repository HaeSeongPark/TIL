//
//  ViewController.swift
//  matchGame
//
//  Created by rhino Q on 2018. 1. 23..
//  Copyright © 2018년 rhino Q. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate{
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var collectionview: UICollectionView!
    var model = CardModel()
    var cardArray = [Card]()
    
    var firstFlippedCardIndex:IndexPath?
    var timer:Timer?
    var miliiseconds:Float = 1000 * 10 // 10 seconds
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Call the getCards method of the card model
        cardArray = model.getCards()
        
        collectionview.delegate = self
        collectionview.dataSource = self
        
        timer = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(timerElased), userInfo: nil, repeats: true)
        RunLoop.main.add(timer!, forMode: .commonModes)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        SoundManager.playSound(.shuffle)
    }

    // MARK: Timer Methods
    @objc func timerElased(){
        miliiseconds -= 1
        
        // Convert to seconds
        let seconds = String(format: "%.2f", miliiseconds/1000)
        timerLabel.text = "Time Remaining: \(seconds)"
        
        // When the timer has reached 0
        if miliiseconds <= 0 {
            // Stop the timer
            timer?.invalidate()
            timerLabel.textColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
            
            // Check if there are any cards unmatched
            checkGameEnded()
        }
    }

    // MARK: - UICollectionVIew Protocol Methods
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cardArray.count
    }
    
//    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
//        print("didEndDisplaying \(indexPath.row)")
//    }
//
//    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
//        print("willDisplay \(indexPath.row)")
//    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
//        print("cellForItemAt \(indexPath.row)")
        
        // Get an CardCollecttionViewCell object
        let cell = collectionview.dequeueReusableCell(withReuseIdentifier: "CardCell", for: indexPath) as! CardCollectionViewCell
        
        // Get the card that the collection view is trying to display
        let card = cardArray[indexPath.row]
        
        // Set that card for the cell
        cell.setCard(card)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        // Check if there's any time left
        if miliiseconds <= 0 {
            return
        }
        
        let cell = collectionView.cellForItem(at: indexPath) as! CardCollectionViewCell
        
        // Get the card that the user selected
        let card = cardArray[indexPath.row]
        
        if card.isFlipped == false && card.isMatched == false {
            // Flip the card
            cell.flip()
            
            // Play the flip sound
            SoundManager.playSound(.flip)
            
            // Set the status of the card
            card.isFlipped = true
            
            // Determine if it's the first card or second card that's flipped over
            
            if firstFlippedCardIndex == nil {
                firstFlippedCardIndex = indexPath
            } else {
                // This is the second card being flipped
                // TODO: Perform the matching logic
                checkForMathces(indexPath)
                
            }
        }
//        } else {
//            // Flip the card back
//            cell.flipBack()
//
//            // Set the status of the card
//            card.isFlipped = false
//        }
    } // End the didselectItemAt method
    
    //MARK: - Game Logic Methods
    func checkForMathces(_ secondFlippedCardIndex:IndexPath){
        // Get the cells for the two cards that were revealed
        let cardOneCell = collectionview.cellForItem(at: firstFlippedCardIndex!) as? CardCollectionViewCell
        let cardTwoCell = collectionview.cellForItem(at: secondFlippedCardIndex) as? CardCollectionViewCell
        
        
        // Get the cards for the two cards that were  revealed
        let cardOne = cardArray[firstFlippedCardIndex!.row]
        let cardTwo = cardArray[secondFlippedCardIndex.row]
        
        // Compare the two cards
        if cardOne.imageName == cardTwo.imageName {
            // It's a match
            
            // Play sound
            SoundManager.playSound(.match)
            
            // Set the statuses of the cards
            cardOne.isMatched = true
            cardTwo.isMatched = true
            
            // remove the cards from the grid
            cardOneCell?.remove()
            cardTwoCell?.remove()
            
            // Check if there are any cards left unmatched
            checkGameEnded()
            
        } else {
            // It's not a match
            
            // Play sound
            SoundManager.playSound(.nomatch)
            
            // Set the statuses of the cards
            cardOne.isFlipped = false
            cardTwo.isFlipped = false
            
            cardOneCell?.flipBack()
            cardTwoCell?.flipBack()
            
            // Flip both cards back
        }
        // Tell the collectionview to reload the cell of the first card
        // if it is nil
        if cardOneCell == nil {
            collectionview.reloadItems(at: [firstFlippedCardIndex!])
        }
        // Reset the property that tracks the first card flipped
        firstFlippedCardIndex = nil
    }
    
    func checkGameEnded(){
        // Determine if there are any cards unmatched
        var isWon = true
        
        for card in cardArray{
            if card.isMatched == false {
                isWon = false
                break
            }
        }
        
        // Messaging variables
        var title = ""
        var message = ""
        
        // If not, then user has won, stop the timer
        if isWon == true {
            if miliiseconds > 0 {
                timer?.invalidate()
            }
            title = "Congratulations!"
            message = "You've won"
        } else {
            // If there are unmatched cards, check if there's any time left
            if miliiseconds > 0 {
                return
            }
            title = "Game Over"
            message = "You've lost"
        }
        
        // Show won/lost messging
        showAlert(title, message)
    }
    
    func showAlert(_ title:String, _ message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        
        alert.addAction(alertAction)
        present(alert, animated: true, completion: nil)
    }
} // End ViewController class

