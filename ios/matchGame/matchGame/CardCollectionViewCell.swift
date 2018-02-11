//
//  CardCollectionViewCell.swift
//  matchGame
//
//  Created by rhino Q on 2018. 1. 24..
//  Copyright © 2018년 rhino Q. All rights reserved.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var frontImageView: UIImageView!
    @IBOutlet weak var backImageView: UIImageView!
    
    var card:Card?
    
    func setCard(_ card:Card) {
        
        // Keep track of the card that gets passed in
        self.card = card
        
        if card.isMatched == true {
            // if the card has been matched, the make the image views invisible
            backImageView.alpha = 0
            frontImageView.alpha = 0
            
            return
        } else {
            // If the card hasn't benn matched, then make the image views visible
            backImageView.alpha = 1
            frontImageView.alpha = 1
        }
        frontImageView.image = UIImage(named: card.imageName)
        
        // Determine if the card is in a flipped up state or flipped down state
        if card.isFlipped == true {
            UIView.transition(from: backImageView, to: frontImageView, duration: 0, options: [.transitionFlipFromLeft, .showHideTransitionViews], completion: nil)
        } else {
                UIView.transition(from: frontImageView, to: backImageView, duration: 0, options: [.transitionFlipFromRight, .showHideTransitionViews], completion: nil)
        }
//        print("self.card?.imageName : \(self.card?.imageName)")
//        print("frontImageView.isHidden : \(frontImageView.isHidden)")
//        print("backImageView.isHidden : \(backImageView.isHidden)")
//        print("self.card.isFlipe : \(self.card?.isFlipped)")
        
    }
    func flip() {
        UIView.transition(from: backImageView, to: frontImageView, duration: 0.3, options: [.transitionFlipFromLeft, .showHideTransitionViews], completion: nil)
    }
    
    func flipBack() {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5) {
                UIView.transition(from: self.frontImageView, to: self.backImageView, duration: 0.3, options: [.transitionFlipFromRight, .showHideTransitionViews], completion: nil)
        }

    }
    
    func remove(){
        // removes both imageviews from being visible
        // TODO: Animate it
        backImageView.alpha = 0
        
        UIView.animate(withDuration: 0.3, delay: 0.5, options: .curveEaseOut, animations: {
            self.frontImageView.alpha = 0
        }, completion: nil)
    }
}
