//
//  ViewController.swift
//  BlurEffect
//
//  Created by rhino Q on 13/11/2018.
//  Copyright © 2018 rhino Q. All rights reserved.
// https://www.ioscreator.com/tutorials/blur-effect-ios-tutorial-ios10

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var blurStyleSegment: UISegmentedControl!
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func blurImage(_ sender: Any) {
        
        for subview in imageView.subviews {
            subview.removeFromSuperview()
        }
        
        let selectedSegmentIndex = blurStyleSegment.selectedSegmentIndex

        guard let selectedBlurStyle = UIBlurEffect.Style(rawValue: selectedSegmentIndex) else {
            return
        }
        
        let selectedBlurEffect = UIBlurEffect(style: selectedBlurStyle)
        let blurView = UIVisualEffectView(effect: selectedBlurEffect)
        blurView.frame = imageView.bounds
        imageView.addSubview(blurView)
        
    }
}

