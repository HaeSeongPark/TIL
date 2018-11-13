//
//  MyTextFied.swift
//  NSTextField
//
//  Created by rhino Q on 07/09/2018.
//  Copyright © 2018 rhino Q. All rights reserved.
//

import Cocoa

@objc protocol MyTextFieldDelegate {
    func itemDidStartEditing(textField: MyTextFied)
    @objc optional func itemDidEndEditing(textField: MyTextFied)
}

class MyTextFied: NSTextField {
    
    var myDelegate: MyTextFieldDelegate?
    
    override func becomeFirstResponder() -> Bool {
        print("becomFirstResponder")
        myDelegate?.itemDidStartEditing(textField: self)
        return super.becomeFirstResponder()
    }
    
    override func resignFirstResponder() -> Bool {
        myDelegate?.itemDidStartEditing(textField: self)
        return super.resignFirstResponder()
    }
}
