//
//  ViewController.swift
//  Concentration
//
//  Created by hellonature on 2017. 12. 7..
//  Copyright © 2017년 rhino. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    private lazy var game  = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
    
    private var numberOfPairsOfCards: Int{
        return (cardButtons.count+1) / 2
    }
    
    private(set) var flipCount = 0 {
        didSet{
            flipCountLable.text = "Flipss : \(flipCount)"
        }
    }
    
    @IBOutlet private weak var flipCountLable: UILabel!
    
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
        emojiChoices = ["🦇", "😱", "🙀", "👿","🎃","👻","🍭","🍬","🍎"];
        updateViewFromModel()
        flipCount = 0
    }
    
    
    private func updateViewFromModel(){
        for index in cardButtons.indices{
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUP
            {
                button.setTitle(emoji(for:card), for: .normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            }
            else
            {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1)
            }
        }
    }
    private var emojiChoices = ["🦇", "😱", "🙀", "👿","🎃","👻","🍭","🍬","🍎"];
    
    private var emoji = [Int:String]()
    
    private func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        return emoji[card.identifier] ?? "?"
    }
}
