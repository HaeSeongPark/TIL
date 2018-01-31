//
//  ViewController.swift
//  memo_archer
//
//  Created by rhino Q on 2018. 1. 26..
//  Copyright © 2018년 rhino Q. All rights reserved.
//
// UserDefaults.standard.set
// ViewDidload 라이프사이클
// 함수 정의 호출
// 옵셔널 변수와 연결해서
// 배열
// 클래스
// 주석의 의미. 프로그래밍. 프로그래밍언어,
// 규칙, 문법
// as 캐스팅
// if else  ==

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // 메모를 저장한 배열을 만든다.
    var memodata = [String]()
    
    // 테이블 행의 개수를 반환한다.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     memodata = UserDefaults.standard.object(forKey: "memodata") as? [String] ?? [String]()
        return memodata.count
    }
    
    // 테이블의 행을 꾸며준다.
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

