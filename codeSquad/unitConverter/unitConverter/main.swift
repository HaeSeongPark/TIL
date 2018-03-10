//
//  main.swift
//  test
//
//  Created by rhino Q on 2018. 3. 8..
//  Copyright © 2018년 rhino Q. All rights reserved.
//
/*
 // 단위변환기 step7 무게단위변환 JK피드백 반영
 ✅  무게와 부피가 추가됐는데, Unit 이나 Units 에는 들어갔는데 객체는 Length 뿐이네요. 무게랑 부피는 객체가 없나요?
 Unit 에 길이, 무게, 부피가 다 들어있는데 다 합쳐서 표현하는게 좋을까요? 아니면 의미 단위로 분리하는게 좋을까요?
 어떻게 생각하세요?
 분리해야 한다고 생각합니다!
 ➡️  LengthUnit, Length, WeightUnit, Weigth, Volume, VolumeWeigth 만들어서 의미 단위로 분리했습니다!
 
 RhinoUnitConverter 객체가 조금 복잡해 보입니다.
 입력하고 검사하는 객체와 변환을 담당하는 객체, 그리고 결과를 출력하는 객체로... 분리해봅시다.
 start() 함수는 어디에 포함되야 할까요?
 
 ➡️ 변환과 출력은 Length, Weigth, Volume 각각 객체에서 담당하게 했습니다.
 
 ➡️ RhinoUnitConverter가 복잡해 보이는 것은 유효체크를 하는 것 때문이라고 판단되서
 입력하는 것과 start()는 그대로 RhinoUnitConverter에 두고
 검사하는 객체만 InvalidChecker로 따로 만들기
 
 값나오게 하기
 
 */

import Foundation

/////////////////// all case in enum from google
public protocol EnumCollection: Hashable {
    static func cases() -> AnySequence<Self>
    static var allValues: [Self] { get }
}


public extension EnumCollection {
    
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



struct Weigth:Unit {
    enum WeigthUnit:String, UnitRatioAndSymbol, EnumCollection{
        case g="g", kg="kg", lb="lb", oz="oz"
        
        var ratio:Double{
            switch self {
            case .g: return 1.0
            case .kg: return 0.001
            case .lb: return 0.0022
            case .oz: return 0.03527
            }
        }
        
        var symbol:String{
            switch self {
            case .g: return "g"
            case .kg: return "kg"
            case .lb: return "lb"
            case .oz: return "oz"
            }
        }
    }
}


struct Volume:Unit {
    enum VolumeUnit:String, UnitRatioAndSymbol, EnumCollection{
        case hop, doe, mal, L
        
        var ratio:Double{
            switch self {
            case .hop: return 1.0
            case .doe: return 0.1
            case .mal: return 0.01
            case .L: return 0.18039
            }
        }
        
        var symbol:String{
            switch self {
            case .hop: return "g"
            case .doe: return "kg"
            case .mal: return "lb"
            case .L: return "oz"
            }
        }
    }
}

struct InvalidChecker{
    
    func isAvailable(_ userInput:String) -> Bool{
        // enter와 문자로만 된 것 방지
        guard userInput != "" && self.matchIndex(for: "[0-9]", in: userInput) != nil else {
            print("유효하지 않은 값입니다. 다시입력해주세요")
            return false
        }
        return true
    }
    
    func isThereUnit(_ rawUserUnit:String, _ rawUserConvertUnit:String ) -> Bool {
        if rawUserUnit == "" && rawUserConvertUnit == "" {
            print("단위를 입력하지 않았습니다. 다시입력해주세요")
            return false
        }
        return true
    }
    
    func isSupportUnit(_ allUnits:[String],_ rawUserUnit:String, _ rawUserConvertUnit:String) -> Bool{
        if allUnits.contains(rawUserUnit) && allUnits.contains(rawUserConvertUnit){
            return true
        }
        print("지원하지 않는 단위입니다. 다시입력해주세요")
        return false
    }
    
    func matchIndex(for regex:String, in text:String) ->Int?{
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

struct RhinoUnitConverter{
    let quitLetters = ["quit","q"]
    let invalidChecker = InvalidChecker()
    var allUnits = [String]()
    
    var rawUserValue:Double = 0.0
    var rawUserUnit:String = ""
    var rawUserConvertUnit:String = ""
    
    
    mutating func start(){
        while true {
            getAllUnits()
            userInputValue()
            // 기본값으로 변경 후
            // 변환값으로 변경 하기
            
            rawInit(0.0, "", "")
        }
    }
    mutating func getAllUnits(){
        allUnits += Length.LengthUnit.allValues.map{ return $0.rawValue }
        allUnits += Weigth.WeigthUnit.allValues.map{ return $0.rawValue }
        allUnits += Volume.VolumeUnit.allValues.map{ return $0.rawValue }
    }
    
    func unitCheck(){
        
    }
    
    mutating func userInputValue(){
        print("변환할 값, 단위와 변환하고 싶은 단위가 있으면 입력해주세요 ex)180cm inch")
        while let userInput = readLine(){
            self.checkQuit(userInput)
            
            if invalidChecker.isAvailable(userInput) == false {
                continue
            }
            
            self.split(inputValue: userInput)
            
            
            if invalidChecker.isThereUnit(rawUserUnit, rawUserConvertUnit) == false{
                continue
            }
            
            // 이게 지원하는지 않하는지 체크하기
            if invalidChecker.isSupportUnit(allUnits,rawUserUnit, rawUserConvertUnit) == false {
                continue
            }
        }
    }
    
    func checkQuit(_ userInput:String){
        if quitLetters.contains(userInput) {
            exit(0)
        }
    }
    
    //흠...
    mutating func split(inputValue:String){
        
        guard let countIndex = invalidChecker.matchIndex(for: "[a-zA-Z]", in: inputValue) else {
            return
        }
        
        let countStringIndex = inputValue.index(inputValue.startIndex, offsetBy: countIndex)
        
        guard let userValue = Double(inputValue[..<countStringIndex].description) else {
            return
        }
        
        let units:String = inputValue[countStringIndex...].description
        
        var separatedUnits = units.split(separator: " ")
        
        let unit = separatedUnits[0].description
        var convertUnit:String = "cm"
        
        if separatedUnits.count == 1 {
            convertUnit = addConvertUnitWhenNoConvertUnit(unit)
        } else {
            convertUnit = separatedUnits[1].description
        }
        
        self.rawInit(userValue, unit, convertUnit)
    }
    
    mutating func rawInit(_ rawUserValue:Double, _ rawUserUnit:String, _ rawUserConvertUnit:String){
        self.rawUserValue = rawUserValue
        self.rawUserUnit = rawUserUnit
        self.rawUserConvertUnit = rawUserConvertUnit
    }
    
    func addConvertUnitWhenNoConvertUnit(_ lengtUnit:String) -> String{
        switch lengtUnit {
        case "m": return "cm"
        case "cm","yard": return "m"
        case "g": return "kg"
        case "kg","oz","lb" : return "g"
        default: return ""
        }
    }
}
var rhinoUnitConverter = RhinoUnitConverter()
rhinoUnitConverter.start()
