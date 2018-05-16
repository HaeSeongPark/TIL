//
//  ViewController.swift
//  Alert
//
//  Created by rhino Q on 2018. 5. 16..
//  Copyright © 2018년 rhino Q. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func touchUpShowAllertButton(_ sender: UIButton) {
        showAlertController(style: .alert)
    }
    
    @IBAction func touchUpShowActionSheeetButton(_ sender: UIButton) {
        showAlertController(style: .actionSheet)
    }
    
    func showAlertController(style: UIAlertControllerStyle) {
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: style)
        
        let okAction = UIAlertAction(title: "OK", style: .default) { action in
            print("Ok Pressed")
        }
        
        okAction.setValue(UIColor.brown, forKey: "titleTextColor")
        
        let cancleAction = UIAlertAction(title: "Cancle", style: .cancel, handler: nil)
        
        alertController.addAction(okAction)
        alertController.addAction(cancleAction)
        
        
        let handler:(UIAlertAction) -> Void
        handler = { (action:UIAlertAction) in
            print("action pressed \(action.title ?? "")")
        }
        
        let someAction = UIAlertAction(title: "Some", style: .destructive, handler: handler)
        
        let anotherAction = UIAlertAction(title: "Another", style: .default, handler: handler)
        
        alertController.addAction(someAction)
        alertController.addAction(anotherAction)
        
        
        if style == .alert {
            alertController.addTextField { textField in
                textField.placeholder = "place holder"
                textField.textColor = UIColor.red
            }
        }
        self.present(alertController, animated: true) {
            print("Alert controller shown")
        }
    }
}

