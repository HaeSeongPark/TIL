//
//  ViewController.swift
//  NSTextField
//
//  Created by rhino Q on 07/09/2018.
//  Copyright © 2018 rhino Q. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var textField: MyTextFied!

    @IBOutlet var textView: NSTextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.myDelegate = self
    }
    
    @IBAction func changeTextField(_ sender: NSButton) {
        textField.stringValue = "ssdf"
    }
}

extension ViewController: MyTextFieldDelegate {
    func itemDidStartEditing(textField: MyTextFied) {
        print("my delegate")
    }
    
    func itemDidEndEditing(textField: MyTextFied) {
        print("did end edting")
    }
}

// code fold
// https://stackoverflow.com/questions/30743182/enabling-code-folding-bar-in-xcode
// command option <-

extension ViewController:NSTextViewDelegate {
    func textViewDidChangeSelection(_ notification: Notification) {
        print("textView: \(textView.string)")
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
        if commandSelector == "insertNewline:" {
            print("intercept end")
            return true
        } else {
            return false
        }
    }
}
