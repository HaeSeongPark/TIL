//
//  ViewController.swift
//  TableView
//
//  Created by rhino Q on 03/09/2018.
//  Copyright © 2018 rhino Q. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    var strings = ["apple", "banana", "orage", "waltermelon"]
    var backupStrings:[String]!
    var isSearching = false {
        didSet {
            if isSearching != oldValue {
                if isSearching {
                    backupStrings = strings
                } else {
                    strings = backupStrings
                }
            }
        }
    }
    
    @IBOutlet weak var textField: NSTextField!
    @IBOutlet weak var tableView: NSTableView!
    
    @IBAction func addFruit(_ sender: NSButton?) {
        if !textField.stringValue.isEmpty {
            let string = textField.stringValue
            strings.append(string)
            textField.stringValue = ""
            tableView.reloadData()
        }
    }
    
    @IBAction func searchWith(_ sender: NSSearchField) {
        if sender.stringValue.isEmpty {
            print("empty")
            isSearching = false
        } else {
            print(sender.stringValue)
            isSearching = true
            strings = backupStrings.filter { $0.lowercased().contains(sender.stringValue.lowercased())}
        }
        tableView.reloadData()
    }
}

extension ViewController: NSTableViewDataSource {
    func numberOfRows(in tableView: NSTableView) -> Int {
        return strings.count
    }
    
    func tableView(_ tableView: NSTableView, objectValueFor tableColumn: NSTableColumn?, row: Int) -> Any? {
        return strings[row]
    }
}

extension ViewController: NSTextFieldDelegate {
    override func controlTextDidEndEditing(_ obj: Notification) {
        addFruit(nil)
    }
}

