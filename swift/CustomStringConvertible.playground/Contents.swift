//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

enum RPS{
    case rock, paper, scissors
    
    init() {
        switch arc4random() % 3 {
        case 0:
            self = .rock
        case 1:
            self = .paper
        default:
            self = .scissors
        }
    }
    
    func defeats(_ opponent:RPS) -> Bool
    {
        switch (self, opponent) {
        case (.paper, .rock), (.scissors, .paper), (.rock, .scissors):
            return true;
        default:
            return false;
        }
    }
}

extension RPS: CustomStringConvertible{
    var description:String{
        get{
            switch (self) {
            case .rock:
                return "Rock Rock"
            case .paper:
                return "paper paper"
            case .scissors:
                return "scissors scissors"
            }
        }
    }
}

let rps = RPS()
print(rps)