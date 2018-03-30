 //
//  ViewController.swift
//  MusicPlayer
//
//  Created by rhino Q on 2018. 3. 30..
//  Copyright © 2018년 rhino Q. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var playPauseButton: UIButton!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var progressSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func touchUpPlayPauseButton(_ sender: UIButton) {
        print("Button tapped")
    }
    
    @IBAction func slideValueChanged(_ sender: UISlider) {
        print("slider value changed")
    }
    
 }

