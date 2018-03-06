//
//  main.swift
//  unitConverter
//
//  Created by rhino Q on 2018. 3. 5..
//  Copyright © 2018년 rhino Q. All rights reserved.
//

import Foundation

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
    
    func valueOfLengthUnit(lengthUnit:LengthUnit) -> String{
        return "\(lenghtCm * lengthUnit.ratio)\(lengthUnit.symbol)"
    }
    
    func printResult(_ result:Length, _ resultUnit:LengthUnit){
        switch resultUnit {
        case .cm:
            print(self.valueOfLengthUnit(lengthUnit:.m))
        case .m:
            print(self.valueOfLengthUnit(lengthUnit: .cm))
        }
    }
}





struct RhinoUnitConverter{
    func start(){
        let userInput = self.getUserInputValue()
        let (lengthWithoutUnit,unit) = self.splitIntoLenghtAndUnit(inputValue: userInput)
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
        
        let (_ ,unit) = splitIntoLenghtAndUnit(inputValue: userInput)
        
        guard Units[unit] != nil else {
            print("단위를 적지 않았거나 지원하지 않는 단위를 입력하셨습니다. 다시입력해주세요")
            return false
        }
        
        return true
    }
    //TODO: 정규식으로 간단히 할 수 없는지 알아보기
    func splitIntoLenghtAndUnit(inputValue:String) -> (lenghtWithoutUnit:Double, unit:String){
        // 숫자 셋 지정
        let digitsAndDot:[Character] = ["0","1","2","3","4","5","6","7","8","9","."]
        //문자열의 첫번 째 인 덱스
        var tempIndex = inputValue.startIndex
        // 숫자와 닷이 아닐 때까지 돈다
        while tempIndex < inputValue.endIndex && digitsAndDot.contains(inputValue[tempIndex]) == true {
            tempIndex = inputValue.index(after: tempIndex)
        }
        // 이미 위에서 확인 했으므로 !
        let lenghtWithoutUnit = Double(inputValue[..<tempIndex].description)!
        let unit:String = inputValue[tempIndex...].description
        
        return (lenghtWithoutUnit,unit)
    }
}

var rhinoUnitConverter = RhinoUnitConverter()
rhinoUnitConverter.start()
