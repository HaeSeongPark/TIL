//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

let someValue:Any = 100
switch someValue {
    // 타입이 String인지 확인하지만 캐스팅된 값을 사용할 수 는 없습니다.
case is String: print("It's String!")
    // 타입 확인과 동시에 캐스팅까지 완료돼 value에 저장됩니다.
    // 값 바인딩 패턴과 결합된 모습
case let value as Int: print(value+1)
default: print("Int도 String도 아닙니다.")
}

//: [Next](@next)
