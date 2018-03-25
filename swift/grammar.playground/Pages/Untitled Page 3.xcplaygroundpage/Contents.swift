//: [Previous](@previous)

import Foundation



enum Token {
    case number(value: Int, pos: Int)
    case plus(pos: Int)
    case minus(pos: Int)
    case mult(pos: Int)
    case div(pos: Int)
    
    func returnNumberValue() -> Int{
        switch self {
        case .number(let value, _):
            return value
        default:
            return 0
        }
    }
}

class Lexer {
    enum Error: Swift.Error {
        case invalidCharacter(Character, Int)
    }
    
    let input: String.CharacterView
    var position: String.CharacterView.Index
    
    init(input: String) {
        self.input = input.characters
        self.position = self.input.startIndex
    }
    
    func peek() -> Character? {
        guard position < input.endIndex else {
            return nil
        }
        return input[position]
    }
    
    func advance() {
        assert(position < input.endIndex, "Cannot advance past endIndex!")
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
                //A nondigit - go back to regular lexing
                return value
            }
        }
        return value
    }
    
    func lex() throws -> [Token] {
        var tokens = [Token]()
        while let nextCharacter = peek() {
            let tokenPosInInput = input.distance(from: input.startIndex, to: position)
            switch nextCharacter {
            case "0" ... "9":
                let value = getNumber()
                tokens.append(.number(value: value, pos: tokenPosInInput))
            case "+":
                tokens.append(.plus(pos: tokenPosInInput))
                advance()
            case "-":
                tokens.append(.minus(pos: tokenPosInInput))
                advance()
            case "*":
                tokens.append(.mult(pos: tokenPosInInput))
                advance()
            case "/":
                tokens.append(.div(pos: tokenPosInInput))
                advance()
            case " ":
                advance()
            default:
                throw Lexer.Error.invalidCharacter(nextCharacter, tokenPosInInput)
            }
        }
        return tokens
    }
}

class Parser {
    enum Error: Swift.Error {
        case unexpectedEndOfInput
        case invalidToken(String, Int)
        case impossibleError
    }
    
    var tokens: [Token]
    var position = 0
    
    init(tokens: [Token]) {
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
        case .plus(let pos):
            throw Parser.Error.invalidToken("+", pos)
        case .minus(let pos):
            throw Parser.Error.invalidToken("-", pos)
        case .mult(let pos):
            throw Parser.Error.invalidToken("*", pos)
        case .div(let pos):
            throw Parser.Error.invalidToken("/", pos)
            
        }
    }
    
    func parse() throws -> Int {
        
        //Checking for all possible parsing errors
        var value = try getNumber()
        while let token = getNextToken() {
            switch token {
            case .number(let value, let pos):
                throw Parser.Error.invalidToken(String(value), pos)
            default:
                try getNumber()
            }
        }
        position = 0
        
        //resolving * and /
        while let token = getNextToken() {
            switch token {
            case .mult:
                value = tokens[position-2].returnNumberValue()
                let nextNumber = try getNumber()
                value *= nextNumber
                tokens[position-1] = .number(value: value, pos: 0)
                tokens.remove(at: position-2)
                tokens.remove(at: position-3)
                position = 0
            case .div:
                value = tokens[position-2].returnNumberValue()
                let nextNumber = try getNumber()
                value /= nextNumber
                tokens[position-1] = .number(value: value, pos: 0)
                tokens.remove(at: position-2)
                tokens.remove(at: position-3)
                position = 0
            default:
                break
            }
        }
        position = 0
        
        //resolving + and -
        value = try getNumber()
        while let token = getNextToken() {
            switch token {
            case .plus:
                let nextNumber = try getNumber()
                value += nextNumber
            case .minus:
                let nextNumber = try getNumber()
                value -= nextNumber
            default:
                throw Parser.Error.impossibleError
            }
        }
        return value
    }
}

func evaluate(_ input: String) {
    print("Evaluating: \(input)")
    let lexer = Lexer(input: input)
    do {
        let tokens = try lexer.lex()
        let parser = Parser(tokens: tokens)
        let result = try parser.parse()
        print("Parser output: \(result)")
    } catch Lexer.Error.invalidCharacter(let character, let pos){
        var strPointError = String(repeatElement(" ", count: pos + 12))
        strPointError += "^"
        print(strPointError)
        print("Input contained an invalid character at index \(pos): \(character)")
    } catch Parser.Error.unexpectedEndOfInput {
        print("Unexpected end of input during parsing.")
    } catch  Parser.Error.invalidToken(let token, let pos){
        var strPointError = String(repeatElement(" ", count: pos + 12))
        strPointError += "^"
        print(strPointError)
        print("Invalid token during parsing at index \(pos): \(token)")
        
    } catch {
        print("An error ocurred: \(error)")
    }
    print("------------------------------------------------------")
}

evaluate("12000 + 3 + 5")
evaluate("10 + 5 + ab")
evaluate("10 + 5 5 - 1")
evaluate("45 + 5 -- 1")
evaluate("40-30+20-15+65-95+15")

evaluate("10*3+5*3")
evaluate("10+3*5+3")
evaluate("10+3*5*3")

evaluate("10/2*20+12/3")
