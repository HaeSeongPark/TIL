//
//  TertiaryViewController.swift
//  PassDataBetweenVC
//
//  Created by rhino Q on 25/03/2019.
//  Copyright © 2019 rhino Q. All rights reserved.
//

import UIKit

class TertiaryViewController: UIViewController {
    var username = ""
    @IBOutlet weak var usernameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        usernameLabel.text = username
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func didButtonTapped(_ sender: Any) {
        NotificationCenter.default.post(name: ViewController.notificationName, object: nil, userInfo:["data": 42, "isImportant": true])

    }
    
}
