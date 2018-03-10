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
