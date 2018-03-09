
// TODO
/*
 무게와 부피가 추가됐는데, Unit 이나 Units 에는 들어갔는데 객체는 Length 뿐이네요. 무게랑 부피는 객체가 없나요?
 
 Unit 에 길이, 무게, 부피가 다 들어있는데 다 합쳐서 표현하는게 좋을까요? 아니면 의미 단위로 분리하는게 좋을까요?
 어떻게 생각하세요?
 
 RhinoUnitConverter 객체가 조금 복잡해 보입니다.
 입력하고 검사하는 객체와 변환을 담당하는 객체, 그리고 결과를 출력하는 객체로... 분리해봅시다.
 start() 함수는 어디에 포함되야 할까요?

 
 */

//TODO: struct getter setter 좀 알아보기

import Foundation

/* custom chracterset */
extension CharacterSet {
    static var digitAndDot: CharacterSet {
        return CharacterSet(charactersIn: "0123456789.").union(.decimalDigits)
    }
}

CharacterSet.punctuationCharacters

enum Unit:Int{
    case cm, m, inch, yard, g, kg, oz, lb
    
    
    var ratio:Double{
        get{
            switch self {
            case .cm: return 1.0
            case .m: return 0.01
            case .inch: return 0.3937
            case .yard: return 0.0109
            case .g: return 1.0
            case .kg: return 0.001
            case .lb : return 0.0022
            case .oz : return 0.03527
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
            case .g: return "g"
            case .kg: return "kg"
            case .lb: return "lb"
            case .oz: return "oz"
            }
        }
    }
}

var Units:Dictionary<String,Unit> = [
    "cm" : Unit.cm,
    "m" : Unit.m,
    "inch": Unit.inch,
    "yard": Unit.yard,
    "g": Unit.g,
    "kg": Unit.kg,
    "lb": Unit.lb,
    "oz": Unit.oz
]


struct Length{
    // 기본단위cm
    private var value:Double
    private var unit:Unit
    private var convertUnit:Unit
    
    init(length:Double, unit:Unit, convertUnit:Unit){
        self.value = length
        self.unit = unit
        self.convertUnit = convertUnit
    }
    
    mutating func changeToCm(){
        self.value = self.value / self.unit.ratio
    }
    
    mutating func convert(){
        print("\(self.value * self.convertUnit.ratio)\(self.convertUnit.symbol)")
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
            self.rawInit()
            
        }
    }
    
    mutating func rawInit(){
        self.rawUserLengthUnit = ""
        self.rawUserConvertUnit = ""
        self.rawUserLength = 0.0
    }
    
    mutating func userInputValue(){
        print("변환할 값, 단위와 변환하고 싶은 단위가 있으면 입력해주세요 ex)180cm inch")
        
        while let userInput = readLine() {
            self.checkQuit(userInput)
            if self.invalidCheck(userInput) == false {
                continue
            } else {
                break
            }
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
        case "m": return "cm"
        case "cm","yard": return "m"
        case "g": return "kg"
        case "kg","oz","lb" : return "g"
        default: return ""
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


