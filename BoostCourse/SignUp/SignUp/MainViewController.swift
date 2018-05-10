//
//  ViewController.swift
//  SignUp
//
//  Created by rhino Q on 2018. 5. 10..
//  Copyright © 2018년 rhino Q. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var userIdFt: UITextField!
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        if let id = UserInfomation.shared.id {
            userIdFt.text = id
        }
    }
}

