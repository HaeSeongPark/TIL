//
//  RPSViewController.swift
//  RockPaperScissors
//
//  Created by cord7894 on 2017. 8. 17..
//  Copyright © 2017년 rhino. All rights reserved.
//

import UIKit

class RPSViewController: UIViewController {
    
    // MARK: Properties
    var match:RPSMatch!
    
    // MARK: Outlets
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    
    // MARK:Actions
    @IBAction func makeYourMove(_ sender: UIButton){
        switch sender {
        case self.paperButton:
            throwDown(RPS.paper)
        case self.rockButton:
            throwDown(RPS.rock)
        case self.scissorsButton:
            throwDown(RPS.scissors)
        default:
            assert(false, "An unknown button is invoking makeYourMove()")
        }
    }
    
    // MARK: Play!
    func throwDown(_ playersMove:RPS)
    {
        // Here hte RPS enum generates the opponent's move
        let computersMove = RPS()
        
        // The RPSMatch struct stores the results of a match
        self.match = RPSMatch(user: playersMove, opponent: computersMove)
        
        performSegue(withIdentifier: "throwDown", sender: self)
    }
    
    //MARK: Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //Notice that this code works for both Scissors and Paper
        
         let controller = segue.destination as! ResultsViewController
         controller.match = self.match
 
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

