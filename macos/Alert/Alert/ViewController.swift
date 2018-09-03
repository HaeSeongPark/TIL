//
//  ViewController.swift
//  Alert
//
//  Created by rhino Q on 03/09/2018.
//  Copyright © 2018 rhino Q. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear() {
        super.viewDidAppear()
        alert()
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    func alert() {
        let alert = NSAlert()
        alert.messageText = "Alert message."
        alert.informativeText = "Detailed description of alert message"
        alert.addButton(withTitle: "Default")
        alert.addButton(withTitle: "Alternative")
        alert.addButton(withTitle: "Other")
//        let result = alert.runModal()
        
        alert.beginSheetModal(for: view.window!) { (response) in
            print("The user selected \(response)")
            // default : 1000
            // 1001
            // 1002
        }
        
//        switch result {
//        case .alertFirstButtonReturn:
//            print("first button")
//        case .alertSecondButtonReturn:
//            print("second button")
//        case .alertThirdButtonReturn:
//            print("thrid button")
//        default:
//            print("asd")
//        }
    }

}

