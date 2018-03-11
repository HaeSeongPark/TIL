//struct Length {
//    var lengthCm:Double
//
//    enum LengthUnit:String{
//        case cm, m, inch, yard
//
//        var ratio:Double{
//            switch self {
//            case .cm: return 1.0
//            case .m: return 0.01
//            case .inch: return 0.3937
//            case .yard: return 0.109
//            }
//        }
//
//        var symbol:String{
//            switch self {
//            case .cm: return "cm"
//            case .m: return "m"
//            case .inch: return "inch"
//            case .yard: return "yard"
//            }
//        }
//    }
//
//    init(_ length:Double){
//        lengthCm = length
//    }
//    init(_ length:Double, lengthUnit:LengthUnit){
//        lengthCm = length / lengthUnit.ratio
//    }
//
//    func convert(to convertUnit:LengthUnit) -> String {
//        return"\(lengthCm * convertUnit.ratio)\(convertUnit.symbol)"
//    }
//}

var abc = "12380"
let vowels: Set<Character> = ["a","e","c","b"]

for c in abc{
    if vowels.contains(c) {
        print("\(c) is contain")
    } else {
        print("\(c) is not contain")
    }
}

