enum VolumeUnit:String{
    case hop, doe, mal, L
    
    var ratio:Double{
        get{
            switch self {
            case .hop: return 1.0
            case .doe: return 0.1
            case .mal: return 0.01
            case .L: return 0.18039
            }
        }
    }
    
    var symbol:String{
        get{
            switch self {
            case .hop: return "g"
            case .doe: return "kg"
            case .mal: return "lb"
            case .L: return "oz"
            }
        }
    }
}

var sfd = VolumeUnit(rawValue:"")


enum ArithmeticExpression{
    case number(Int)
    indirect case addition(ArithmeticExpression, ArithmeticExpression)
    indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
}

let five = ArithmeticExpression.number(5)
let four = ArithmeticExpression.number(4)
let sum = ArithmeticExpression.addition(five, four)
let product = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))

func evaluate(_ expression: ArithmeticExpression) -> Int {
    switch expression {
    case let .number(value):
        return value
    case let .addition(left, right):
        return evaluate(left) + evaluate(right)
    case let .multiplication(left, right):
        return evaluate(left) * evaluate(right)
    }
}

print(evaluate(product))
