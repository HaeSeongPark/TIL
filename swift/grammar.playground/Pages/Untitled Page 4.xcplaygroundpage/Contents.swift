import Foundation

let input = "15,7, 3 ,, [1,2,[3, 4, 5], 6],8"
//let input = "5,7,[1]"
var index = input.characters.startIndex
var lookahead = input[index]
var done = false

func eat() {
    index = input.index(after: index)
    if index != input.endIndex {
        lookahead = input[index]
    } else {
        done = true
    }
}

func bracket() -> String {
    var symbol = "["
    eat()
    
    while index != input.endIndex {
        switch lookahead {
        case "[":
            symbol += bracket()
            
        case "]":
            eat()
            return symbol + "]"
            
        default:
            symbol += String(lookahead)
            eat()
        }
    }
    
    fatalError("Missing closing ]")
}

func parseNext() -> String {
    var symbol = ""
    while index != input.endIndex {
        switch lookahead {
        case "[":
            symbol += bracket()
            
        case ",":
            eat()
            return symbol
        case " ":
            eat()
        default:
            symbol += String(lookahead)
            eat()
        }
    }
    return symbol
}

var output: [String] = []
while !done {
    output.append(parseNext())
}

print(output)

// Output is: ["15", "7", " 3 ", "", " [1,2,[3, 4, 5], 6]", "8"]
