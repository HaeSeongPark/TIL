//
//  ViewController.swift
//  Concentration
//
//  Created by hellonature on 2017. 12. 7..
//  Copyright © 2017년 rhino. All rights reserved.
//

import UIKit

class ConcentrationViewController: UIViewController
{
    private lazy var game  = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
    
      var numberOfPairsOfCards: Int{
        return (cardButtons.count+1) / 2
    }
    
    private(set) var flipCount = 0 {
        didSet{
            updateFlipCountLabel()
        }
    }
    
    private func updateFlipCountLabel() {
        let attributes: [NSAttributedStringKey:Any] = [
            .strokeWidth: 5.0,
            .strokeColor : #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        ]
        
        let attributedString = NSAttributedString(string: "Flips:\(flipCount)", attributes: attributes
        )
        flipCountLable.attributedText = attributedString
    }
    
    @IBOutlet private weak var flipCountLable: UILabel! {
        didSet {
            updateFlipCountLabel()
        }
    }
    
    @IBOutlet private var cardButtons: [UIButton]!
    
    @IBAction private func touchCard(_ sender: UIButton)
    {
        flipCount += 1
        if let cardNumber = cardButtons.index(of: sender)
        {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }
        else
        {
            print("chosen card was not in cardButtons")
        }
    }
    
    
    @IBAction private func startNewGame(_ sender: UIButton) {
        game = Concentration(numberOfPairsOfCards: (cardButtons.count+1)/2)
//        emojiChoices = ["🦇", "😱", "🙀", "👿","🎃","👻","🍭","🍬","🍎"];
        emojiChoices = "🦇😱🙀👿🎃👻🍭🍬🍎"
        updateViewFromModel()
        flipCount = 0
    }
    
    
    private func updateViewFromModel(){
        if cardButtons != nil { 
            for index in cardButtons.indices{
                let button = cardButtons[index]
                let card = game.cards[index]
                if card.isFaceUP
                {
                    button.setTitle(emoji(for:card), for: .normal)
                    button.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
                }
                else
                {
                    button.setTitle("", for: .normal)
                    button.backgroundColor = card.isMatched ? #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0) : #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
                }
            }
        }
    }
//    private var emojiChoices = ["🦇", "😱", "🙀", "👿","🎃","👻","🍭","🍬","🍎"]
    var theme: String? {
        didSet {
            emojiChoices = theme ?? ""
            emoji = [:]
            updateViewFromModel()
        }
    }
    
    private var emojiChoices = "🦇😱🙀👿🎃👻🍭🍬🍎"

    
    private var emoji = [Card:String]()
    
    private func emoji(for card: Card) -> String {
        if emoji[card] == nil, emojiChoices.count > 0 {
//            emoji[card] = emojiChoices.remove(at: emojiChoices.count.arc4random)
            let randomStringIndex = emojiChoices.index(emojiChoices.startIndex, offsetBy: emojiChoices.count.arc4random)
            emoji[card] = String(emojiChoices.remove(at: randomStringIndex))
        }
        return emoji[card] ?? "?"
    }
}

// MARK: extension Int
extension Int{
    var arc4random:Int{
        if self > 0{
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(  UInt32(abs(self))))
        } else {
            return 0
        }
    }
}
