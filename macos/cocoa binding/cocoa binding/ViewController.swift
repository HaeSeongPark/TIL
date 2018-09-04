//
//  ViewController.swift
//  cocoa binding
//
//  Created by rhino Q on 04/09/2018.
//  Copyright © 2018 rhino Q. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    @objc dynamic var users: [User] = []
    
    @objc dynamic var currentUser: User?
    @IBOutlet weak var tableView: NSTableView!
    @IBOutlet weak var firstNameField: NSTextField!
    @IBOutlet weak var lastNameField: NSTextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override var representedObject: Any? {
        didSet {
        }
    }
    
    @IBAction func updateUser(_ sender: NSButton) {
        
//       currentUser?.firstName = firstNameField.stringValue
//       currentUser?.lastName = lastNameField.stringValue
    }
    
}

extension ViewController: NSTableViewDelegate {
    func tableViewSelectionDidChange(_ notification: Notification) {
        print(tableView.selectedRow)
        let user = users[tableView.selectedRow]
        
        currentUser = user
        
        firstNameField.stringValue = user.firstName
        lastNameField.stringValue = user.lastName
    }
}

// method1
/*
 Instead of using the NSTextFieldDelegate to automatically updates the tableView, you can check the "Continuously Update Value" option on your Value Binding (for firstNameField and lastNameField) and you will get the same result without the need of writing any line of code. :)
 */
// method2
extension ViewController: NSTextFieldDelegate {
    override func controlTextDidChange(_ obj: Notification) {
               currentUser?.firstName = firstNameField.stringValue
               currentUser?.lastName = lastNameField.stringValue
    }
}
