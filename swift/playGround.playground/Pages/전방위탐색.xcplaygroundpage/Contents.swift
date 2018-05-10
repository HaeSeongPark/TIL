//: [Previous](@previous)

import Foundation

extension String {
    public subscript(aRange: NSRange) -> String {
        let start = index(startIndex, offsetBy: aRange.location)
        let end = index(start, offsetBy: aRange.length)
        return String(self[start..<end])
    }
}

//let input = "[ { \"name\" : \"master's course\", \"opened\" : true }, [ \"java\", \"javascript\", \"swift\" ] ]"
let input = "[ 10, 20, 30, 40, 50]"
// (?<={).*(?=})
//let pattern = "\\[.*\\]"
let pattern = "(?<=\\[).*(?=\\])"
var regex = try! NSRegularExpression(pattern: pattern, options: .caseInsensitive)
let matches = regex.matches(in: input, options: [], range: NSRange(location: 0, length:input.count))
let firstmatch = regex.firstMatch(in: input, options: [], range: NSRange(location: 0, length: input.count))
matches.count
firstmatch?.numberOfRanges

let realInput = input[firstmatch! .range]

let numberPatren = "\\d+"
regex = try! NSRegularExpression(pattern: numberPatren, options: [])
let numberMatchs = regex.matches(in: realInput, options: [], range: NSRange(location: 0, length: realInput.count))

numberMatchs.count

let separatedInput = realInput.split(separator: ",")
separatedInput[0].description

//guard let firstMatch = regex.firstMatch(in: input, options: [], range: NSRange(location: 0, length: input.count)) else {
//    throw Error
//}


//let str = "Hey @alex, whatsup. @brian @mary cool photo"
//let len = str.count // if Swift 2.0 use: str.characters.count
//
//let regex = NSRegularExpression(pattern: "@([a-zA-Z0-9-_]+)", options: [])
//let matches = regex!.matchesInString(str, options: nil, range: NSMakeRange(0,len))
//let nStr = str as NSString
//
//for m in matches {
//    let r = m.rangeAtIndex(1)
//    println(nStr.substringWithRange(r)) // Use print in Swift 2.0
//}
