////
////  main.swift
////  test
////
////  Created by rhino Q on 2018. 3. 8..
////  Copyright © 2018년 rhino Q. All rights reserved.
////
////
//// ✅변한가능 단위 출력 추가
////
//// ✅
//// 1.83m -> cm inch yard로
//// 1.83cm inch,yard -> inch, yard로
//// convertUnit:UnitRationAndSymbol 을 convertUnits:[UnitRatioAndSymbol]로 바꿈.

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
    func convert(_ basicValue:Double, to convertUnits:[UnitRatioAndSymbol]) -> String
}

extension Unit{
    func changeToBasicValue(_ value:Double, _ unit:UnitRatioAndSymbol) -> Double{
        return value / unit.ratio
    }
    func convert(_ basicValue: Double, to convertUnits:[UnitRatioAndSymbol]) -> String {
        var result = ""
        
        for convertUnit in convertUnits{
            result += "\(basicValue * convertUnit.ratio)\(convertUnit.symbol)   "
        }
        
        return result
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
            case .hop: return "hop"
            case .doe: return "doe"
            case .mal: return "mal"
            case .L: return "L"
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
    
    func isThereUnit(_ rawUserUnit:String) -> Bool {
        if rawUserUnit == "" {
            print("단위를 입력하지 않았습니다.")
        }
        return true
    }
    
    func isSupportUnit(_ allUnits:[String],_ rawUserUnit:String, _ rawUserConvertUnits:[String]) -> Bool{
        
        var result = true
        
        for rawUserConvertUnit in rawUserConvertUnits {
            if allUnits.contains(rawUserConvertUnit) == false {
                result = false
                break
            }
        }
        
        result =  result && allUnits.contains(rawUserUnit)
        
        if result == false {
            print("지원하지 않는 단위입니다. 다시입력해주세요")
            return false
        }
        return true
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
    var rawUserConvertUnits = [String]()
    
    
    mutating func start(){
        getAllUnits()
        while true {
            userInputValue()
            printResult()
            rawInit(0.0, "", [""])
        }
    }
    mutating func getAllUnits(){
        print("지원가능한 단위")
        print("Length : ", terminator:"")
        allUnits += Length.LengthUnit.allValues.map{
            print("\($0.rawValue)", terminator:" ");
            return $0.rawValue
        }
        print()
        
        print("Weigth : ", terminator:"")
        allUnits += Weigth.WeigthUnit.allValues.map{
            print("\($0.rawValue)", terminator:" ");
            return $0.rawValue
        }
        print()
        
        print("Volume: ", terminator:"")
        allUnits += Volume.VolumeUnit.allValues.map{
            print("\($0.rawValue)", terminator:" ");
            return $0.rawValue
        }
        print()
    }
    
    func printResult(){
        var basicValue = 0.0
        var convertValue = ""
        
        if let unit = Length.LengthUnit(rawValue: rawUserUnit){
            var convertUnits = [UnitRatioAndSymbol]()
            for rawUserConvertUnit in rawUserConvertUnits{
                
                if let convertUnit = Length.LengthUnit(rawValue: rawUserConvertUnit){
                    convertUnits.append(convertUnit)
                }
            }
            basicValue = Length().changeToBasicValue(rawUserValue, unit)
            convertValue = Length().convert(basicValue, to: convertUnits)
        }
        
        if let unit = Weigth.WeigthUnit(rawValue: rawUserUnit){
            var convertUnits = [UnitRatioAndSymbol]()
            for rawUserConvertUnit in rawUserConvertUnits{
                
                if let convertUnit = Weigth.WeigthUnit(rawValue: rawUserConvertUnit){
                    convertUnits.append(convertUnit)
                }
            }
            basicValue = Weigth().changeToBasicValue(rawUserValue, unit)
            convertValue = Weigth().convert(basicValue, to: convertUnits)
        }
        
        if let unit = Volume.VolumeUnit(rawValue: rawUserUnit){
            var convertUnits = [UnitRatioAndSymbol]()
            for rawUserConvertUnit in rawUserConvertUnits{
                
                if let convertUnit = Volume.VolumeUnit(rawValue: rawUserConvertUnit){
                    convertUnits.append(convertUnit)
                }
            }
            basicValue = Volume().changeToBasicValue(rawUserValue, unit)
            convertValue = Volume().convert(basicValue, to: convertUnits)
        }
        
        
        print(convertValue)
        return
        
    }
    
    mutating func userInputValue(){
        print("변환할 값, 단위와 변환하고 싶은 단위가 있으면 입력해주세요 ex)180cm inch")
        print("종료는 quit 또는 q입니다.")
        while let userInput = readLine(){
            self.checkQuit(userInput)
            
            if invalidChecker.isAvailable(userInput) == false {
                continue
            }
            
            self.split(inputValue: userInput)
            
            
            if invalidChecker.isThereUnit(rawUserUnit) == false{
                continue
            }
            
            // 이게 지원하는지 않하는지 체크하기
            if invalidChecker.isSupportUnit(allUnits,rawUserUnit, rawUserConvertUnits) == false {
                continue
            }
            
            break
        }
    }
    
    func checkQuit(_ userInput:String){
        if quitLetters.contains(userInput) {
            exit(0)
        }
    }
    
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
        var convertUnits = [String]()
        
        if separatedUnits.count == 1 {
            convertUnits = addConvertUnitWhenNoConvertUnit(unit)
        } else {
            convertUnits = separatedUnits[1].split(separator: ",").map{ String($0) }
        }
        
        self.rawInit(userValue, unit, convertUnits)
    }
    
    mutating func rawInit(_ rawUserValue:Double, _ rawUserUnit:String, _ rawUserConvertUnits:[String]){
        self.rawUserValue = rawUserValue
        self.rawUserUnit = rawUserUnit
        self.rawUserConvertUnits = rawUserConvertUnits
    }
    
    func addConvertUnitWhenNoConvertUnit(_ lengtUnit:String) -> [String]{
        switch lengtUnit {
        case "cm", "m", "inch", "yard" : return ["cm","m","inch","yard"]
        case "g", "kg", "oz", "lb" : return ["g","kg","oz","lb"]
        case "hop","doe", "mal", "L" : return ["hop","doe","mal","L"]
        default: return [""]
        }
    }
}
var rhinoUnitConverter = RhinoUnitConverter()
rhinoUnitConverter.start()

