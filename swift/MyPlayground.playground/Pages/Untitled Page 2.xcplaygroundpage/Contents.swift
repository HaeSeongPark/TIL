//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)
//http://nsscreencast.com/episodes/099-parsing-and-formatting-dates
//http://www.unicode.org/reports/tr35/tr35-25.html#Date_Format_Patterns
let dateFormatter = DateFormatter()
//dateFormatter.dateStyle = .medium
//dateFormatter.timeStyle = .none

let date = Date()

// US English Locale (en_US)
dateFormatter.setLocalizedDateFormatFromTemplate("yyyy/m/dd")
dateFormatter.locale = Locale(identifier: "en_KR")
print(dateFormatter.string(from: date)) // Jan 2, 2001

// French Locale (fr_FR)
dateFormatter.locale = Locale(identifier: "fr_FR")
print(dateFormatter.string(from: date)) // 2 janv. 2001

// Japanese Locale (ja_JP)
dateFormatter.locale = Locale(identifier: "en")
print(dateFormatter.string(from: date)) // 2001/01/02
Locale.preferredLanguages[0]
Locale.current.identifier

let sdf = "2000/00/11"
sdf.components(separatedBy: "/")[2]
