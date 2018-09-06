//
//  AppDelegate.swift
//  MultipleWindows
//
//  Created by rhino Q on 06/09/2018.
//  Copyright © 2018 rhino Q. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    var windowController:PreferencesWindowController?

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    @IBAction func showPreference(_ sender: NSMenuItem) {
        if windowController == nil {
            windowController = PreferencesWindowController.loadFromNib()
        }
        windowController?.showWindow(self)
    }
    
}

