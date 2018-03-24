/////////////////// all case in enum from google

import Foundation
protocol EnumCollection: Hashable {
    static func cases() -> AnySequence<Self>
    static var allValues: [Self] { get }
}


extension EnumCollection {
    public static func cases() -> AnySequence<Self> {
        return AnySequence { () -> AnyIterator<Self> in
            var raw = 0
            return AnyIterator {
                let current: Self = withUnsafePointer(to: &raw) { $0.withMemoryRebound(to: self, capacity: 1) { $0.pointee } }
                guard current.hashValue == raw else {
                    return nil
                }
                raw += 1
                return current
            }
        }
    }
    
    public static var allValues: [Self] {
        return Array(self.cases())
    }
}
////////////

protocol UnitRatioAndSymbol {
    var ratio:Double { get }
    var symbol:String { get }
    
}

protocol Unit{
    func changeToBasicValue(_ value:Double, _ unit:UnitRatioAndSymbol) -> Double
    func convert(basicValue:Double, to convertUnit:UnitRatioAndSymbol) -> String
}

extension Unit{
    func changeToBasicValue(_ value:Double, _ unit:UnitRatioAndSymbol) -> Double{
        return value / unit.ratio
    }
    func convert(basicValue: Double, to convertUnit:UnitRatioAndSymbol) -> String {
        return "\(basicValue * convertUnit.ratio)\(convertUnit.symbol)"
    }
}


struct Length:Unit {

    enum LengthUnit:String,UnitRatioAndSymbol, EnumCollection{
        
        case cm, m, inch, yard
        
        var ratio:Double{
            switch self {
            case .cm: return 1.0
            case .m: return 0.01
            case .inch: return 0.3937
            case .yard: return 0.109
            }
        }
        
        var symbol:String{
            switch self {
            case .cm: return "cm"
            case .m: return "m"
            case .inch: return "inch"
            case .yard: return "yard"
            }
        }
    }
}
print(Length())
var length = Length()
var basicValue = length.changeToBasicValue(1.8, Length.LengthUnit(rawValue: "m")!)
var convertValue = length.convert(basicValue: basicValue, to: Length.LengthUnit.inch)
sqrt(4)
pow(4, 0.5)
