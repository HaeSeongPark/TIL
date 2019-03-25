//
//  ViewController.swift
//  PassDataBetweenVC
//
//  Created by rhino Q on 25/03/2019.
//  Copyright © 2019 rhino Q. All rights reserved.
//

import UIKit

class ViewController: UIViewController, PizzaDelegate {
    static let notificationName = Notification.Name("sampleNotificationName")
    
    func onPizzaReday(type: String) {
        print("Pizza ready. The best pizza of all pizzas is ...\(type)")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(onNotification(notification:)), name: ViewController.notificationName, object: nil)
    }
    
    @objc func onNotification(notification:Notification)
    {
        // `userInfo` contains the data you sent along with the notification
        
        print(notification.userInfo)
    }


    @IBAction func didButtonTapped(_ sender: Any) {
        let vc = SecondViewController()
        vc.text = "way1 of Pass data between vc"
        vc.mainViewController = self
        vc.delegate = self
        
        vc.completionHandler = { text in
            print("text = \(text)")
            return text.count
        }
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? TertiaryViewController {
            vc.username = "Rhino"
        }
    }
    
    /**
     This function is invoked from the secondary view controller class,
     for "Passing Data Back With A Property"
     */
    func onUserAction(data: String)
    {
        print("Data received: \(data)")
    }
}

