
// ToDo
// ✅ 입력받은 값이 모두 문자열이면 예외처리

//  ✅ RhinoUnitConverter 구조체에 함수가 많은데 매개변수나 리턴타입이 긴 편입니다.
//  혹시 내부에 인스턴스 변수를 두면 줄어들 수 있는 부분이 있을까요?

/*
 var user:Length = Length(length: 0.0, unit: .cm, convertUnit: .cm)
 var rawUserLenthUnit:String = ""
 var rawUserConvertUnit:String = ""
 var rawUserLenth:Double = 0.0
 인스턴스를 사용하요 split 리턴타입을 제거했습니다.
 */

//  ✅ getUserInputValue() 나 getMatchIndex() 처럼 특정한 값을 리턴하는 경우는 동사를 붙이기 위해서 get-을 붙이기보다,
//   그냥 그 값을 표현하는 명사형으로 표현해도 됩니다. get- set- 을 의식적으로 붙일 필요는 없어요
// 제거

//  ✅ 이미 위에서 확인 했으므로 ! 처럼 흐름상 옵셔널을 강제로 띄어낼 수 있더라도
//  if let 이나 guard let 으로 바인딩을 해서 쓰는 습관을 갖는게 좋습니다.
// 128줄 guard let 바인딩후 116줄 사용
// 나머지 하나는 개선하면서 삭제 됨

// ✅ 반복입력
// ✅ yard추가

// struct getter setter 좀 알아보기

import Foundation

/* custom chracterset */
extension CharacterSet {
    static var digitAndDot: CharacterSet {
        return CharacterSet(charactersIn: "0123456789.").union(.decimalDigits)
    }
}

enum LengthUnit:Int{
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

var Units:Dictionary<String,LengthUnit> = [
    "cm" : LengthUnit.cm,
    "m" : LengthUnit.m,
    "inch": LengthUnit.inch,
    "yard": LengthUnit.yard
]

struct Length{
    // 기본단위cm
    private var length:Double
    private var unit:LengthUnit
    private var convertUnit:LengthUnit
    
    init(length:Double, unit:LengthUnit, convertUnit:LengthUnit){
        self.length = length
        self.unit = unit
        self.convertUnit = convertUnit
    }
    
    mutating func changeToCm(){
        self.length = self.length / self.unit.ratio
    }
    
    mutating func convert(){
        print("\(self.length * self.convertUnit.ratio)\(self.convertUnit.symbol)")
    }
}



struct RhinoUnitConverter{
    
    var length:Length = Length(length: 0.0, unit: .cm, convertUnit: .cm)
    var rawUserLengthUnit:String = ""
    var rawUserConvertUnit:String = ""
    var rawUserLength:Double = 0.0
    
    mutating func start(){
        while true {
            self.userInputValue()
            length.changeToCm()
            length.convert()
        }
    }
    
    mutating func userInputValue(){
        print("변환할 값, 단위와 변환하고 싶은 단위가 있으면 입력해주세요 ex)180cm inch")
        
        var userInput:String = readLine()!
        self.checkQuit(userInput)
        while self.invalidCheck(userInput) == false {
            userInput = readLine()!
        }
        
        length = Length(length: rawUserLength, unit: Units[rawUserLengthUnit]!, convertUnit: Units[rawUserConvertUnit]!)
    }
    
    mutating func invalidCheck(_ userInput:String) -> Bool{
                                // 입력받은 값이 모두 문자열이면 예외처리
        guard userInput != "" && self.matchIndex(for: "[0-9]", in: userInput) != nil else {
            print("유효하지 않은 값입니다. 다시입력해주세요")
            return false
        }
        
        self.split(inputValue: userInput)
        
        guard Units[rawUserLengthUnit] != nil && Units[rawUserConvertUnit] != nil else {
            print("단위를 적지 않았거나 지원하지 않는 단위를 입력하셨습니다. 다시입력해주세요")
            return false
        }
        return true
    }
    
    
    func checkQuit(_ userInput:String){
        if userInput == "quit" || userInput == "q"{
            exit(0)
        }
    }
    
    //TODO: 정규식으로 더 간단히 할 수 없느지 알아보기
    mutating func split(inputValue:String){

        guard let countIndex = self.matchIndex(for: "[a-zA-Z]", in: inputValue) else {
            return
        }
        
        let countStringIndex = inputValue.index(inputValue.startIndex, offsetBy: countIndex)

        guard let lengthWithoutUnit = Double(inputValue[..<countStringIndex].description) else {
            return
        }
        
        let units:String = inputValue[countStringIndex...].description
        var separatedUnits = units.split(separator: " ")

        let lengthunit = separatedUnits[0].description
        var convertUnit:String = "cm"

        if separatedUnits.count == 1 {
            convertUnit = addConvertUnitWhenNoConvertUnit(lengthunit)
        } else {
            convertUnit = separatedUnits[1].description
        }
        self.rawUserLengthUnit = lengthunit
        self.rawUserConvertUnit = convertUnit
        self.rawUserLength = lengthWithoutUnit
    }
    
    func addConvertUnitWhenNoConvertUnit(_ lengtUnit:String) -> String{
        switch lengtUnit {
        case "cm","yard": return "m"
        default: return "cm"
        }
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

var rhinoUnitConverter = RhinoUnitConverter()
rhinoUnitConverter.start()

