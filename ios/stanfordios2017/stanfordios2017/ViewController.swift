//
//  ViewController.swift
//  stanfordios2017
//
//  Created by cord7894 on 2017. 6. 28..
//  Copyright © 2017년 rhino. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var displayLabel: UILabel!
    
    private var userIsInMiddleOfTyping = false
    
    private var displayValue:Double{
        get{
            return Double(displayLabel.text!)!
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    @IBAction private func touchDigit(_ sender: UIButton){
        let digit = sender.currentTitle!
        if userIsInMiddleOfTyping {
            let textCurrentInDisplay = displayLabel.text!
            displayLabel.text = textCurrentInDisplay + digit
        } else {
            displayLabel.text = digit
        }
        
        userIsInMiddleOfTyping = true
    }
    
    private var brain = CalculatorBrain()
    
    @IBAction private func performOpertaion(_ sender: UIButton) {
        if userIsInMiddleOfTyping {
            brain.setOperand(operand: displayValue)
            userIsInMiddleOfTyping = false
        }

        if let mathematicalSymbol = sender.currentTitle{
            brain.performOperation(symbol: mathematicalSymbol)
        }
        displayValue = brain.result
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

