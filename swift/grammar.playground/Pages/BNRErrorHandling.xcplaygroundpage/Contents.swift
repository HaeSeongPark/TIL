import Foundation

enum Token {
    case number(value:Int,index:Int)
    case plus(Int)
    case minus(Int)
    case multiply(Int)
    case divide(Int)
}
struct Lexer{
    enum Error:Swift.Error {
        case invalidCharacter(Int,Character)
    }
    let input: String
    var position:String.Index
    
    init(input: String) {
        self.input = input
        self.position = self.input.startIndex
    }
    
    func peek() -> Character? {
//        guard position < input.endIndex else {
//            return nil
//        }
//
//        return input[position]
        
        return position < input.endIndex ? input[position] : nil

    }
    
    mutating func advance() {
        assert( position < input.endIndex, "Cannot advance past endIndex!")
        position = input.index(after: position)
    }
    
    mutating func getNumber() -> Int {
        var value = 0
        
        while let nextCharacter = peek() {
            switch nextCharacter {
            // 또 다른 숫자 value에 추가
            case "0" ... "9":
                let digitValue = Int(String(nextCharacter))!
                value = 10 * value + digitValue
                advance()
            default:
                return value
            }
        }
        return value
    }
    
    mutating func lex() throws -> [Token] {
        var tokens = [Token]()
        
        while let nextCharacter = peek() {
            let distanceToPosition = input.distance(from: input.startIndex, to: position)
            switch nextCharacter {
            case "0" ... "9":
                // 숫자의 시작 - 나머지 구현 필요
                let value = getNumber()
                tokens.append(.number(value:value, index:distanceToPosition))
            case "+":
                tokens.append(.plus(distanceToPosition))
                advance()
            case "-":
                tokens.append(.minus(distanceToPosition))
                advance()
            case "*" :
                tokens.append(.multiply(distanceToPosition))
                advance()
            case "/":
                tokens.append(.divide(distanceToPosition))
                advance()
            case " ":
                // 공백 무시 계속 진행
                advance()
            default:
                // 예상치 못한 결과 - 오류 알림
                throw Lexer.Error.invalidCharacter(distanceToPosition, nextCharacter)
            }
        }
        return tokens
    }
}

class Parser {
    enum Error: Swift.Error {
        case unexpectedEndOfInput
        case invalidToken(Int, String)
    }
    let tokens: [Token]
    var position = 0
    
    init(tokens:[Token]) {
        self.tokens = tokens
    }
    
    func getNextToken() -> Token? {
        guard position < tokens.count else {
            return nil
        }
        
        let token = tokens[position]
        position += 1
        return token
    }
    
    func getNumber() throws -> Int {
        guard let token = getNextToken() else {
            throw Parser.Error.unexpectedEndOfInput
        }
        
        switch token {
        case .number(let value, _):
            return value
        case .plus(let position):
            throw Parser.Error.invalidToken(position,"+")
        case .minus(let position):
            throw Parser.Error.invalidToken(position,"-")
        case .multiply(let position):
            throw Parser.Error.invalidToken(position,"*")
        case .divide(let position):
            throw Parser.Error.invalidToken(position,"/")
        }
    }
    
    func parse() throws -> Int {
        //숫자가 필요
        var value = try getNumber()
        
        while let token = getNextToken() {
            switch token {
            // 숫자 뒤 더하기는 옮음
            case .plus:
                // 더하기 뒤에는 다른 숫자가 와야 함
                let nextNumber = try parse()
                value += nextNumber
            case .minus:
                let nextNumber = try parse()
                value -= nextNumber
            case .multiply:
                let nextNumber = try getNumber()
                value *= nextNumber
            case .divide:
                let nextNumber = try getNumber()
                value /= nextNumber
            // 숫자 뒤 숫자는 그름
            case .number(let value, let position):
                throw Parser.Error.invalidToken(position, String(value))
            }
        }
        return value
    }
}

func evaluate(_ input:String) {
    print("Evaluation: \(input)")
    var lexer = Lexer(input: input)
    
    do {
        let tokens = try lexer.lex()
//        print("Lexer output: \(tokens)")
        
//        checkToens(tokens)
        
        let parser = Parser(tokens: tokens)
        let result = try parser.parse()
        print("Parser output: \(result)")
    } catch Lexer.Error.invalidCharacter(let distanceToPosition, let chracter){
        let emptySapce = repeatElement(" ", count: "Evaluation: ".count + distanceToPosition).joined(separator: "")
        print("\(emptySapce)^")
        print("Input contained an invalid at index \(distanceToPosition) : \(chracter)")
    } catch Parser.Error.unexpectedEndOfInput {
        print("Unexpected end of input during parsing")
    } catch Parser.Error.invalidToken(let distanceToPosition, let token) {
        let emptySapce = repeatElement(" ", count: "Evaluation: ".count + distanceToPosition).joined(separator: "")
        print("\(emptySapce)^")
        print("Invalid token during parsing at index \(distanceToPosition): \(token)")
    }
    catch  {
        print("An error occurred: \(error)")
    }
    print("------------------------------------------------------")
}

//func checkToens(_ tokens:[Token]){
//    var numberCount = 0
//    var minusCount = 0
//    var plustCount = 0
//    for token in tokens{
//        switch token {
//        case .minus:
//            minusCount += 1
//        case .plus:
//            plustCount += 1
//        case .number:
//            numberCount += 1
//        }
//    }
//
//    print("numberCount \(numberCount)")
//}

evaluate("10 + 5 - 3 - 1")
evaluate("1 + 3 + 7a + 8")
evaluate("10 + 3 3 + 7")
evaluate("10 + 3 5")
evaluate("10 + ")
evaluate("1 +2 + abcdefg")
evaluate("12000 + 3 + 5")
evaluate("10 + 5 + ab")
evaluate("10 + 5 5 - 1")
evaluate("45 + 5 -- 1")
evaluate("40-30+20-15+65-95+15")
evaluate("10*3+5*3")
evaluate("10+3*5+3")
evaluate("10+3*5*3")
evaluate("10/2*20+12/3")
evaluate("10 + 3 + 5") // 18
evaluate("10 + 5 - 3 - 1") // 11
evaluate("1 + 3 + 7a + 8") // error
evaluate("10 + 3 + + 7") // error
evaluate("10 + 3 3 + 7") // error
evaluate("10 * 3 * * + 5 * 3") // error

evaluate("10 * 10 - 10 * 5") // 50
evaluate("10 * 3 + 5 * 3") // 45
evaluate("10 + 3 * 5 + 3") // 28
evaluate("10 + 3 * 5 * 3") // 55
evaluate("10 * 4 + 9 / 3 - 3") // 40
evaluate("10 * 4 + 9 / 3 / 3") // 41

// 추가적으로 하 것
// 예선, 본선, 결승 과제
// https://github.com/h-n-y/BigNerdRanch-SwiftProgramming/tree/master/chapter-20
// https://github.com/laurentboileau/swift-programming-bnr-2ed/blob/master/20.%20Error%20Handling/ErrorHandling.playground/Contents.swift
// https://forums.bignerdranch.com/t/gold-challenge-ch-20/11356/4


