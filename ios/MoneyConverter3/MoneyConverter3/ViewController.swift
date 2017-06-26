//
//  ViewController.swift
//  MoneyConverter3
//
//  Created by cord7894 on 2017. 6. 26..
//  Copyright © 2017년 rhino. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var sourceMoneyField: UITextField!
    @IBOutlet weak var currecnySegment: UISegmentedControl!
    @IBOutlet weak var resultLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func convertMoney(_ sender: Any) {
        guard let sourceCurrecny = Currency(rawValue:currecnySegment.selectedSegmentIndex) else {
            print("Source currency error")
            return
        }
        guard let sourceAmount = Double(sourceMoneyField.text!) else {
            resultLabel.text = "error"
            return
        }
        
        let money = Money(sourceAmount, currency: sourceCurrecny)
        
        var tagetMoenyString = ""
        for i in 0..<4{
            tagetMoenyString += money.valueInCurrecny(currency:Currency(rawValue:i)!)
            tagetMoenyString += "\r\n"
        }
        resultLabel.text = tagetMoenyString
    }

}

