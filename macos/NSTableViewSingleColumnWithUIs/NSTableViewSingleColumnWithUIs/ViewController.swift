//
//  ViewController.swift
//  NSTableViewSingleColumnWithUIs
//
//  Created by rhino Q on 12/09/2018.
//  Copyright © 2018 rhino Q. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    @IBOutlet weak var tableView: NSTableView!
    
        var tableViewData = [["imageIcon":"NSUser","summaryInfo":"This is high level summary","descriptionInfo":"Some More Description","detailInfo":"Detailed Information"],["imageIcon":"NSUser","summaryInfo":"Product 2 - This is high level summary","descriptionInfo":"Some More Description","detailInfo":"Detailed Information"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.delegate = self
        self.tableView.dataSource = self
        
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
}

extension ViewController:NSTableViewDataSource, NSTableViewDelegate {
    func numberOfRows(in tableView: NSTableView) -> Int {
        return tableViewData.count
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        let result = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "defaultRow"), owner: self) as! mytableCellView
        
        result.summaryTextField.stringValue  = tableViewData[row]["summaryInfo"]!
        return result
    }
}

