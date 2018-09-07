//
//  ViewController.swift
//  NSControl
//
//  Created by rhino Q on 07/09/2018.
//  Copyright © 2018 rhino Q. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var textField: NSTextField!
    @IBOutlet weak var genderControl: NSPopUpButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.intValue = 30
        genderControl.removeAllItems()
        genderControl.addItems(withTitles: ["Male", "Female"])
        
        let selectionIndex = genderControl.indexOfSelectedItem
        print("selected gender index : \(selectionIndex)")
        genderControl.selectItem(at: 1)
    }
}

