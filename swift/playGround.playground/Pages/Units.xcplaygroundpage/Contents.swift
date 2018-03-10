
class Units{
    var defaultValue = 0.0
    var unit:KindsOfUnits
    var convertUnit:KindsOfUnits
    
    init(value:Double, unit:KindsOfUnits, convertUnit:KindsOfUnits){
        self.defaultValue = value
        self.unit = unit
        self.convertUnit = convertUnit
    }
    
    func setBasicValue(_ userInputValue:Double, kindOfUnit:KindsOfUnits){
        defaultValue = userInputValue
    }
    
    
    var rawUnitsAndUnits:Dictionary<String,KindsOfUnits> = [
        "cm" : KindsOfUnits.Length(unit: .cm),
        "m" : KindsOfUnits.Length(unit: .m),
        "inch": KindsOfUnits.Length(unit: .inch),
        "yard": KindsOfUnits.Length(unit: .yard),
        "g":KindsOfUnits.Weight(unit: .g),
        "kg":KindsOfUnits.Weight(unit: .kg),
        "lb":KindsOfUnits.Weight(unit: .lb),
        "oz":KindsOfUnits.Weight(unit: .oz)
    ]
    
    enum KindsOfUnits{
        case Length(unit:LengthUnits)
        case Weight(unit:WeigthUnits)
    }
    
    
    
    enum LengthUnits:Int{
        case cm, m, inch, yard
        
        
        var ratio:Double{
            get{
                switch self {
                case .cm: return 1.0
                case .m: return 0.01
                case .inch: return 0.3937
                case .yard: return 0.0109
                }
            }
        }
        
        var symbol:String{
            get{
                switch self {
                case .cm: return "cm"
                case .m: return "m"
                case .inch: return "inch"
                case .yard: return "yard"
                }
            }
        }
    }
    
    enum WeigthUnits:Int{
        case g, kg, lb, oz
        
        
        var ratio:Double{
            get{
                switch self {
                case .g: return 1.0
                case .kg: return 0.001
                case .lb: return 0.0022
                case .oz: return 0.03527
                }
            }
        }
        
        var symbol:String{
            get{
                switch self {
                case .g: return "g"
                case .kg: return "kg"
                case .lb: return "lb"
                case .oz: return "oz"
                }
            }
        }
    }
}

