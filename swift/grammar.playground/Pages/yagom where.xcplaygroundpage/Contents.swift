//import Foundation
//
///*
// 스위프트의 where 절은 특정 패턴과 결합하여 조건을 추가하는 역할을 합니다.
// 조건을 더 추가하고 싶을 때, 특정 타입에 제한을 두고 싶을 때 등등 다양한 용도로 사용
//
// 패턴과 결합하여 조건 추가
// 타입에 대한 제약 추가
//
// */
//
//let tuples: [(Int,Int)] = [(1,2), (1,-2), (1,0), (0,2)]
//
//// 값 바인딩, 와일드카드 패턴
//
//for tuple in tuples {
//    switch tuple {
//    case let(x,y) where x == y: print("x==y")
//    case let(x,y) where x == -y: print("x== -y")
//    case let(x,y) where x > y: print("x > y")
//    case (1, _): print("x == 1")
//    case (_,2): print("y==2")
//    default: print("\(tuple.0), \(tuple.1)")
//    }
//}
//
//var repeatCount: Int = 0
//
//for tuple in tuples {
//    switch tuple {
//    case let (x,y) where x==y && repeatCount > 2: print("x==y")
//    case let (x,y) where repeatCount < 2: print("\(x), \(y)")
//    default: print("Nothing")
//    }
//    repeatCount += 1
//}
//
//let firstValue:Int = 50
//let secondValue:Int = 30
//
//switch firstValue + secondValue {
//case let total where total > 100: print("total > 100")
//case let total where total < 0: print("wrong value")
//case let total where total == 0: print("zero")
//case let total: print(total)
//}
//
//
//// 옵셔널 패턴과 where 절의 활용
//let arrayOfOptionalInts: [Int?] = [nil, 2, 3, nil, 5]
//for case let number? in arrayOfOptionalInts where number > 2 {
//    print("Found a1 \(number)")
//}
//
//for case let number? in arrayOfOptionalInts{
//    print("Found a3 \(number)")
//}
//
//for case let number in arrayOfOptionalInts{
//    print("Found a2 \(number)")
//}
//
//// where 절을 타입캐스팅 패턴과 결합할 수 있습니다.
//let anyValue: Any = "ABC"
//switch anyValue {
//case let value where value is Int: print("value is String")
//case let value where value is String: print("valud is String")
//case let value where value is Double: print("value is String")
//default: print("Unknown type")
//} // value is String
//
//var things:[Any] = [Any]()
//
//things.append(0)
//things.append(0.0)
//things.append(42)
//things.append(3.14159)
//things.append("hello")
//things.append((3.0,5.0))
//
//things.append({(name:String) -> String in "Hello, \(name)"})
//
//for thing in things{
//    switch thing {
//    case 0 as Int:
//        print("zero as an Int")
//    case 0 as Double:
//        print("zero as a Double")
//    case let someInt as Int:
//        print("an integer value of \(someInt)")
//    case let someDouble as Double where someDouble > 0 :
//        print("a positive double value of \(someDouble)")
//    case is Double:
//        print("some other double value that I don't want to print")
//    case let someString as String:
//        print("a string avlue of \"\(someString)\"")
//    case let (x, y) as (Double, Double):
//        print("an (x,y) point at \(x), \(y)")
//    case let stringConverter as (String) -> String:
//        print(stringConverter("Michael"))
//    default:
//        print("someting else")
//    }
//}
//

// 표현 패턴과 where 절의 활용
var point: (Int, Int) = (1,2)

switch point {
case (0,0): print("원점")
case (-2...2, -2...2) where point.0 != 1 :
    print("\(point.0)")
    print("\(point.1)은 원점과 가깝습니다.")
default: print("point \(point.0), \(point.1)")
}

// where 절을 활용한 프로토콜 익스텐션의 프로토콜 준수 제약 추가
protocol SelfPrintable {
    func printSelf()
}

struct Person: SelfPrintable {}
extension Int: SelfPrintable {}
extension UInt: SelfPrintable {}
extension String: SelfPrintable {}
extension Double: SelfPrintable {}

extension SelfPrintable where Self: BinaryInteger, Self:Comparable{
    func printSelf() {
        print("BinaryInteger와 Comparable을 준수하면서 SelffPrintable을 준수하는 타입 \(type(of: self))")
    }
}


extension SelfPrintable where Self: CustomStringConvertible {
    func printSelf() {
        print("CustomStringConvertile을 준수하면서 SelfPrintable을 준수하는 타입 \(type(of: self))")
    }
}

extension SelfPrintable{
    func printSelf(){
        print("그 외 SelfPrintable을 준수하는 타입 \(type(of: self))")
    }
}

//BinaryInteger와 Comparable을 준수하면서 SelfPrintable을 준수하는 Int 타입
Int(-8).printSelf()

// BinaryInteger와 Comparable을 준수하면서 SelfPrintable을 준수하는 UInt 타입
UInt(8).printSelf()

// CustomeStringConvertible을 준수하면서 SelfPrintable을 준수하는 String 타입
String("yagom").printSelf()

// 그외 SelfPrintable을 준수하는 타입 Double
Double(8.0).printSelf()

// 그 외 SelfPrintable을 준수하는 타입 Person()
Person().printSelf()


// where 절을 활용한 타입 매개변수와 연관 타입의 타입 제약 추가
// 타입 매개변수 T가 BinaryInteger 프로토콜을 준수하는 타입
//func Doubled<T>(integerValue:T) -> T where T:BinaryInteger{
//    return integerValue * 2
//}
func doubled<T:BinaryInteger>(integerValue: T) -> T {
    return integerValue * 2
}

// 타입 매개변수 T와 U가 CustomStringConvertible 프로토콜을 준수하는 타입
func prints<T, U>(first: T, second: U) where T:CustomStringConvertible, U:CustomStringConvertible{
    print(first)
    print(second)
}

func Prints<T: CustomStringConvertible, U:CustomStringConvertible>(first:T, second: U){
    print(first)
    print(second)
}

// 타입 매개변수 S1과 S2가 Sequence 프로토콜을 준수하며
// S1과 S2가 준수하는 프로토콜인 Sequence 프로토콜의 연관 타입인 SubSequence가 같은 타입
func compareTwoSequences<S1, S2>(a: S1, b: S2) where S1 : Sequence, S1.SubSequence: Equatable, S2.SubSequence: Equatable{
    
}

func CompareTowSequences<S1, S2>(a: S1, b:s2) where S1 : Sequence, S1.SubSequence:Equatable, S1.SubSequence == S2.SubSequence {
    
}

func COmpareTowSequences<S1: Sequence, S2:Sequence>(a: S1, b:S2) where S1.SubSequence: Equatable, S1.SubSequence == S2.Iterator.Element{
    
}

// 프로토콜의 연관 타입에도 타입 제약을 줄 수 있습니다.
protocol Container {
    associatedtype ItemType where ItemType == BinaryInteger
    var count: Int { get }
    mutating func append(_ item: ItemType)
    subscript(i: Int) -> ItemType { get }
}

protocol COntainer where ItemType == BinaryInteger{
    associatedtype ItemType
    var count: Int { get }
    mutating func append(_ item: ItemType)
    subscript(i:Int) -> ItemType { get }
}
