/* 컴파일러 1단계 어휘분석
 어휘분석은 정해놓은 어휘(lexicon)에 따라, 문자열을 token으로 나누는 행위를 말합니다.
 Json step1단계 같은 경우에는
 어휘 :  왼쪽대괄호, 오른쪽대괄호, 쌍따옴표 왼쪽, 쌍따옴표 오른쪽, 콤마
 토큰 :  문자열(String), 숫자(Number), 부울 true/false(Bool)
 //TODO Double
 //TODO string
 //TODO bool지원
 */

import Foundation

enum Token {
    case string(value:String)
    case number(value:Int)
    case bool(value:Bool)
}

struct Lexer{
    enum Error:Swift.Error {
        case invalidFormat
    }
    let input:String
    var position: String.Index
    
    init(input:String) {
        self.input = input
        self.position = self.input.startIndex
    }
    
    func peek() -> Character? {
        return position < input.endIndex ? input[position] : nil
    }
    
    mutating func advance() {
        //TODO: ???
        assert( position < input.endIndex, "Cannot advance past endIndex!")
        position = input.index(after: position)
    }
    
    mutating func getNumber() throws -> Int {
        var value = 0
        
        while let nextChracter = peek() {
            switch nextChracter {
            case "0" ... "9":
                let digitValue = Int(String(nextChracter))!
                value = 10 * value + digitValue
                advance()
            case ",":
                advance()
                return value
            case " ":
                advance()
            case "]" where position == input.index(before: input.endIndex) :
                return value
            default: throw Lexer.Error.invalidFormat
            }
        }
        return value
    }
    
    mutating func bracket() throws -> [Token]{
        var tokens = [Token]()
        // bracket이면 다음 거
        advance()
        
        while let nextCharacter = peek(){
            switch nextCharacter {
            // 숫자이면
            case "0" ... "9":
                let value = try getNumber()
                tokens.append(.number(value: value))
            // 공백과 콤마는 다음으로
            case " ": advance()
            case "]" where position == input.index(before: input.endIndex) :
                return tokens
            default: throw Lexer.Error.invalidFormat
            }
        }
        return tokens
    }
    
    mutating func lex() throws -> [Token] {
        var tokens = [Token]()
        while let nextCharacter = peek(){
            // '[' 로 시작해야한다.
            switch nextCharacter {
            case "[": try tokens = bracket()
            case "]" where position == input.index(before: input.endIndex) :
                return tokens
            default: throw Lexer.Error.invalidFormat
            }
        }
        return tokens
    }
}


func checkTokns(_ tokens:[Token]){
    var numberCount = 0
    var stringCount = 0
    var boolCount = 0
    for token in tokens{
        switch token {
        case .string:
            stringCount += 1
        case .bool:
            boolCount += 1
        case .number:
            numberCount += 1
        }
    }
    print(tokens.count)
    print("\(numberCount), \(stringCount), \(boolCount)")
}

let input = "[ 10, 21, 4, 314, 99, 0, 72 ]"
var lexer = Lexer(input: input)
do{
    let tokens = try lexer.lex()
    checkTokns(tokens)
} catch Lexer.Error.invalidFormat{
    print("유요하지 않은 포맷입니다.")
}
