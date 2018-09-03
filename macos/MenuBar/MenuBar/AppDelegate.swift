//
//  AppDelegate.swift
//  MenuBar
//
//  Created by rhino Q on 03/09/2018.
//  Copyright © 2018 rhino Q. All rights reserved.
// - http://stackoverflow.com/questions/4565820/cocoa-right-click-nsstatusitem﻿

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    let statusItem = NSStatusBar.system.statusItem(withLength:NSStatusItem.variableLength)
//    let menu = NSMenu()
    let popover = NSPopover()
    var eventMonitor: EventMonitor?


    func applicationDidFinishLaunching(_ aNotification: Notification) {
        if let button = statusItem.button {
            button.image = NSImage(named: NSImage.Name(rawValue: "icon"))
            button.action = #selector(showWeather(sender:))
        }
        
        popover.contentViewController = WeatherViewController.loadFromNib()
        eventMonitor = EventMonitor(mask: [.leftMouseUp, .rightMouseUp], handler: { (event) in
            if self.popover.isShown {
                self.popover.performClose(event)
            }
        })
        
//        menu.addItem(NSMenuItem(title: "Show Weather", action: #selector(showWeather(sender:)), keyEquivalent: "S"))
//        menu.addItem(NSMenuItem.separator())
//        menu.addItem(NSMenuItem(title: "Quit", action: #selector(NSApplication.terminate(_:) ), keyEquivalent: "q"))
//
//        statusItem.menu = menu
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    @objc func showWeather(sender:NSStatusBarButton){
        if popover.isShown {
            popover.performClose(sender)
            eventMonitor?.stop()
        } else {
            if let button = statusItem.button {
                popover.show(relativeTo: button.bounds, of: button, preferredEdge: .minY)
                eventMonitor?.start()
            }
        }
    }

}

