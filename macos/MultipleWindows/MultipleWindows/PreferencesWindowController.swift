//
//  PreferencesWindowController.swift
//  MultipleWindows
//
//  Created by rhino Q on 06/09/2018.
//  Copyright © 2018 rhino Q. All rights reserved.
//

import Cocoa

class PreferencesWindowController: NSWindowController {
    
    class func loadFromNib() -> PreferencesWindowController {
        let vc = NSStoryboard(name: NSStoryboard.Name(rawValue: "Preferences"), bundle: nil).instantiateController(withIdentifier: NSStoryboard.SceneIdentifier(rawValue: "PreferencesWindowController")) as! PreferencesWindowController
        return vc
    }

    override func windowDidLoad() {
        super.windowDidLoad()

        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    }
    
}
