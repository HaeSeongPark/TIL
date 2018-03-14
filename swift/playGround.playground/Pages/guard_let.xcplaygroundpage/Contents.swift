import Foundation

//func inValidCheck(_ inputValue:String?) -> Int{
//    guard inputValue != nil || (inputValue?.isEmpty ?? false ) else {
//        return 0
//    }
//    return Int(inputValue!) ?? 0
//}

// 위와 같이 작성했다가 JK에게 "guard let으로 개선할 수 있을까요?"라고 피드백을 들었다.
// 그리고 아래와 같이 바꿔봤다.

//func inValidCheck(_ rawInputValue:String?) -> Int {
//
//    guard let inputValue = rawInputValue else {
//        return 0
//    }
//
//    guard let realValue = Int(inputValue) else {
//        return 0
//    }
//    return realValue
//}

// 그리고 다음과 같은 피드백을 들었다.
// " guard 구문과 if 구문을 쓰는 기준은 뭘까요?
// 본인은 어떤 기준에서 작성하고 있나요? 어떤 흐름이면 guard를 쓰고 어떤 흐름이면 if를 쓰는게 좋을까 고민해보세요."

// apple 문서에 의하면
// if 보다 guard를 쓰면
// 요구사항을 처리하는 코드와 에러는 처리하는 코드가 분리 돼
// 읽기 쉽게 된다고 한다.
// 아하... (아하... 하기 까지 한 참 고민했다)
// guard는 맞는 경우와 아닌 경우(에러!)를 나눠서 처리
// if else는 이거인 경우와 저거인 경우 나눠서 처리
// 어디서 봤던 코드로 예를 들면
func fullNamed(name:String, rawPrefix:String?){
    // name은 무조건 들어온다고 치고 prefix는 옵셔널이다
    // 자 여기서 만약 guard도 prefix를 처리 한다고 하면
    // prefix가 있으면 요구사항에 맞는 거지만
    // prefix가 없으면 에러다!
    // 그러니까 난 무조건 prefix를 받아야만 하는 거다
    // 그러나까 prefix가 없으면 }다음 코드들은 처다도 안 보고 빠져나가는 거다
    // 그래서 early exit이고 그래서 코드가 깔끔해지고 읽히기 쉬워지는거다.
    guard let prefix = rawPrefix else {
        return
    }
    print(prefix+name)
    
    
    // 근데 if else를 쓰면 맞고 틀리고가 아니라
    // 이거인 경우와 저거인 경우를 나눠서 처리한다는 거다
    // 그러니까 prefix가 있어도 되고 없어도 되는 거다.
    // 코드로 표현하면
    // prefix가 있으면 prefix까지 해서 출력하고
    if let prefix = rawPrefix {
        print(prefix+name)
    } else { // 없으면 그냥 name만 출력하는 거다
        print(name)
    }
}

// 그리고 적용
// 난 Int로 캐스팅이 되는 문자가 필요 했다.
// 그러니까 nil이 아니어야하고, 비어있지 않아야 하고, Int로 캐스팅 돼야만 했다
// 그렇지 않으면 에러처리 여기서는 0을 리턴하는 걸로 대치하고 이 함수를 부르는 상위모듈에서
// 0을 받으면 다시 이 함수를 호출한 다든지 하는 처리를 추가

// 소스코드 수정 과정
//func inValidCheck(_ rawInputValue:String?) -> Int{
//    // 일단 옵셔널 바인딩
//    // guard let inputValue = rawInputValue
//    // 여기까지 치고 where절이 생각남
//    // guard let inputValue = rawInputValue where ~~~ 쓰려고 했는데 문법이 ","로 바뀜
//    guard let inputValue = rawInputValue, rawInputValue!.isEmpty == false else {
//        // nil이고 비어있으면
//        return 0
//    }
//    // 요 의미는 난 죽어도 nil이 아니고 뭔가 있는 문자열을 받아야겠다는 강력한 의지!
//
//    //nil이 아니고 비어있지 않으면 뭔가 있다는 거니까 옵셔날 바인딩 함
//    guard let wantValue = Int(inputValue) else {
//        // Int로 캐스팅 안 되면 에러처리 -> return 0
//        return 0
//    }
//    // 요 의미도 난 죽어도 Int로 캐스팅되는 문자열을 받아야겠다는 강력한 의지!

//    // 여기까지 와야 비로소 내가 원하는 값을 리턴
//    return wantValue
//}

// 위 소스를 맨 위 소스참고해서 아래처럼 간단히 표현
func inValidCheck(_ rawInputValue:String?) -> Int {
    guard let inputValue = rawInputValue, rawInputValue!.isEmpty == false else {
        return 0
    }
    return Int(inputValue) ?? 0
}
inValidCheck(nil) // nil 이 와도 0
inValidCheck("") // 빈 문자열이 와도 0
inValidCheck("sdf") // Int로 캐스팅 안 되는 문자열이 와도 0
inValidCheck("1") // 비로소 Int로 캐스팅이 되는 문자열이 오면 1
