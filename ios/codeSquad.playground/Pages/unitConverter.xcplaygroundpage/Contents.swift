let multiplierCmtoM:Double = 0.01
let multiplierMToCm:Double = 100

func unitConverter(input:String){
    // "c"가 있으면 cm 그렇지 않으면 m
    if input.contains("c") {
        let centimeterValueWithUnit:String = input
        let centimeterUnitIndex = centimeterValueWithUnit.index(of: "c") ?? centimeterValueWithUnit.endIndex
        let centimeterValueWithOutUnit = centimeterValueWithUnit[..<centimeterUnitIndex]
        let convertedToDouble = Double(centimeterValueWithOutUnit)!
        let convertedToMeter = convertedToDouble * multiplierCmtoM
        print("\(convertedToMeter)m")
    } else {
        let meterValueWithUnit:String = input
        let meterUnitIndex = meterValueWithUnit.index(of: "m") ?? meterValueWithUnit.endIndex
        let meterValueWithOutUnit = meterValueWithUnit[..<meterUnitIndex]
        let convertedToDouble = Double(meterValueWithOutUnit)!
        let convertedToCentimeter = convertedToDouble * multiplierMToCm
        print("\(convertedToCentimeter)cm")
    }
}
unitConverter(input: "170cm")
unitConverter(input: "1.8m")

