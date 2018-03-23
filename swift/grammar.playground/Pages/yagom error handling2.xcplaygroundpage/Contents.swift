//import Foundation
//
////오류를 던지는 함수
//func someThrowFunction() throws {
//    enum SomeError:Error{
//        case justSomeError
//    }
//
//    throw SomeError.justSomeError
//}
//
//// 다시 던지기 함수
//func someFunction(callback: () throws -> Void ) rethrows {
//    enum AnotherError:Error{
//        case justAnotherError
//    }
//
//    do{
//        // 매개변수로 전달한 오류 던지기 함수이므로
//        // catch 절에서 제어할 수 있습니다.
//        try callback()
//    } catch {
//        throw AnotherError.justAnotherError
//    }
//
//    do{
//        // 매개변수로 전달한 오류 던지기 함수가 아니므로
//        // catch 절에서 제어할 수 있습니다.
//        try someThrowFunction()
//    } catch {
//        // 오류 발생!
//        throw AnotherError.justAnotherError
//    }
//
//    // catch 절 외부에서 단독으로 오류를 던질 수는 없습니다. 오류 발생!
//    throw AnotherError.justAnotherError
//}
//
///*
// 부모클래스의 다시던지기 메서드(rethrows 메서드)는 자식클래스에서 던지기 메서드
// (throws 메서드)로 재정의할 수 없습니다.
// 그러나 부모클래스의 던지기 메서드는 자식클래스에서 다시던지기 메서드로 재정의할 수 있습니다.
//
// 그리고 만약 프로토콜 욕사항 중에 다시던지기 메서드가 있다면,
// 던지기 메서드를 구현한다고 해서 요구사항을 충족시킬 수는 없습니다.
// 그러나 프로토콜 요구사항 중에 던지기 메서드가 있다면 다시던지기 메서드를 구현해서 충족시킬 수 있다
//
// @objc -> 컴파일러에게 objc 로 컴파일하라고 알려준다. 런타임에도... objc로 ...
// objc기능을 ㅎㅎ swift protocol에는 옵셔널이 없다 objc에는 있다. 그래서 objc기능을 사용하려고 @objc
//
// */
//
//protocol SomeProtocol{
//    func someThrowingFunctionFromProtocol(callback: () throws -> Void ) throws
//    func someRethrowingFunctionFromProtocol(callback: () throws -> Void ) rethrows
//}
//
//class SomeClass:SomeProtocol{
//
//    func someThrowingFunction(callback: () throws -> Void ) throws {}
//    func someFunction(callback: () throws -> Void ) rethrows {}
//
//    // 던지기 메서드는 다시던지기 메서드를 요구하는 프로토콜을 충족할 수 없습니다.
//    // 오류 발생
//    func someRethrowingFunctionFromProtocol(callback: () throws -> Void) throws{
//
//    }
//
//    // 다시 던지기 메서드는 던지기 메서드를 요구하는 프로토콜의 요구사항에 부합합니다.
//    func someRethrowingFunctionFromProtocol(callback: () throws -> Void ) rethrows {
//
//    }
//}
//
//class SomeChildClass:SomeClass{
//    // 부모 클래스의 던지기 메서드는 자식클래스에서 다시던지기 메서드로 재정의 할 수 있습니다.
//    override func someThrowingFunction(callback: () throws -> Void) rethrows {}
//
//    // 부모클래스의 다시던지기 메서드는 자식클래스에서 던지기 메서드로 재정의할 수 없습니다.
//    // 오류 발생!
//    override func someFunction(callback: () throws -> Void ) throws {}
//}
//
///*
// SomeProtocol에서 요구한 던지기 함수 someThrowingFunctionFromProtocol(callback:)과
// 던지기 함수 someRethrowingFunctionFromProtocol(callback:)을
// 각각 다시던지기 함수와 던지기 함수로 구현해봤습다.
// 던지기 메서드는 다시던지기 메서드 요구에 부합하지만 다시던지기 메서드는 던지기 메서드 요구에 부합하지 못함을 확인할 수 있습니다.
// 또, 부모클래스의 던지기 메서드는 자식클래스에서 다시던지기 메서드로 재정의할 수 있는 반면,
// 부모클래스의 다시던지기 메서드는 자식클래스의 던지기 메서드로 재정의할 수 없음을 확인할 수 있습니다.
// */

