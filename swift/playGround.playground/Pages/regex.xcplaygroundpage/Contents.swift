import Foundation


//func checkAnyCharacter(_ sdf:Character) -> Bool{
//    print("check \(sdf)")
//    let pattern = "."
//    let regex = NSPredicate(format:"SELF MATCHES %@", pattern)
//    return regex.evaluate(with: sdf)
//}
//let character:Character = "a"
//switch character {
//case _ where checkAnyCharacter(character):
//    print("kkk")
//default:
//    print("kkk")
//}

// func isValidEmail(testStr:String) -> Bool {
// // print("validate calendar: \(testStr)")
// let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
//
// let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
// return emailTest.evaluate(with: testStr)
// }
//
let input = "(11,2)-(3,4)-(5,6)"
////let input = "(1,2)"
//
//typealias Points = [(x:Int,y:Int)]
//var points:Points = []
let pattern = "\\(([0-9]|1[0-9]|2[0-4]),([0-9]|1[0-9]|2[0-4])\\)"
let regex = try! NSRegularExpression(pattern: pattern, options: [])
let matches = regex.matches(in: input, options: [], range: NSRange(location: 0, length: input.count))
matches.count

//for match in matches {
//    print(match.)
//}

let replacedInput = regex.stringByReplacingMatches(in: input,
                                                   options: [],
                                                   range: NSRange(location: 0, length: input.count),
                                                   withTemplate: "$1,$2")



//let input = "\"  sdfsfdf  \""
//let pattern = "\"[^\"]+\""
//let regex = try! NSRegularExpression(pattern: pattern, options: [])
//let mathes = regex.matches(in: input, options: [], range: NSRange(location: 0, length: input.count))
//mathes.count
//let replacedInput = regex.stringByReplacingMatches(in: input,
//                                                   options: [],
//                                                   range: NSRange(location: 0, length: input.count),
//                                                   withTemplate: "$0")
//print(replacedInput)

////
//let separatedInput = replacedInput.split(separator: "-")
//separatedInput.count
//
//for index in 0..<separatedInput.count {
//    let separatedInput2 = separatedInput[index].description.split(separator: ",")
//    points.append((Int(separatedInput2[0].description)!, Int(separatedInput2[1].description)!))
//}
//
//
//for index in 0..<points.count {
//    print("\(points[index].x) \(points[index].y)")
//}
//let emailRegEx = "\\(([0-9]|1[0-9]|2[0-4]),([0-9]|1[0-9]|2[0-4])\\)"
let inputSecond = "cord7894@gmila.com"
let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
emailTest.evaluate(with: inputSecond)

 func isValidEmail(testStr:String) -> Bool {
 // print("validate calendar: \(testStr)")
 let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

 let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
 return emailTest.evaluate(with: testStr)
 }

////let separatedInput2 = separatedInput[0].description.split(separator: ",")
////let sdf = separatedInput2[0].description
////let separatedInput3 = separatedInput[1].description.split(separator: ",")
////let separaredInput4 = separatedInput[2].description.split(separator: ",")
//
//
////https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/Predicates/AdditionalChapters/Introduction.html
//
////JSONSerialization
////https://github.com/apple/swift-corelibs-foundation/blob/master/Foundation/JSONSerialization.swift
