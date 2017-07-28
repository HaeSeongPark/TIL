//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

protocol Souschef
{
    var hungry: Bool { get }
    var name: String { get }
    func chop(vegetable:String) -> String
    func rinse(vegetable:String) -> String
}

class Roommate: Souschef, Equatable{
    var hungry = true
    var name: String
    
    init(hungry: Bool, name:String) {
        self.hungry = hungry
        self.name = name
    }
    
    func chop(vegetable: String) -> String {
        return "She's choppin' \(vegetable)!"
    }
    
    func rinse(vegetable: String) -> String {
        return "The \(vegetable) is so fresh and so clean"
    }
}

func ==(lhs: Roommate, rhs: Roommate) -> Bool {
    return lhs.name == rhs.name && lhs.hungry == rhs.hungry
}