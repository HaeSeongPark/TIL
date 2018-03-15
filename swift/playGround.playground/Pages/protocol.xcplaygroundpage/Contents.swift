//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)


protocol 프로토콜이름 {
    // 요구사항 구현
}


//class 클래스이름 : 상위클래스이름, 프로토콜1, 프로토콜2{
//    // 요구사항 구현
//}

protocol Talkable {
    var topic: String { get set }
}

struct Person: Talkable {
    var topic: String
}

//var person:Person = Person(topic: "programming")
//person.topic
//person.topic = "abc"
//person.topic


var sdf:String


struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    var volume: Double {
        return width * height * depth
    }
}
let fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
print("the volume of fourByFiveByTwo is \(fourByFiveByTwo.volume)")
// Prints "the volume of fourByFiveByTwo is 40.0"


protocol SomeClassOnlyProtocol: AnyObject, Talkable {
    // class-only protocol definition goes here
}


//class abc:SomeClassOnlyProtocol{
//    var topic: String = ""
//}
//
//struct asfd:SomeClassOnlyProtocol{
//    var topic: String
//}

protocol sdfsd {
    var a:Int { get }
}

protocol testProtocol {
    // strored property로 하든 computed property 하든
    // get과 set만 되면 된다
    var mustBeSettableAngGetterable:Int { get set }
    
    // strored property로 하든 computed property 하든
    // get만 되면 된다. set은 되도 되고 안 되도 되고
    var doesNotNeedBeSettable:Int  { get }
}

// strored version
// 각 속성을 stored로 했습니다
// storeed는 get과 set 됩니다.
// 따라서 testProtocol을 comfort합니다.
struct storedVersion: testProtocol{
    var mustBeSettableAngGetterable: Int
    var doesNotNeedBeSettable: Int
}

// computed version
// 각 속성을 computed로 했습니다
// read only computed로 선언 했습니다.
// 그랬더니 testProtocol을 따르지 않는다고 나옵니다.
// 왜냐하면 doesNotNeedBeSettable은 get만 되면 되니 문제가 없는데
// mustBesettableAndGetteable set돼야'만'합니다.
// 근데 set을 못하는 read only라서 does not conform라고 에러가 납니다.
struct computedVersion:testProtocol{
    var doesNotNeedBeSettable: Int {
        get{
            return 1
        }
//        set{
//            doesNotNeedBeSettable = 1
//        }

    }
    
    var mustBeSettableAngGetterable: Int{
        get{
            return 1
        }
        
        set(newValue){
            mustBeSettableAngGetterable = newValue
        }
    }
}
enum length {
    case cm, m, inch
}
var strte = "cm m inch"
var splitstr = strte.split(separator: " ").map{ String($0) }
for strr in splitstr{
    print(type(of: strr))
    if "cm" == strr{
        print("cm")
    }
}

// protocol 에 static 사용
//protocol AnotherProtocol {
//    static var someTypeProperty: Int { get set }
//}
//
//class clsssConform:AnotherProtocol{
//    class var someTypeProperty: Int {
//        get {
//            return 10
//        }
//        set{
//    }
//     // 타입프로퍼티는 초기화를 하거나 get set을 써야함
//}
//}

//protocol classTypePropertyP{
//    class var classTypeProperty: Int { get set }
//}
protocol AnotherProtocol {
    static var someTypeProperty: Int { get }
}

class clsssConform:AnotherProtocol{
    class var someTypeProperty: Int {
        return 10
    }
//    class 타입 프로퍼티는 인스턴스에 값이 저장되는게 아니라서 computed property 로 선언해야 합니다.
}


class SomeClass{
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty:Int {
        return 27
    }
    class var overrideableComputedTypeProperty:Int{
        return 107
    }
}

protocol FullNamed{
    var fullName:String { get }
}

class StarShip:FullNamed{
    var prefix:String?
    var name:String
    var fullName: String
    init(name:String, prefix:String? = nil, fullName:String) {
        self.name = name
        self.prefix = prefix
        self.fullName = fullName
    }
    //   return (prefix != nil ? prefix! + " " : "") + name
//    var fullName: String {
//        return (prefix != nil ? prefix! + " " : "") + name
//    }
}
// var ncc1701 = Starship(name: "Enterprise", prefix: "USS")
var ncc1701 = StarShip(name: "Enterprise", prefix: "USS", fullName:"uss enterprise")
ncc1701.fullName // USS Enterprise
//var noPreFix = StarShip(name: "noPreFix")
//noPreFix.fullName

MemoryLayout<Character>.size
MemoryLayout<String>.size // 24
MemoryLayout<Bool>.size // 1
MemoryLayout<Int>.size // 8
