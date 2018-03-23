import Foundation

/*
 defter 구문을 사용하여 현재 코드 블록을 나가기 전에 꼭 실행해야 하는 코드를 작성해줄 수 있습니다.
 즉, defer 구문은 코드가 블록을 어떤 식으로 빠져나가든 간에 꼭 실행해야 하는 마무리 작업을 할 수 있드록 도와줍니다.
 그 말인즉슨, 오류가 발생하여 코드 블록을 빠져나가는 것이든,
 정상적으로 코드가 블록을 빠져나가는 것이든 간에 defer 구문은 코드가 블록을 빠져 나가기 전에
 무조건 실행되는 것을 보장한다는 뜻입니다.
 
 예를 들어 함수 내에서 파일을 열어 사용하다가 오류가 발생하여 코드가 블록을 빠져나가더라도
 파일을 정상적으로 닫아 메모리에서 해제해야 하기 때문에 defter 구문 내부에는 파일을 닫는 코드를
 작성해주어 정상적으로 파일이 메모리에서 해제될 수 있도록 해야 합니다.
 
 defer 구문은 꼭 오류처리 상황에서만 사용해야 하는 것은 아니지만,
 오류처리를 할 때 유용하게 쓰이기에 오류처리 파트에서 소개합니다.
 
 defer 구문은 오류처리 상황뿐만 아니라 함수, 메서드, 반복문, 조건문 등등
 보통의 코드 블록 어디에서든 사용할 수 있습니다.
 
 */
for i in 0...2 {
    defer {
        print("A", terminator: " ")
    }
    print(i, terminator: " ")
    
    if i % 2 == 0 {
        defer {
            print("", terminator: "\n")
        }
        print("It's even", terminator: "\n")
    }
}

// 파일쓰기 예제에서 defer 구문 활용
//func writeData(){
//    let file = openFile()
//
//    // 함수 코드 블록을 빠져나가기 직전 무조건 실행돼 파일을 잊지 않고 닫아줍니다.
//    defer {
//        closeFile(file)
//    }
//
//    if ... {
//        return
//    }
//
//    if ... {
//        return
//    }
//
//    // 처리 끝
//}

/*
 만약 defer 구문이 없었다면 아래 소스처럼 중복된 코드가 많아질 것이고 차후 유지관리가
 어려울뿐더러 코드가 길어지다보면 프로그래머가 파일닫기 코드를 닫지 않는 실수르 할 가능성도
 */

//func writeData(){
//    let file = openFile()
//
//
//    if ... {
//        closeFile(file)
//        return
//    }
//
//    if ... {
//        closeFile(file)
//        return
//    }
//    closeFile(file)
//    // 처리 끝
//}

/*
 defer 구문은 현재 코드 범위를 벗어나기 전까지 실행을 미루고 defer 있다가
 프로그램 실행 흐름이 코드 범위를 벗어나기 직전 실행됩니다.
 
 defer 구문 내부에는 break, return 등과 같이 구문을 빠져나갈 수 있는 코드 또는
 오류를 던지는 코드는 작성하면 안 됩니다.
 여러 개의 defer 구문이 하나의 범위(블록) 내부에 속해 있다면 맨 마지막에 작성된 구문부터 역순으로
 
 */

func someThrowingFunction(sholudThrowError:Bool) throws -> Int {
    defer {
        print("First")
    }
    
    if sholudThrowError {
        enum SomeError: Error {
            case justSomeError
        }
        throw SomeError.justSomeError
    }
    defer {
        print("Second")
    }
    
    defer{
        print("Third")
    }
    
    return 100
}

try? someThrowingFunction(sholudThrowError: true)
// First
// 오류를 던지기 직전까지 작성된 defer 구문까지만 실행된다.

try? someThrowingFunction(sholudThrowError: false)
// Third
// Second
// First

/*
 그런데, do 구문을 catch 절과 함께 사용하지 않고 단독으로 사용할 수 있습니다.
 코드 블록 내부에 또 한 단계 하위의 블록을 만들고자 할 때입니다.
 이럴 때는 하위 블록이 종료될 때 그 내부의 defer 구문이 실행된다. 아래 소스에서
 defer 구문이 여러 개 존재할 때 어떤 순서로 실행되는지 확인
 
 */
func someFunction(){
    print("1")
    
    defer {
        print("2")
    }
    
    do {
        defer {
            print("3")
        }
        print("4")
    }
    
    defer {
        print("5")
    }
    print("6")
}

someFunction()
