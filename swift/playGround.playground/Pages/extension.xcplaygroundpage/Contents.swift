//extension Double {
//    var km: Double { return self * 1_000.0 }
//    var m: Double { return self }
//    var cm: Double { return self / 100.0 }
//    var mm: Double { return self / 1_000.0 }
//    var ft: Double { return self / 3.28084 }
//}
//let oneInch = 25.4.mm
//print("One inch is \(oneInch) meters")
//// Prints "One inch is 0.0254 meters"
//let threeFeet = 3.ft
//print("Three feet is \(threeFeet) meters")
//// Prints "Three feet is 0.914399970739201 meters"
//
//let oneHundredMeter = 1.cm
//
//
//let aMarathon = 42.km + 195.m
//print("A marathon is \(aMarathon) meters long")
//// Prints "A marathon is 42195.0 meters long"

typealias Weigth = Double
extension Weigth{
    
}


typealias Length = Double
extension Length{
    var cm:Length { return self }
    var m:Length { return self * 0.01 }
    var inch:Length { return self * 0.3937}
    var supprotUnit:[String] {
        return ["cm","m","inch"]
    }
}
var weigth:Weigth = 10
weigth.m
weigth.supprotUnit

var value:Length = 10
value.m
value.inch
