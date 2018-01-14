//
//  ViewController.swift
//  doitDatePicker
//
//  Created by rhino Q on 2018. 1. 13..
//

import UIKit

class ViewController: UIViewController {
    let timeSelector:Selector = #selector(ViewController.updateTime)
    let interval = 1.0
    var alarmTime:String?
    
    @IBOutlet weak var lblCurrentTIme: UILabel!
    @IBOutlet weak var lblPickerTIme: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let datePickerView = sender
        
        let dateFormatter = DateFormatter()
        let timeFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
        timeFormatter.dateFormat = "hh:mm a"
        lblPickerTIme.text = "선택시간 : " + dateFormatter.string(from: datePickerView.date)
        alarmTime = timeFormatter.string(from: datePickerView.date)
    }
    
    @objc func updateTime(){
        let date = Date()
        let dateFormatter = DateFormatter()
        let timeFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
        timeFormatter.dateFormat = "hh:mm a"
        let currentTime = timeFormatter.string(from: date)
        lblCurrentTIme.text="현재시간 : " + dateFormatter.string(from: date)
        
        if(alarmTime == currentTime)
        {
            view.backgroundColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
        }
        else
        {
            view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
        
        
    }
}

