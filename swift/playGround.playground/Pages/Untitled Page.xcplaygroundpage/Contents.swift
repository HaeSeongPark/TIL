enum LengthUnit:Int{
    case cm
    case m
    case inch
    
    var ratio:Double
    {
        get
        {
            switch self
            {
                case .cm: return 1.0
                case .m: return 0.01
                case .inch: return 0.3937
            }
        }
    }
    
    var symbol:String{
        get{
            switch self {
            case .cm: return "cm"
            case .m: return "m"
            case .inch: return "inch"
            }
        }
    }
}

//struct Length{
//    var lenghtCm = 0.0 // 기본 단위 cm
//
//    init(_ length:Double, lengthUnit:LengthUnit){
//        lenghtCm = length / lengthUnit.ratio
//    }
//
//    func convert(to lengthUnit:LengthUnit) -> String{
//        return "\(lenghtCm * lengthUnit.ratio)\(lengthUnit.symbol)"
//    }
//
//    func printResult(_ userLength:Length, _ convetUnit:LengthUnit){
//        print(userLength.convert(to: convetUnit))
//    }
//}

struct Length{
    // 기본단위cm
    private var length:Double
    private var unit:LengthUnit
    private var convertUnit:LengthUnit
    
    init(length:Double, unit:LengthUnit, convertUnit:LengthUnit){
        self.length = length
        self.unit = unit
        self.convertUnit = convertUnit
    }
    
    mutating func changeToCm(unit:LengthUnit){
        self.length = self.length / unit.ratio
    }
    
    mutating func convert(to convertUnit:LengthUnit){
        print("\(self.length * convertUnit.ratio)\(convertUnit.symbol)")
    }
    
    func printSelf(){
        print("\(user.length) \(user.unit) \(user.convertUnit)")
    }
}

var user:Length = Length(length: 0.0,unit: LengthUnit.cm, convertUnit: LengthUnit.cm)
user = Length(length: 1.1, unit: LengthUnit.m, convertUnit: LengthUnit.m)
user.printSelf()

