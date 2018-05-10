
import Foundation


//let input = "[ 10,20,30,40,50,6.0, true, \"dsf\"]"
//let input2 = "[ false, 10, \"2.0\", 30, 4.0, 50, \"sdf\"]"
//let object = "{ \"name\" : \"KIM JUNG\", \"alias\" : \"JK\", \"level\" : 5, \"children\" : [\"hana\", \"hayul\", \"haun\"] }"
let numberPattern = "\\d+\\.?\\d*"
let boolPattern = "false|true"
//let stringPattern = "\"[^\"]+?\""  // 쌍따옴표 안에 "을 제왼한 나머지 문자들 쌍따옴표 안에 " 없다고 가정
let stringPattern = "\"[^\"]+?\""
let arrayPattern = "(?<=\\[)(?:\\s*(\(stringPattern)|\(boolPattern)|\(numberPattern)))(?:\\s*,\\s*(?:\(stringPattern)|\(boolPattern)|\(numberPattern)))*(?=\\])"

//let objectPattern = "(?<=\\{)(?:\\s*(?:\(numberPattern)|\(boolPattern)|\(stringPattern)))(?:\\s*,\\s*(?:\(numberPattern)|\(boolPattern)|\(stringPattern)))*(?=\\})"
//

//let regex = try NSRegularExpression(pattern: objectPattern)
//
//if let firstMatch = regex.firstMatch(in: object, options: [], range: NSRange(location: 0, length: object.count))  {
//    print("zzz")
//} else {
//    print("낮 메취..")
//}

//let stringaaa = "\"sdfdf\""
//let regexString = try NSRegularExpression(pattern: stringPattern)
//
//if let firstMatch = regexString.firstMatch(in: stringaaa, options: [], range: NSRange(location: 0, length: stringaaa.count))  {
//    print("zzz")
//} else {
//    print("낮 메취..")
//}

let input = "{ \"name\" : \"KIM JUNG\", \"alias\" : \"JK\", \"level\" : 5, \"married\" : true }"

//let objectPattern = "(?<=\\{)(?:\\s*(\(stringPattern)|\(boolPattern)|\(numberPattern)))(?:\\s*,\\s*(?:\(stringPattern)|\(boolPattern)|\(numberPattern)))*(?=\\})"

let objectPattern = "(?<=\\{)(?:\\s*\(stringPattern)\\s*:\\s*(\(stringPattern)|\(boolPattern)|\(numberPattern)))(?:\\s*,\\s*(?:\(stringPattern)\\s*:\\s*(\(stringPattern)|\(boolPattern)|\(numberPattern))))*\\s*(?=\\})"

/*
  (?<=\{)(?:\s*"[^\"]+?"\s*:\s*("[^\"]+?"|true|false|\d*\.?\d*))(?:\s*,\s*(?:"[^\"]+?"\s*:\s*("[^\"]+?"|true|false|\d*\.?\d*)))*\s*(?=\})
 */
extension String {
    public subscript(aRange: NSRange) -> String {
        let start = index(startIndex, offsetBy: aRange.location)
        let end = index(start, offsetBy: aRange.length)
        return String(self[start..<end])
    }
}

private func matches(for pattern: String, in text:String) throws -> [String] {
    let regex = try NSRegularExpression(pattern: pattern, options: [])
    let results = regex.matches(in: text, options: [], range: NSRange(location: 0, length: text.count))
    return results.map { String(text[Range($0.range, in: text)!]) }
}

do {
   let regex = try NSRegularExpression(pattern: objectPattern)
    
    if let firstMatch = regex.firstMatch(in: input, options: [], range: NSRange(location: 0, length: input.count))  {
        
        let valuesInObejct = input[firstMatch.range]
        
        let values = try matches(for: "\\s*\(stringPattern)\\s*:\\s*(\(stringPattern)|\(boolPattern)|\(numberPattern))", in: valuesInObejct)
        
        for value in values {
            let splitedInKeyValue = value.split(separator: ":")
            print(splitedInKeyValue[0].trimmingCharacters(in: .whitespaces) + "," + splitedInKeyValue[1].trimmingCharacters(in: .whitespaces) + ",")
        }
        
    } else {
        print("낮 메취..")
    }
} catch let error {
    print(error)
    print("l")
}



