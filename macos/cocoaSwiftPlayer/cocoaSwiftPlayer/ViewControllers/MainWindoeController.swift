//
//  MainWindoeController.swift
//  cocoaSwiftPlayer
//
//  Created by rhino Q on 06/09/2018.
//  Copyright © 2018 rhino Q. All rights reserved.
//

import Cocoa

class MainWindoeController: NSWindowController {

    override func windowDidLoad() {
        super.windowDidLoad()
        window?.titleVisibility = .hidden
        window?.titlebarAppearsTransparent = true
    }

}
