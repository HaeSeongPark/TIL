//
//  ViewController.swift
//  Alert
//
//  Created by rhino Q on 03/09/2018.
//  Copyright © 2018 rhino Q. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    @IBOutlet weak var label: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear() {
        super.viewDidAppear()
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    @IBAction func showAlert(_ sender: NSButton) {
        alert()
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
            
            switch response {
            case .alertFirstButtonReturn:
                print("first button")
                self.label.stringValue = "first"
            case .alertSecondButtonReturn:
                print("second button")
                self.label.stringValue = "second"
            case .alertThirdButtonReturn:
                print("thrid button")
                self.label.stringValue = "thrid"
            default: break
            }
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

