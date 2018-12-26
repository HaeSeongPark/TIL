//
//  ViewController.swift
//  CGAffineTransformTest
//
//  Created by rhino Q on 18/12/2018.
//  Copyright © 2018 rhino Q. All rights reserved.
// https://www.hackingwithswift.com/read/15/1/setting-up

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tap: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    var currentAnimation = 0
    
    var rect = CGRect(x: 5, y: 5, width: 10, height: 10)
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func tapped(_ sender: UIButton) {
        
        tap.isHidden = true
        
        UIView.animate(withDuration: 1, delay: 0, options: [],
                       animations: { [unowned self] in
                        switch self.currentAnimation {
                        case 0:
//                            self.imageView.transform = CGAffineTransform(scaleX: -1, y: 1)
                            self.imageView.transform = CGAffineTransform(scaleX: 1, y: -1).translatedBy(x: 100, y: -150)
                        case 1:
                            self.imageView.transform = CGAffineTransform.identity
                        case 2:
                            self.imageView.transform = CGAffineTransform(translationX: -256, y: -256)
                        case 3:
                            self.imageView.transform = CGAffineTransform.identity
                        case 4:
                            self.imageView.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
                        case 5:
                            self.imageView.transform = CGAffineTransform.identity
                        case 6:
                            self.imageView.alpha = 0.1
                            self.imageView.backgroundColor = UIColor.green
                        case 7:
                            self.imageView.alpha = 1
                            self.imageView.backgroundColor = UIColor.clear
                        default:
                            break
                        }
        }) { [unowned self] (finished: Bool) in
            self.tap.isHidden = false
        }
        countCurrentAnimation()
    }
    
    func countCurrentAnimation() {
        currentAnimation += 1
        
        if currentAnimation > 7 {
            currentAnimation = 0
        }
    }
}

