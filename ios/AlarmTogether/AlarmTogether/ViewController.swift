//
//  ViewController.swift
//  AlarmTogether
//
//  Created by rhino Q on 2018. 3. 2..
//  Copyright © 2018년 rhino Q. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    var seconds = 60 * 6
    var timer = Timer()
    var isTimerRunning = false
    var resumeTapped = false
    var stopWatch:StopWatch = StopWatch()
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        if isTimerRunning == false {
            runTimer()
            toggleButtons()
            self.isTimerRunning = true
        }
    }
    
    @IBAction func pauseButtonTapped(_ sender: Any) {
        if self.resumeTapped == false {
            timer.invalidate()
            self.resumeTapped = true
            self.pauseButton.setTitle("Resume", for: .normal)
        } else {
            runTimer()
            self.resumeTapped = false
            self.pauseButton.setTitle("Pause", for: .normal)
        }
    }
    
    @IBAction func stopButtonTapped(_ sender: UIButton?) {
        timer.invalidate()
        seconds = 60 * 6
        timerLabel.text = timeString(time: TimeInterval(seconds))
        isTimerRunning = false
        toggleButtons()
        stopWatch.stop()
        
        print("elapsedTime : \(stopWatch.getElapsedTime())")
        print("startTime : \(stopWatch.getStartTime())")
        print("stopTime : \(stopWatch.getStopTime())")
    }
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(self.updateTimer)), userInfo: nil, repeats: true)
        stopWatch.start()
    }
    
    @objc func updateTimer(){
        if seconds < 1 {
            stopButtonTapped(nil)
        } else {
            seconds -= 1
            timerLabel.text = timeString(time: TimeInterval(seconds))
        }
    }
    
    func timeString(time:TimeInterval) -> String {
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        
        return String(format: "%02i:%02i:%02i", hours,minutes,seconds)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func toggleButtons(){
        startButton.toggle()
        stopButton.toggle()
        pauseButton.toggle()
    }
}

extension UIButton {
    func toggle(){
        if self.isEnabled == true {
            self.isEnabled = false
        } else {
            self.isEnabled = true
        }
    }
}
