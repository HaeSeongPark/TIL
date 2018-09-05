//
//  ViewController.swift
//  NSFont
//
//  Created by rhino Q on 05/09/2018.
//  Copyright © 2018 rhino Q. All rights reserved.
// https://hackernoon.com/swift-4-0-migration-error-error-8fbf13c2ec2
// need autolayout

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let font = NSFont.systemFont(ofSize: NSFont.systemFontSize)
        
        
        let textField = NSTextField(frame: NSRect(x: 100, y: 100, width: 200, height: ceil(font.capHeight) + 20))
        textField.font = font
        textField.isEditable = false
        textField.alignment = .center
        textField.stringValue = "OSX Dev Daily"
        view.addSubview(textField)
        
        let attrStr = NSMutableAttributedString(string: "OSX Dev Daily attrSTr")
        attrStr.addAttribute(NSAttributedStringKey.underlineStyle, value: 1, range: NSRange(8...12))
        attrStr.addAttribute(NSAttributedStringKey.font, value: NSFont.boldSystemFont(ofSize: 22), range: NSRange(0...2))
        attrStr.addAttribute(NSAttributedStringKey.foregroundColor, value: NSColor.red, range: NSRange(0...2))
        textField.attributedStringValue = attrStr
    }
}

