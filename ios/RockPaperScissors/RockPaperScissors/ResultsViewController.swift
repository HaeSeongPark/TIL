//
//  ResultsViewController.swift
//  RockPaperScissors
//
//  Created by cord7894 on 2017. 8. 17..
//  Copyright © 2017년 rhino. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    // MARK: Properties
    var match: RPSMatch!
    var message: NSString!
    var pictrue: UIImage!
    
    // MARK: Outlets
    @IBOutlet weak var resultImageView: UIImageView!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var playAgainButton: UIButton!
    
    // MARK: Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.messageLabel.text = messageForMatch(match)
        self.resultImageView.image = imageForMatch(match)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 1.5){
            self.resultImageView.alpha = 1;
        }
    }
    
    // MARK: Actions
    
    @IBAction func playAgainButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK:Messages for Match
    func messageForMatch(_ match:RPSMatch) -> String
    {
        if match.user == match.opponent {
            return "It's a tie"
        }
        
        // Here we build up the results message "RockCrushesScissors. You Win!" etc.
        return "You : \(match.user), Opponent : \(match.opponent) \(resultString(match))"
//        return match.winner.description + " " + victoryModeString(match.winner) + " " + match.loser.description + ". " + resultString(match)
    }
    
    func resultString(_ match:RPSMatch) -> String
    {
        return match.user.defeats(match.opponent) ? " You Win!" : " You Lose!"
    }
    
    func victoryModeString(_ gesture:RPS) -> String{
        switch gesture {
        case .rock:
            return "crushes"
        case .scissors:
            return "cuts"
        case .paper:
            return "covers"
        }
    }
    
    func imageForMatch(_ match:RPSMatch) -> UIImage
    {
        var name = ""
        
        switch match.winner {
        case .rock:
            name = "RockCrushesScissors"
        case .paper:
            name = "PaperCoversRock"
        case .scissors:
            name = "ScissorsCutPaper"
        }
        
        if match.user == match.opponent{
            name = "itsATie"
        }
        return UIImage(named: name)!
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
