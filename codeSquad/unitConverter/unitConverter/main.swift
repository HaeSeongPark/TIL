//
//  main.swift
//  unitConverter
//
//  Created by rhino Q on 2018. 3. 5..
//  Copyright © 2018년 rhino Q. All rights reserved.
//

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
    
    var ratio:Double{
        get{
            switch self {
            case .cm: return 1.0
            case .m: return 0.01
            }
        }
    }
    
    var symbol:String{
        get{
            switch self {
            case .cm: return "cm"
            case .m: return "m"
            }
        }
    }
}

var Units:Dictionary<String,LengthUnit> = [
    "cm" : LengthUnit.cm,
    "m" : LengthUnit.m
]

struct Length{
    var lenghtCm = 0.0 // 기본 단위 cm
    
    init(_ length:Double, lengthUnit:LengthUnit){
        lenghtCm = length / lengthUnit.ratio
    }
    
    func convert(to lengthUnit:LengthUnit) -> String{
        return "\(lenghtCm * lengthUnit.ratio)\(lengthUnit.symbol)"
    }
    
    func printResult(_ result:Length, _ resultUnit:LengthUnit){
        switch resultUnit {
        case .cm:
            print(self.convert(to:.m))
        case .m:
            print(self.convert(to: .cm))
        }
    }
}





struct RhinoUnitConverter{
    func start(){
        let userInput = self.getUserInputValue()
        let (lengthWithoutUnit,unit) = self.split(inputValue: userInput)
        let resultUnit = Units[unit]! // 이미 invalidCheck를 했기 때문에 !
        let result = Length(lengthWithoutUnit, lengthUnit: resultUnit)
        result.printResult(result, resultUnit)
    }
    
    func getUserInputValue() -> String{
        print("변환할 값과 단위를 입력해주세요 ex)180cm")
        
        var userInput:String = readLine()!
        while self.invalidCheck(userInput) == false {
            userInput = readLine()!
        }
        return userInput
    }
    
    func invalidCheck(_ userInput:String) -> Bool{
        guard userInput != "" else {
            print("유효하지 않은 값입니다. 다시입력해주세요")
            return false
        }
        
        let (_ ,unit) = split(inputValue: userInput)
        
        guard Units[unit] != nil else {
            print("단위를 적지 않았거나 지원하지 않는 단위를 입력하셨습니다. 다시입력해주세요")
            return false
        }
        
        return true
    }
    //TODO: 정규식으로 간단히 할 수 없는지 알아보기
    func split(inputValue:String) -> (lenghtWithoutUnit:Double, unit:String){
        // inputValue의 시작위치
//        var countIndex:String.Index = inputValue.startIndex
//
//        // inputValue 문자열의 하나하나를 unicodeScalars로 가지고와서
//        for tempChar in inputValue.unicodeScalars {
//            // custom characterset에 있는지 검사하고 없으면 for문 중지하고
//            if CharacterSet.digitAndDot.contains(tempChar) == false {
//                break
//            }
//            // 있으면 countIndex를 하나 증가
//            countIndex = inputValue.index(after: countIndex)
//        }
        guard let countIndex = self.getMatchIndex(for: "[a-zA-Z]", in: inputValue) else {
            return (0.0,"")
        }
        let countStringIndex = inputValue.index(inputValue.startIndex, offsetBy: countIndex)
        
        // 이미 위에서 확인 했으므로 !
        let lenghtWithoutUnit = Double(inputValue[..<countStringIndex].description)!
        let unit:String = inputValue[countStringIndex...].description
        
        return (lenghtWithoutUnit,unit)
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

