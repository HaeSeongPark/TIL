//
//  ViewController.swift
//  Roshambo
//
//  Created by cord7894 on 2017. 8. 14..
//  Copyright © 2017년 rhino. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // MARK: Segue with Code Approach
    @IBAction private func play(_ sender: UIButton){
        performSegue(withIdentifier: "play", sender: sender)
    }
    
    // MARK: Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "play"{
            let vc = segue.destination as! ResultViewController
            vc.userChoice = getUserShape(sender as! UIButton)
        }
    }
    
    // MARK:Utillties
    // The enum "Shape" represents a play or more
    private func getUserShape(_ sender: UIButton) -> Shape{
        // Titles are set to one of: Rock, Paper or Scissors
        let shape = sender.title(for: UIControlState())!
//        let shape = sender.currentTitle!
        return Shape(rawValue: shape)!
    }
}

