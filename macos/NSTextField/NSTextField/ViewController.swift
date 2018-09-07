//
//  ViewController.swift
//  NSTextField
//
//  Created by rhino Q on 07/09/2018.
//  Copyright © 2018 rhino Q. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var textField: NSTextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func changeTextField(_ sender: NSButton) {
        textField.stringValue = "ssdf"
    }
}

extension ViewController: NSTextFieldDelegate {
    override func controlTextDidBeginEditing(_ obj: Notification) {
        print("begin")
    }
    
    override func controlTextDidChange(_ obj: Notification) {
        print("change")
    }
    
    override func controlTextDidEndEditing(_ obj: Notification) {
        print("end")
    }
    
    // intercept return key event
    func control(_ control: NSControl, textView: NSTextView, doCommandBy commandSelector: Selector) -> Bool {
        print("command selector : \(commandSelector)")
//        if commandSelector == "insertNewline:" {
//            print("intercept end")
//            return true
//        } else {
//            return false
//        }
    }
}
