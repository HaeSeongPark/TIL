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
    
    @IBOutlet weak var salaryTextField: NSTextField!
    @IBOutlet weak var salarySlider: NSSlider!
    @IBOutlet weak var birthdayDP: NSDatePicker!
    @IBOutlet weak var subscribeButton: NSButton!
    @IBOutlet var resultView: NSTextView!
    
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
        
        //salary slider
        salarySlider.minValue = 1
        salarySlider.maxValue = 10
        salarySlider.integerValue = 3
        
        //birthday
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-DD"
        birthdayDP.minDate = formatter.date(from: "2001-01-01")
        birthdayDP.maxDate = formatter.date(from: "2020-01-01")
        birthdayDP.dateValue = Date()
        
        //subscribe
        subscribeButton.state = NSControl.StateValue.on
        
    }
    @IBAction func submitForm(_ sender: NSButton) {
        resultView.string = """
        result :
        name : \(textField.stringValue)
        gender : \(genderControl.stringValue)
        """
    }
    
    @IBAction func updateSalary(_ sender: NSSlider) {
//        print(sender.integerValue)
//        print(sender.doubleValue)
        let curerncyStyle = NumberFormatter()
        curerncyStyle.formatterBehavior = .behavior10_4
        curerncyStyle.numberStyle = .decimal
        
        let salary = sender.integerValue * 10000
        salaryTextField.stringValue = "\(curerncyStyle.string(for: salary)!)"
    }
    
    @IBAction func choosePlaceOfBirth(_ sender: NSButton) {
        print("Place of Birth: \(sender.title)")
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
