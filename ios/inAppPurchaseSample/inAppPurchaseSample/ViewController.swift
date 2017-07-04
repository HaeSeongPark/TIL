//
//  ViewController.swift
//  inAppPurchaseSample
//
//  Created by cord7894 on 2017. 7. 4..
//  Copyright © 2017년 rhino. All rights reserved.
//

import UIKit
import StoreKit

class ViewController: UIViewController {

    @IBOutlet weak var enableScreen: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.mainViewController = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func enableScreenButton() {
        enableScreen.isEnabled = true
    }
}

