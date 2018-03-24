import Foundation

// 내가 했던 에러핸들링 초급 1
// 원하는 값이 아니면 ""(string일 때) 나 0(Int)을 리턴한다.
// 굉장히 깨림직하다. ""나 0을 받아도 정상처리를 해야 하면...?

struct InputView {
    static func readInput(question:String) -> String {
        print(question)
        guard let rawInput = readLine(), !rawInput.isEmpty else {
            return ""
        }
        return rawInput
    }
}

// 내가 했던 에러핸들링 초급 2
// 원하는 값이 아니면 nil을 내보낸다.
// 초급 1보다는 좋지만
// 받는 곳에서 optional을 풀어야한다... -> 솔직히 귀찮다...
struct InputView2 {
    static func readInput(question:String) -> String? {
        print(question)
        guard let rawInput = readLine(), !rawInput.isEmpty else {
            return nil
        }
        return rawInput
    }
}

// 그러다가 만난 error Hadnling
// 에러를 내가 만든다. with enum!
// protocol Error 와 enum을 찰떡궁합
// Error : 빈 프로토콜
// 에러 핸들링 중급

// 1. enum으로 Error를 만든다.
enum InputViewTError: Error{
    case invalidValue
}

struct InputViewT {
    // 3. 에러를 발생 시킬 수 있는  함수에는 에러를 발생시킬 수 있다는 표시를 아래 춰럼 해줘야 한다. ( throws )
    // 이 함수의 리턴타입은 에러일수 도 있고 String일 수도 있다.
    static func readInput(question:String) throws -> String {
        print(question)
        guard let rawInput = readLine(), !rawInput.isEmpty else {
            // 2. 이제 nil이 아니라
            // throw를 이용해서 명확하게 유효하지 않은 값이라고 error를 발생시킨다.
            throw InputViewTError.invalidValue
        }
        return rawInput
    }
}
// 뭔가 있어보인다.😀  여기까지는 Error를 발생시키는 것이 었고 이제 핸들링
// 핸들링은 do try catch구문으로 한다.
// 보통 do {
//    try <#throwing expression#>
//} catch <#pattern#> {
//    <#statements#>
//}

do {
    //1. 에러가 발생할 수 있는 구문 앞에 try를 한다.
    let input1 = try InputViewT.readInput(question:"입력해주세요")
    // 2. 에러가 발생하지 않으면 아래 문장에 있는 코드들이 실행된다.
    // code code code code code
} catch InputViewTError.invalidValue{
    // 3. InputInputView3Error.invalidValue 라는 에러가 발생하면 아래 문장 실행
    print("유요하지 않은 값을 입력하셨습니다.")
}

// 간단히 try? try!를 쓸 수 도 있다.
let inputS = try? InputViewT.readInput(question:"입력해주세요")
// 에러가 나지 않으면 정상적으로 값이 들어가지만
// 에러가 나면 input 은 nil이 된다.

//let inputT = try! InputViewT.readInput(question:"입력해주세요")
// 에러가 나지 않으면 정상적으로 값이 들어가지만
// 에러가 나면 프로그램이 죽는다.
// 에러가 안날거라는 확실이 있을 때 사용할 것
// 옵셔널을 강제 언래핑할 때랑 똑같음. 조심조심


// 에러를 몇 개 더 만들어 보자.

enum InputViewFError: Error{
    case invalidValue
    case notSupport
    case notConvertToInt
}

struct InputViewF {
    static func readInput(question:String) throws -> String {
        print(question)
        guard let rawInput = readLine(), !rawInput.isEmpty else {
            throw InputViewFError.invalidValue
        }
        return rawInput
    }
}

do {
    let inputF = try InputViewF.readInput(question:"입력해주세요")
} catch InputViewFError.invalidValue{
    print("유요하지 않은 값을 입력하셨습니다.")
} catch InputViewFError.notSupport {
    print("지원하지 않는 값입니다.")
} catch InputViewFError.notConvertToInt{
    print("숫자를 입력해주세요")
} catch {
    print("알 수 없는 에러입니다.")
}


// 에러 확장 보다 명확하게 그리고 간단하게 단지 String일 경우에...
//catch let error / errorDescription / extension 으로 깔끔하게 명확하게
enum InputViewErrorExtension: Error{
    case invalidValue
    case notSupport
    case notConvertToInt
}

