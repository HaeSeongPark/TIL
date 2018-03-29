//: [Previous](@previous)

import Foundation

var str = "Hello, playground"


var a1 : [(x:Int, y:Int)] = [(1,1), (5,1), (1,5), (5,5)]
var a2 : [(x:Int, y:Int)] = [(10,10), (22,10), (22,18), (10,18)]
//(10,10)-(22,10)-(22,18)-(10,18)

var a3 = a2.sorted{ $0.x < $1.x || $0.y < $1.y }
a3
//var a4 = a2.sorted(by:sortPoints)

func sortPoints(this: (x:Int, y:Int), that: (x:Int, y:Int)) -> Bool {
    if this.x < that.x {
        return true
    } else {
        if this.y < that.y {
            return true
        }
    }
    
    return false
}
//   10 10     22 10
//   10 18     22 18
//  leftTop    (x1,y1)  (x3,y3) rightTop
//  leftBottom (x2,y2)  (x4,y4) rightBottom
// x1 == x2 && x3 == x4 && y1 == y3 && y2 == y4
