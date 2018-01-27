//
//  ViewController.swift
//  memo_archer
//
//  Created by rhino Q on 2018. 1. 26..
//  Copyright © 2018년 rhino Q. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var memodata = [String]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     memodata = UserDefaults.standard.object(forKey: "memodata") as? [String] ?? [String]()
        return memodata.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ViewControllerCellTableViewCell
        
        cell.textLabel?.text = memodata[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let memoNumber = indexPath.row
        UserDefaults.standard.set(memoNumber, forKey:  "memoNumber")
        self.performSegue(withIdentifier: "toRecord", sender: self)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func add(_ sender: UIButton) {
        UserDefaults.standard.set(-1, forKey:  "memoNumber")
    }
    
}

