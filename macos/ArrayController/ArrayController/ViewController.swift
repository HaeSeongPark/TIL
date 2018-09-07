//
//  ViewController.swift
//  ArrayController
//
//  Created by rhino Q on 03/09/2018.
//  Copyright © 2018 rhino Q. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    @IBOutlet var arrayController: NSArrayController!
    
    // Optimize Performance
    lazy var predicate: NSPredicate = {
        return NSPredicate(format: "(name contains[cd] $value) OR (bpm == $value.intValue)")
    }()
    
    @IBAction func changeSearchQuery(_ sender: NSSearchField) {
        if sender.stringValue.isEmpty {
            arrayController.filterPredicate = nil
        } else {
//            arrayController.filterPredicate = NSPredicate(format: "(name contains[cd] %@) OR (bpm == %@.intValue)", sender.stringValue, sender.stringValue)
            let dict = ["value": sender.stringValue]
            arrayController.filterPredicate = predicate.withSubstitutionVariables(dict)
        }
    }
    @IBOutlet weak var tableView: NSTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.sortDescriptors = [
            .init(key: "name", ascending: true, selector: #selector(NSString.caseInsensitiveCompare(_:))),
            .init(key: "bpm", ascending: true)
        ]
    }
}

