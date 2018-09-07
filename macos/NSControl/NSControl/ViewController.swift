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
    @IBOutlet var bioTextView: NSTextView!
    
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
        
    // bio
    bioTextView.backgroundColor = NSColor.lightGray
    bioTextView.textColor = NSColor.blue
    bioTextView.string = "Red Green Blue"
    let myAttributedString = NSMutableAttributedString(string: "Red Green Blue")
        myAttributedString.addAttributes([NSAttributedStringKey.foregroundColor:NSColor.red], range: NSRange.init(location: 0, length: 3))
        myAttributedString.addAttributes([NSAttributedStringKey.foregroundColor:NSColor.green], range: NSRange.init(location: 4, length: 5))
        bioTextView.textStorage?.setAttributedString(myAttributedString)
        bioTextView.delegate = self
    }
}

extension ViewController: NSTextViewDelegate {
    func textViewDidChangeSelection(_ notification: Notification) {
        print("textView: \(bioTextView.attributedString())")
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
