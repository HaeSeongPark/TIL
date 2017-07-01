//
//  ViewController.swift
//  Calculator2
//
//  Created by cord7894 on 2017. 7. 1..
//  Copyright © 2017년 rhino. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var displayLabel: UILabel!
    
    private var userIsInMiddleOfTyping = false
    
    @IBAction private func inputDigit(_ sender: UIButton) {
        let inputedDigit = sender.currentTitle!
        if userIsInMiddleOfTyping{
            let currentDisplay = displayLabel.text!
            displayLabel.text = currentDisplay + inputedDigit
        } else {
            displayLabel.text = inputedDigit
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
    
    private var brain = CalculaotrBrain()
    
    @IBAction private func performOperation(_ sender: UIButton) {
        
        if userIsInMiddleOfTyping {
            brain.setOpend(input: displayValue)
            userIsInMiddleOfTyping = false
        }
        
        if let operation = sender.currentTitle{
            brain.performOperation(symbol: operation)
        }
        displayValue = brain.result
    }
    
}

