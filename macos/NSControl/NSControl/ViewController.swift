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
    
    @IBOutlet weak var countryCode: NSComboBox!
    
    var coutryCodes = ["HK +852", "China +85", "US +1"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //textfield
        textField.intValue = 30
        
        // gender
        genderControl.removeAllItems()
        genderControl.addItems(withTitles: ["Male", "Female"])
        
        let selectionIndex = genderControl.indexOfSelectedItem
        print("selected gender index : \(selectionIndex)")
        genderControl.selectItem(at: 1)
        
        //country Code
        countryCode.removeAllItems()
//        countryCode.addItems(withObjectValues: [1, "ABC", 3.5])
        countryCode.usesDataSource = true
        countryCode.dataSource = self
        countryCode.delegate = self
//        countryCode.reloadData()
    }
}

extension ViewController: NSComboBoxDataSource {
    func numberOfItems(in comboBox: NSComboBox) -> Int {
        return coutryCodes.count
    }
    
    func comboBox(_ comboBox: NSComboBox, objectValueForItemAt index: Int) -> Any? {
        return coutryCodes[index]
    }
}

extension ViewController: NSComboBoxDelegate {
    func comboBoxWillPopUp(_ notification: Notification) {
        print("popup : \(countryCode.indexOfSelectedItem)")
    }
}
