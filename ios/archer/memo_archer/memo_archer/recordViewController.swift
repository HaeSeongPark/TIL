//
//  recordViewController.swift
//  memo_archer
//
//  Created by rhino Q on 2018. 1. 26..
//  Copyright © 2018년 rhino Q. All rights reserved.
//

import UIKit

class recordViewController: UIViewController {

    @IBOutlet weak var recordTextVIew: UITextView!
    
    var memoData = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func save(_ sender: UIButton) {
        memoData.insert(recordTextVIew.text, at: 0)
        UserDefaults.standard.set(memoData, forKey: "memodata")
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
