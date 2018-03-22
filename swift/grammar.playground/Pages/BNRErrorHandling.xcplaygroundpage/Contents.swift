import Foundation

enum Token {
    case number(Int)
    case plus
}
class Lexer{
    enum Error:Swift.Error {
        case invalidCharacter(Character)
    }
    let input: String
    var position:String.Index
    
    init(input: String) {
        self.input = input
        self.position = self.input.startIndex
    }
    
    func peek() -> Character? {
        guard position < input.endIndex else {
            return nil
        }
        
        return input[position]
    }
    
    func advance() {
        assert( position < input.endIndex, "Cannot advance past endIndex!")
        position = input.index(after: position)
    }
    
    func getNumber() -> Int {
        var value = 0
        
        while let nextCharacter = peek() {
            switch nextCharacter {
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
    
    func lex() throws -> [Token] {
        var tokens = [Token]()
        
        while let nextCharacter = peek() {
            switch nextCharacter {
            case "0" ... "9":
                let value = getNumber()
                tokens.append(.number(value))
            case "+":
                tokens.append(.plus)
                advance()
            case " ":
                // 공백 무시 계속 진행
                advance()
            default:
                throw Lexer.Error.invalidCharacter(nextCharacter)
            }
        }
        return tokens
    }
}

class Parser {
    enum Error: Swift.Error {
        case unexpectedEndOfInput
        case invalidToken(Token)
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
        case .number(let value):
            return value
        case .plus:
            throw Parser.Error.invalidToken(token)
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
                let nextNumber = try getNumber()
                value += nextNumber
            // 숫자 뒤 숫자는 그름
            case .number:
                throw Parser.Error.invalidToken(token)
            }
        }
        return value
    }
}

func evaluate(_ input:String) {
    print("Evaluation: \(input)")
    let lexer = Lexer(input: input)
    
    do {
        let tokens = try lexer.lex()
        print("Lexer output: \(tokens)")
        
        let parser = Parser(tokens: tokens)
        let result = try parser.parse()
        print("Parser output: \(result)")
    } catch Lexer.Error.invalidCharacter(let chracter){
        print("Input contained an invalid character: \(chracter)")
    } catch Parser.Error.unexpectedEndOfInput {
        print("Unexpected end of input during parsing")
    } catch Parser.Error.invalidToken(let token) {
        print("Invalid token during parsing: \(token)")
    } catch  {
        print("An error occurred: \(error)")
    }
}

evaluate("10 + 3 + 5")
evaluate("10 + 3 5")
evaluate("10 + ")
//evaluate("1 +2 + abcdefg")

// 추가적으로 하 것
// 예선, 본선, 결승 과제
// 책 내용 중 이해 안 됐던 것 : Swift.Error


