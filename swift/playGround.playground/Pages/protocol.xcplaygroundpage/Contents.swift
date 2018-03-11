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


