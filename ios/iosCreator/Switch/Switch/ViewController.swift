//
//  ViewController.swift
//  Switch
//
//  Created by rhino Q on 2018. 2. 21..
//  Copyright © 2018년 rhino Q. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var stateSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        stateSwitch.addTarget(self, action: #selector(stateChanged), for: UIControlEvents.valueChanged)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func buttonClicked(_ sender: UIButton) {
        if stateSwitch.isOn
        {
            textField.text = "The Switch is Off"
            stateSwitch.setOn(false, animated: true)
        }
        else
        {
            textField.text = "The Switch is On"
            stateSwitch.setOn(true, animated: true)
        }
    }
    
    @objc func stateChanged(switchState:UISwitch)
    {
        if switchState.isOn
        {
            textField.text = "The Switch is On"
        }
        else
        {
            textField.text = "The Switch is Off"
        }
    }
}

