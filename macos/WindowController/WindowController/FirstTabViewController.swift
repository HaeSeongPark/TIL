//
//  FirstTabViewController.swift
//  WindowController
//
//  Created by rhino Q on 04/09/2018.
//  Copyright © 2018 rhino Q. All rights reserved.
//

import Cocoa

class FirstTabViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    @IBAction func dismiss(_ sender: NSButton) {
        parent?.dismiss(sender)
//        dismissViewController(parent!)
    }
}
