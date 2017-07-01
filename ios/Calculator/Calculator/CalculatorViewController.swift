//
//  ViewController.swift
//  Calculator
//
//  Created by cord7894 on 2017. 6. 30..
//  Copyright © 2017년 rhino. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController
{
    @IBOutlet private weak var resultField: UILabel!
    
    private var userIsINMiddleOfTyping = false
    
    @IBAction func inputDigit(_ sender: UIButton)
    {
        let digit = sender.currentTitle!
        if userIsINMiddleOfTyping
        {
            let currentDigit = resultField.text!
            resultField.text = currentDigit + digit
        }
        else
        {
            resultField.text = digit
            userIsINMiddleOfTyping = true
        }
    }
    
    private var displayValue:Double{
        get{
            return Double(resultField.text!)!
        }
        set{
            resultField.text = String(newValue)
        }
    }
    
    var brain = CalculatorBrain()
    
    @IBAction private func performCalculate(_ sender: UIButton)
    {
        if userIsINMiddleOfTyping {
            brain.setOperand(operand: displayValue)
            userIsINMiddleOfTyping = false
        }
        
        if let mathmaticalSymbol = sender.currentTitle
        {
            brain.performOperation(symbol: mathmaticalSymbol)
        }
        
        displayValue = brain.result
    }
}

