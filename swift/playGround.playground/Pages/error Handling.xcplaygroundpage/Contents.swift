import Foundation
// from developer document

enum IntParsingError: Error {
    case overflow
    case invalidInput(String)
}
//
//extension Int {
//    init(validating input: String) throws {
//        // ...
//        if !_isValid(input) {
//            throw IntParsingError.invalidInput(input)
//        }
//        // ...
//    }
//}
//
//do {
//    let price = try Int(validating: "$100")
//} catch IntParsingError.invalidInput(let invalid) {
//    print("Invalid character: '\(invalid)'")
//} catch IntParsingError.overflow {
//    print("Overflow error")
//} catch {
//    print("Other error")
//}

//Including More Data in Errors

//struct XMLParsingError: Error {
//    enum ErrorKind {
//        case invalidCharacter
//        case mismatchedTag
//        case internalError
//    }
//
//    let line: Int
//    let column: Int
//    let kind: ErrorKind
//}
//
//func parse(_ source: String) throws -> XMLDoc {
//    // ...
//    throw XMLParsingError(line: 19, column: 5, kind: .mismatchedTag)
//    // ...
//}
//
//do {
//    let xmlDoc = try parse(myXMLData)
//} catch let e as XMLParsingError {
//    print("Parsing error: \(e.kind) [\(e.line):\(e.column)]")
//} catch {
//    print("Other error: \(error)")
//}
// Prints "Parsing error: mismatchedTag [19:5]"
