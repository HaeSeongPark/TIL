//
//  ViewController.swift
//  Calculator4
//
//  Created by rhino Q on 2018. 2. 16..
//  Copyright © 2018년 rhino Q. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var display: UILabel!
    
    var userIsInTheMiddleOfTyping = false
    
    @IBAction func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        
        if userIsInTheMiddleOfTyping {
            let textCurrenntlyInDisplay = display.text!
            display.text = textCurrenntlyInDisplay + digit
        } else {
            display.text = digit
        }
        userIsInTheMiddleOfTyping = true
    }
    
    @IBAction func performOperation(_ sender: UIButton) {
        userIsInTheMiddleOfTyping = false
        if let mathematicalSSymbol = sender.currentTitle{
            if mathematicalSSymbol == "π" {
                display.text = String(Double.pi)
            }
        }
    }
}

