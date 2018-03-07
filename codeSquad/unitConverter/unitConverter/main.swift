//
//  main.swift
//  unitConverter
//
//  Created by rhino Q on 2018. 3. 5..
//  Copyright © 2018년 rhino Q. All rights reserved.
//
// ToDo : // 입력받은 값이 모두 문자열이면 예외처리

import Foundation

/* custom chracterset */
extension CharacterSet {
    static var digitAndDot: CharacterSet {
        return CharacterSet(charactersIn: "0123456789.").union(.decimalDigits)
    }
}

enum LengthUnit:Int{
    case cm
    case m
    case inch
    
    var ratio:Double{
        get{
            switch self {
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

var Units:Dictionary<String,LengthUnit> = [
    "cm" : LengthUnit.cm,
    "m" : LengthUnit.m,
    "inch": LengthUnit.inch
]

struct Length{
    var lenghtCm = 0.0 // 기본 단위 cm
    
    init(_ length:Double, lengthUnit:LengthUnit){
        lenghtCm = length / lengthUnit.ratio
    }
    
    func convert(to lengthUnit:LengthUnit) -> String{
        return "\(lenghtCm * lengthUnit.ratio) \(lengthUnit.symbol)"
    }
    
    func printResult(_ userLength:Length, _ convetUnit:LengthUnit){
        print(userLength.convert(to: convetUnit))
    }
}





struct RhinoUnitConverter{
    func start(){
        let userInput = self.getUserInputValue()
        let (lengthWithoutUnit,lenghtunit, convertUnit) = self.split(inputValue: userInput)
        let resultLengthUnit = Units[lenghtunit]! // 이미 invalidCheck를 했기 때문에 !
        let resultConvertUnit = Units[convertUnit]!
        let userLength = Length(lengthWithoutUnit, lengthUnit: resultLengthUnit)
        userLength.printResult(userLength, resultConvertUnit)
    }
    
    func getUserInputValue() -> String{
        print("변환할 값, 단위와 변환하고 싶은 단위가 있으면 입력해주세요 ex)180cm inch")
        
        var userInput:String = readLine()!
        while self.invalidCheck(userInput) == false {
            userInput = readLine()!
        }
        return userInput
    }
    
    func invalidCheck(_ userInput:String) -> Bool{
                                // 입력받은 값이 모두 문자열이면 예외처리
        guard userInput != "" && getMatchIndex(for: "[0-9]", in: userInput) != nil else {
            print("유효하지 않은 값입니다. 다시입력해주세요")
            return false
        }
        
        let (_ ,lengthunit, convertUnit) = split(inputValue: userInput)
        
        guard Units[lengthunit] != nil && Units[convertUnit] != nil else {
            print("단위를 적지 않았거나 지원하지 않는 단위를 입력하셨습니다. 다시입력해주세요")
            return false
        }
        
        return true
    }
    //TODO: 정규식으로 더 간단히 할 수 없느지 알아보기
    func split(inputValue:String) -> (lengthWithoutUnit:Double, lengthUnit:String, convertUnit:String){

        guard let countIndex = self.getMatchIndex(for: "[a-zA-Z]", in: inputValue) else {
            return (0.0,"", "")
        }
        let countStringIndex = inputValue.index(inputValue.startIndex, offsetBy: countIndex)

        // 이미 위에서 확인 했으므로 !
        let lengthWithoutUnit = Double(inputValue[..<countStringIndex].description)!
        let units:String = inputValue[countStringIndex...].description
        var separatedUnits = units.split(separator: " ")

        let lengthunit = separatedUnits[0].description
        var convertUnit:String = "cm"

        if separatedUnits.count == 1 {
            convertUnit = addConvertUnitWhenNoConvertUnit(lengthunit)
        } else {
            convertUnit = separatedUnits[1].description
        }
        return (lengthWithoutUnit,lengthunit, convertUnit)
    }
    
    func addConvertUnitWhenNoConvertUnit(_ lengtUnit:String) -> String{
        switch lengtUnit {
        case "cm": return "m"
        default: return "cm"
        }
    }
    
    func getMatchIndex(for regex:String, in text:String) ->Int?{
        do{
            let regex = try NSRegularExpression(pattern:regex,options:[])
            let results = regex.firstMatch(in: text, options: [], range: NSRange(text.startIndex..., in: text))
            return results?.range(at: 0).location
        }catch let error {
            print("invalid regex: \(error.localizedDescription)")
            return nil
        }
    }
}

var rhinoUnitConverter = RhinoUnitConverter()
rhinoUnitConverter.start()

