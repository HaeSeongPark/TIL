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
        
        let memoNumber = UserDefaults.standard.object(forKey: "memoNumber") as! Int
        memoData = UserDefaults.standard.object(forKey: "memodata") as? [String] ?? [String]()
        
        if memoNumber == -1 {
            recordTextVIew.text = "..."
        } else {
            recordTextVIew.text = memoData[memoNumber]
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func save(_ sender: UIButton) {
        let memoNumber = UserDefaults.standard.object(forKey: "memoNumber") as! Int
        // 글쓰기 버튼을 누르면 memoNumber는 -1 이다.
        if memoNumber == -1 {
            // 글쓰기 버튼이면 새로운 글을 추가하고
            memoData.insert(recordTextVIew.text, at: memoData.count)
            //저장한다.
            UserDefaults.standard.set(memoData, forKey: "memodata")
        } else {
            // 테이블뷰를 클릭. 즉, 수정을 하는 경우
            // 기존에 있는 건 지운다.
            memoData.remove(at: memoNumber)
            // 지우고 새로운 내용을 해당 index에 넣는다.
            memoData.insert(recordTextVIew.text, at: memoNumber)
            //저장한다.
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
