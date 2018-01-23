//
//  ViewController.swift
//  msg-notification
//
//  Created by rhino Q on 2018. 1. 20..
//  Copyright © 2018년 rhino Q. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    @IBOutlet weak var msg: UITextField!
    @IBOutlet weak var datepicker: UIDatePicker!
    
    @IBAction func save(_ sender: UIButton)
    {
        
        let content = UNMutableNotificationContent()
        
        
        let center = UNUserNotificationCenter.current()
        center.getNotificationSettings{ (settings) in
            if settings.authorizationStatus != .authorized{
                let alert = UIAlertController(title: "알림등록", message: "알림이 허용돼 있지 않습니다.", preferredStyle: .alert)
                let ok = UIAlertAction(title: "확인", style: .default)
                alert.addAction(ok)
                self.present(alert, animated: false)
                return
            }
        }
        
        content.badge = 1
        content.body = (self.msg.text)!
        content.title = "미리 알림"
        content.subtitle = "서브타이틀"
        content.sound = UNNotificationSound.default()
        
        let timeInterval = self.datepicker.date.timeIntervalSinceNow
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: timeInterval, repeats: false)
        let request = UNNotificationRequest(identifier: "alarm", content: content, trigger: trigger)
        let date = self.datepicker.date.addingTimeInterval(9*60*60)
        
        center.add(request, withCompletionHandler: { (error) in
            if let error = error {
                print(error)
            } else{
                let message = "알림이 등록되었습니다. 등록된 알림은 \(date)에 발송됩니다"
                let alert = UIAlertController(title: "알림등록", message: message, preferredStyle: .alert)
                let ok = UIAlertAction(title: "확인", style: .default)
                
                alert.addAction(ok)
                
                self.present(alert, animated: false)
            }
        })
      
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

