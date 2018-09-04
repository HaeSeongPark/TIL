//
//  RightVC.swift
//  ContainerView
//
//  Created by rhino Q on 04/09/2018.
//  Copyright © 2018 rhino Q. All rights reserved.
//

import Cocoa

class RightVC: ViewLifeCycleLoggingVC {
    @IBOutlet weak var clickCountLabel: NSTextField!
    private var clickCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(reveiceNoti(noti:)), name: Notification.Name.clickNoti, object: nil)
    }
    
    @objc func reveiceNoti(noti: Notification){
        if let content = noti.userInfo?[CVNotiUserInfo.Content] as? String, content != "" {
                clickCountLabel.stringValue = content
        } else {
            clickCount += 1
            clickCountLabel.stringValue = "Click \(clickCount) tiems"
        }
    }
    
}

enum CVNotiUserInfo:String {
    case Content = "com.rhnino.ContainerView.content"
}
