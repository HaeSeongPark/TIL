//
//  ViewController.swift
//  Calculator3
//
//  Created by cord7894 on 2017. 7. 1..
//  Copyright © 2017년 rhino. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var displayLabel: UILabel!
    
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    private var userIsInMiddleOfTyping = false
    
    @IBAction private func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        
        
        if userIsInMiddleOfTyping{
            let currentDisplay = displayLabel.text!
            if digit != "." || currentDisplay.range(of: ".") == nil {
                displayLabel.text = currentDisplay + digit
            }
        } else {
            if digit == "."{
                displayLabel.text = "0."
            } else {
            displayLabel.text = digit
            }
            userIsInMiddleOfTyping = true
        }
    }
    
    private var displayValue:Double{
        get{
            return Double(displayLabel.text!)!
        }
        set{
            displayLabel.text = String(newValue)
        }
    }
    
    private var brain = CalculatorBrain()
    
    @IBAction private func performOperation(_ sender: UIButton) {
        if userIsInMiddleOfTyping{
            brain.sender(input: displayValue)
            userIsInMiddleOfTyping = false
        }
        
        if let symbol = sender.currentTitle{
            brain.peroformOperation(symbol: symbol)
        }

        displayValue = brain.result
        descriptionLabel.text = brain.getDescription()
    }
    
    @IBAction private func backspace(_ sender: UIButton) {
        var currentDisplay = displayLabel.text!
        switch currentDisplay.characters.count {
        case let x where x > 1:
            currentDisplay.remove(at: currentDisplay.index(before: currentDisplay.endIndex))
            displayLabel.text = currentDisplay
        case let x where x == 1:
           displayValue = 0
           userIsInMiddleOfTyping = false
        default:
            break
        }
    }
}

