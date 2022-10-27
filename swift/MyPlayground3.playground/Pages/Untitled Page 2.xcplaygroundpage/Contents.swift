//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

"4 5".components(separatedBy: " ")

//: [Next](@next)


//let info = readLine()!.components(separatedBy: " ").map { Int($0)! }
//let inputCount:Int = info[0]
//let capacity:Int = info[1]
//var candidates:[(Int,Int)] = []
//var pack:[[Int]] = []
//// (weight, value)
//for _ in 0..<inputCount {
//    let info = readLine()!.components(separatedBy: " ").map { Int($0)! }
//    candidates.append((info[0], info[1]))
//}
//
//for i in 0...candidates.count {
//    for c in 0...capacity {
//        if i == 0 || c == 0 {
//            pack[i].append(0)
//        } else if candidates[i].0 <= c {
//            pack[i].append(
//                max(
//                    candidates[i-1].1 + pack[i-1][c-candidates[i-1].1],
//                    pack[i-1][c]
//                )
//            )
//        } else {
//            pack[i].append(pack[i-1][c])
//        }
//    }
//}

//
let input:[(Int,Int)] = [
//    (6,13),
//    (4,8),
//    (3,6),
//    (1,12)
    (12,4),
    (1,2),
    (4,10),
    (1,1),
    (2,2)
]

func test(candidates:[(Int,Int)]) {
    let capacity = 15
    var pack:[[Int]] = []
    
    for i in 0...candidates.count {
        pack.append([])
        for c in 0...capacity {
            if i == 0 || c == 0 {
                pack[i].append(0)
            }
            else if candidates[i-1].0 <= c {
                pack[i].append(
                    max(
                        candidates[i-1].1 + pack[i-1][c-candidates[i-1].0],
                        pack[i-1][c]
                    )
                )
            }
            else {
                pack[i].append(pack[i-1][c])
            }
        }
    }
    
    print(pack[pack.count-1].last!)
}


test(candidates: input)
