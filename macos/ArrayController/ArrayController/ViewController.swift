//
//  ViewController.swift
//  ArrayController
//
//  Created by rhino Q on 03/09/2018.
//  Copyright © 2018 rhino Q. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    @IBOutlet weak var tableView: NSTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.sortDescriptors = [
            .init(key: "name", ascending: true, selector: #selector(NSString.caseInsensitiveCompare(_:))),
            .init(key: "bpm", ascending: true)
        ]
    }
}

