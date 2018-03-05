let centimeterValueWithUnit:String = "120cm"
let centimeterUnitIndex = centimeterValueWithUnit.index(of: "c") ?? centimeterValueWithUnit.endIndex
let centimeterValueWithOutUnit = centimeterValueWithUnit[..<centimeterUnitIndex]
let convertedToDouble = Double(centimeterValueWithOutUnit)!
let convertedToMeter = convertedToDouble * 0.01
print("\(convertedToMeter)m")

//let meterValueWithUnit:String = "1.86m"
//let meterUnitIndex = meterValueWithUnit.index(of: "m") ?? meterValueWithUnit.endIndex
//let meterValueWithOutUnit = meterValueWithUnit[..<meterUnitIndex]
//let convertedToDouble = Double(meterValueWithOutUnit)!
//let convertedToCentimeter = convertedToDouble * 100
//print("\(convertedToCentimeter)cm")


