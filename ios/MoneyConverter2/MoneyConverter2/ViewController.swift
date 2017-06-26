//
//  ViewController.swift
//  MoneyConverter2
//
//  Created by cord7894 on 2017. 6. 26..
//  Copyright © 2017년 rhino. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var sourceMoneyField: UITextField!
    
    @IBOutlet weak var currencySegment: UISegmentedControl!
    
    @IBOutlet weak var targetMoneyLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func convertMoney(_ sender: Any) {
        guard let sourceCurrency = Currency(rawValue:currencySegment.selectedSegmentIndex) else {
            print("Source currency error")
            return
        }
        
        guard let sourceAmount = Double(sourceMoneyField.text!) else {
            targetMoneyLabel.text = "error"
            return
        }
        
        let sourceMoney = Money(sourceAmount, currency: sourceCurrency)

        var targetMoneyStirng = ""
        for i in 0..<4{
            targetMoneyStirng += sourceMoney.valueInCurency(currency:Currency.init(rawValue:i)!)
            targetMoneyStirng += "\r\n"
        }
        
        targetMoneyLabel.text = targetMoneyStirng
        
    }
    
}

