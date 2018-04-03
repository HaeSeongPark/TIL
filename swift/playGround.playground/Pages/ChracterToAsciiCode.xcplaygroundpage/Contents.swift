//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)
extension Character {
    var asciiValue: Int {
        get {
            let s = String(self).unicodeScalars
            return Int(s[s.startIndex].value)
        }
    }
}

var a:Character = "\""
var asci = a.asciiValue
var unicodescalar = Unicode.Scalar.init(asci)!
CharacterSet.alphanumerics.contains(unicodescalar)
