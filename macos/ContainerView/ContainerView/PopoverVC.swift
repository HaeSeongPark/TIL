//
//  PopoverVC.swift
//  ContainerView
//
//  Created by rhino Q on 04/09/2018.
//  Copyright © 2018 rhino Q. All rights reserved.
//

import Cocoa

class PopoverVC: NSViewController {

    let popover = NSPopover()
    
    @IBOutlet weak var textField: NSTextField!
    
    
    class func loadFromNib() -> PopoverVC {
                let vc = NSStoryboard(name: NSStoryboard.Name(rawValue: "Main"), bundle: nil).instantiateController(withIdentifier: NSStoryboard.SceneIdentifier(rawValue: "Popover")) as! PopoverVC
        vc.popover.contentViewController = vc
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        popover.behavior = .transient
    }
    
    func showPopover(view: NSView) {
                popover.show(relativeTo: view.bounds, of: view, preferredEdge: .maxY)
    }
    
    @IBAction func click(_ sender: NSButton) {
        
        let content = textField.stringValue
        
        NotificationCenter.default.post(name: Notification.Name.clickNoti, object: self, userInfo: [CVNotiUserInfo.Content:content])
        
        // Dismiss popover
        popover.performClose(sender)
    }
    
}
