//
//  ViewController.swift
//  MoneyConverter
//
//  Created by cord7894 on 2017. 6. 26..
//  Copyright © 2017년 rhino. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var curencySegment: UISegmentedControl!
    
    @IBOutlet weak var sourceMoneyField: UITextField!
    
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
        
        guard let sourceCurrnecy = Currency(rawValue:curencySegment.selectedSegmentIndex)
            else{
            print("Source currenct error")
            return
        }
        
        guard let sourceAmount = Double(sourceMoneyField.text!) else {
            targetMoneyLabel.text = "error"
            return
        }
        
        let sourceMoney = Money(sourceAmount, currency:sourceCurrnecy)
    
        var targetMoneyString = ""
        for i in 0..<4
        {
            targetMoneyString +=
                sourceMoney.valueInCurrency(currency:Currency.init(rawValue:i)!)
            targetMoneyString += "\r\n"
        }
        
        targetMoneyLabel.text = targetMoneyString
        
    }

}

