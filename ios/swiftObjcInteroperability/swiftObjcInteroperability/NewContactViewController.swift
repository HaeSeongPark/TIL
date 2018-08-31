//
//  NewContactViewController.swift
//  swiftObjcInteroperability
//
//  Created by rhino Q on 31/08/2018.
//  Copyright © 2018 rhino Q. All rights reserved.
//

import UIKit

class NewContactViewController: UIViewController {
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var contactImageVIew: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional   setup after loading the view.
        contactImageVIew.image = DefaultImage.generate(of: contactImageVIew.frame.size)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
