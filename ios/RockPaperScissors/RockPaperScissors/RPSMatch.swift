//
//  RPSMatch.swift
//  RockPaperScissors
//
//  Created by cord7894 on 2017. 8. 17..
//  Copyright © 2017년 rhino. All rights reserved.
//

// MARK: - RPSMatch

// The RPSMatch struct stores the results of a match.
// Later in the course we will store multiple matches in an array, so users can track their match history.
import Foundation

struct RPSMatch{
    // MARK: Properties
    let user:RPS
    let opponent:RPS
    
    //MARK: Initalizer
    init(user:RPS, opponent:RPS) {
        self.user = user
        self.opponent = opponent
    }
    
    // MARK : Computerd Properties
    var winner:RPS{
        get{
            return user.defeats(opponent) ? user : opponent
        }
    }
    
    var loser:RPS{
        get{
            return user.defeats(opponent) ? opponent : user
        }
    }
}
