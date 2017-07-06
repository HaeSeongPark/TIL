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
        // AppDelegate 클래스에 mainViewController를 참조하여 결제가 완료되었을때 버튼을 활성화 시킬수 있도록 한다.
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
    
    @IBAction func enableScreentoggle(_ sender: UIButton) {
        enableScreen.isEnabled = false
    }
}

