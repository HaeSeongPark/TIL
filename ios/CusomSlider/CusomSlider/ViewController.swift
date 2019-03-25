//
//  ViewController.swift
//  CusomSlider
//
//  Created by rhino Q on 23/03/2019.
//  Copyright © 2019 rhino Q. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var slider1: CustomUISilder!
    @IBOutlet weak var slider2: CustomUISilder!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        slider1.axis = .horizontal
        slider1.axis = .vertical
        
        slider1.addTarget(self, action: #selector(printValue1(_:)), for: .valueChanged)
        slider2.addTarget(self, action: #selector(printValue2(_:)), for: .valueChanged)
    }
    
    @objc func printValue1(_ slider:UISlider) {
        print("slider1.value : \(slider.value)")
    }
    
    @objc func printValue2(_ slider:UISlider) {
        print("slider2.value : \(slider.value)")
    }
}

