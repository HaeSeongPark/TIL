import Foundation

let input = "10, 10, 10, \"1.0\", false, true, \"sfdf\""
let numberPattern = "\\d+"
let boolPattern = "false|true"
let stringPattern = "\"[^\"]+\""
let allPattern = "(\(numberPattern)|\(boolPattern)|\(stringPattern))"
let regex = try! NSRegularExpression(pattern: allPattern, options: [])
let matches = regex.matches(in: input, options: [], range: NSRange(location: 0, length: input.count))

let sdf:[String] = matches.map{ String(input[Range($0.range, in:input)!])}
sdf

let replaceMatches = regex.stringByReplacingMatches(in: input, options: [], range: NSRange(location: 0, length: input.count), withTemplate: "$1")



func matches(for regex: String, in text: String) -> [String] {
    
    do {
        let regex = try NSRegularExpression(pattern: regex)
        let results = regex.matches(in: text,
                                    range: NSRange(text.startIndex..., in: text))
        return results.map {
            String(text[Range($0.range, in: text)!])
        }
    } catch let error {
        print("invalid regex: \(error.localizedDescription)")
        return []
    }
}

let string = "🇩🇪€4€9"
let matched = matches(for: "[0-9]", in: string)
let dsf = matches(for:allPattern, in: input)

Double("sdf")

let dsfsdf = "2017/04"
let aaa = dsfsdf.split(separator: "/")
aaa[0]
aaa[1]