extension InputViewErrorExtension:LocalizedError{
    public var errorDescription:String? {
        switch self {
        case .invalidValue:
            return "유효하지 않은 값입니다. extention"
        case .notSupport:
            return "지원하지 않은 값"
        case .notConvertToInt:
            return "숫자를 입력해주세요"
        }
    }
}


struct InputViewFExtension {
    static func readInput(question:String) throws -> String {
        print(question)
        guard let rawInput = readLine(), !rawInput.isEmpty else {
            throw InputViewErrorExtension.invalidValue
        }
        return rawInput
    }
}

do {
    let inputF = try InputViewFExtension.readInput(question:"입력해주세요")
} catch let error {
    print("\(error.localizedDescription)")
}

// 사실 위 예제는 나라별 언어로 표현하기 위해 사용 되는 듯 합니다.
// 아래 애플 샘플 소스 처럼
// 지금은 필요없어서 자세히 보지는 않았습니다. 나중에 필요할 때 자세히...
//public enum CalculatorError: Error {
//    case invalidCharater
//    case multipleCharacters
//    case nilInput
//}
//
//extension CalculatorError: LocalizedError {
//    public var errorDescription: String? {
//        switch self {
//        case .invalidCharater: return NSLocalizedString("Invalid character exception.", comment: "The input is not a number between 0-9, an operator (+, -, *, /), D, C, =, or a period.")
//        case .multipleCharacters: return NSLocalizedString("Multiple characters exception.", comment: "The input contains more than one character.")
//        case .nilInput: return NSLocalizedString("Nil exception.", comment: "The input is nil.")
//        }
//    }
//}


// 고급v1
// Including More Data in Errors with Enum's associatedValue

//enum VendingMachineError: Error {
//    case invalidSelection
//    case insufficientFunds(coinsNeeded: Int)
//    case outOfStock
//}
//
//throw VendingMachineError.insufficientFunds(coinsNeeded: 5)
//
//
//var vendingMachine = VendingMachine()
//vendingMachine.coinsDeposited = 8
//do {
//    try buyFavoriteSnack(person: "Alice", vendingMachine: vendingMachine)
//    print("Success! Yum.")
//} catch VendingMachineError.invalidSelection {
//    print("Invalid Selection.")
//} catch VendingMachineError.outOfStock {
//    print("Out of Stock.")
//} catch VendingMachineError.insufficientFunds(let coinsNeeded) {
//    print("Insufficient funds. Please insert an additional \(coinsNeeded) coins.")
//} catch {
//    print("Unexpected error: \(error).")
//}

// 고급2 구조체로 한다.
// 우리가 흔히 본는 엑스코드 에러 형태랑 흡사하다.
// 나중에 해고 싶다!
//struct XMLParsingError: Error {
//    enum ErrorKind {
//        case invalidCharacter
//        case mismatchedTag
//        case internalError
//    }
//
//    let line: Int
//    let column: Int
//    let kind: ErrorKind
//}
//
//func parse(_ source: String) throws -> XMLDoc {
//    // ...
//    throw XMLParsingError(line: 19, column: 5, kind: .mismatchedTag)
//    // ...
//}
//
//do {
//    let xmlDoc = try parse(myXMLData)
//} catch let e as XMLParsingError {
//    print("Parsing error: \(e.kind) [\(e.line):\(e.column)]")
//} catch {
//    print("Other error: \(error)")
//}
// Prints "Parsing error: mismatchedTag [19:5]"


// 더 알아 볼 것
// Error는 빈 프로콜이긴 한데
// Extenion이 있다. 뭔지 모르겠다. 왜 있는지도 모르겠다... 어떻게 쓰는지도...
/*
 public protocol Error {
 }
 
 extension Error {
 }
 
 extension Error where Self.RawValue : SignedInteger {
 }
 
 extension Error where Self.RawValue : UnsignedInteger {
 }
 */


// 함수 메서드 이니셜라이저에도 사용가능한데 아직 기회가...
// rethrow, defer
// 오버라이딩? 재정의? 할때 의 제약사항
// rethrow의 제약사항
// 프로토콜 정의할 때도 사용하는데... 아직 기회가...
// 에러 문자열 지역화
