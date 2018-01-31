//
//  recordViewController.swift
//  memo_archer
//
//  Created by rhino Q on 2018. 1. 26..
//  Copyright © 2018년 rhino Q. All rights reserved.

// 주석 달기 설명 어떻게 하지?
//

import UIKit

class recordViewController: UIViewController {

    @IBOutlet weak var recordTextVIew: UITextView!
    
    var memoData = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let memoNumber = UserDefaults.standard.object(forKey: "memoNumber") as! Int
        
        if memoNumber == -1 {
            memoData = UserDefaults.standard.object(forKey: "memodata") as! [String]
            recordTextVIew.text = "..."
        } else {
            memoData = UserDefaults.standard.object(forKey: "memodata") as! [String]
            recordTextVIew.text = memoData[memoNumber]
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func save(_ sender: UIButton) {
        let memoNumber = UserDefaults.standard.object(forKey: "memoNumber") as! Int
        
        if memoNumber == -1 {
            memoData.insert(recordTextVIew.text, at: 0)
            UserDefaults.standard.set(memoData, forKey: "memodata")
        } else {
            memoData.remove(at: memoNumber)
            memoData.insert(recordTextVIew.text, at: memoNumber)
            UserDefaults.standard.set(memoData, forKey: "memodata")
        }
        
    }
    
    @IBAction func delte(_ sender: UIButton) {
        let memoNumber = UserDefaults.standard.object(forKey: "memoNumber") as! Int
        
        if memoNumber != -1 {
            memoData.remove(at: memoNumber)
            UserDefaults.standard.set(memoData, forKey: "memodata")
        }
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
