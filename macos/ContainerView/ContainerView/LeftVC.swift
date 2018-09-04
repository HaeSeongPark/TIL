//
//  LeftVC.swift
//  ContainerView
//
//  Created by rhino Q on 04/09/2018.
//  Copyright © 2018 rhino Q. All rights reserved.
//

import Cocoa

extension Notification.Name {
    static let clickNoti = Notification.Name("com.rhino.ContainerView.click")
}

class LeftVC: ViewLifeCycleLoggingVC {
    
    @IBAction func pushNoti(_ sender: NSButton) {
        NotificationCenter.default.post(name: Notification.Name.clickNoti, object: nil)
    }
}
