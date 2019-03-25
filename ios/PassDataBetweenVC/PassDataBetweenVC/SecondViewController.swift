//
//  SecondViewController.swift
//  PassDataBetweenVC
//
//  Created by rhino Q on 25/03/2019.
//  Copyright © 2019 rhino Q. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    var text = ""
    @IBOutlet weak var label: UILabel!
    
    weak var mainViewController:ViewController?
    
    weak var delegate:PizzaDelegate?
    
    var completionHandler:((String) -> Int)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = text
    }

    @IBAction func didButtonTapped(_ sender: Any) {
        mainViewController?.onUserAction(data: "B-A")
        
        delegate?.onPizzaReday(type: "Pizza di mama")
        
        let result = completionHandler?("closure")
        print("completionHandler returns... \(result)")

    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
