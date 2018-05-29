//
//  ViewController.swift
//  AutoLayout
//
//  Created by cord7894 on 2017. 7. 17..
//  Copyright © 2017년 rhino. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var testLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let tra = UITraitCollection(traitsFrom: [UITraitCollection.init(verticalSizeClass: .regular), UITraitCollection.init(horizontalSizeClass: .regular)])
        testLbl.font = UIFont.preferredFont(forTextStyle:.headline, compatibleWith: tra)
        testLbl.font = testLbl.font.withSize(50)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

