import Foundation
import Combine

//let queue = OperationQueue()
//
//let subscription = queue.publisher(for: \.operationCount)
//    .sink {
//        print("Outstanding operations in queeu:\($0)")
//    }
// queue에 오퍼레이션 추가하면 증가된 operationCount가 방출
// queue가 오퍼레이션 호비하면 감소된 operationCount가 방출

struct PureSwift {
    let a:(Int,Bool)
}


class TestObject:NSObject {
    // objective-c로 표현될 수 있는 타입만 가능
    @objc dynamic var integerProperty:Int = 0
    @objc dynamic var stringProperty:String = ""
    @objc dynamic var arrayProperty:[Float] = []
//    @objc dynamic var structProperty:PureSwift = .init(a: (0, false))
    // Property cannot be marked @objc because its type cannot be represented in Objective-C
}

let obj = TestObject()
// 옵션 3가지
// .initial 기본, 초기값 방출
// .prior 이전 괎과 새로운값 방출
// .old, .new는 publisher에서 사용하지 앟는다. 아무 동작하지 않는다. 그냥 새로운 값 방출
//let subscription = obj.publisher(for: \.integerProperty)
//    .sink {
//        print("integerProperty chagnes to \($0)")
//    }
/*
 integerProperty chagnes to 0
 integerProperty chagnes to 100
 integerProperty chagnes to 200
 */

//let subscription = obj.publisher(for: \.integerProperty, options: [])
//    .sink {
//        print("integerProperty chagnes to \($0)")
//    }
/*
 integerProperty chagnes to 100
 integerProperty chagnes to 200
 */

let subscription = obj.publisher(for: \.integerProperty, options: [.prior])
    .sink {
        print("integerProperty chagnes to \($0)")
    }
/*
 integerProperty chagnes to 0
 integerProperty chagnes to 100
 integerProperty chagnes to 100
 integerProperty chagnes to 200
 */

//let sub2 = obj.publisher(for: \.stringProperty)
//    .sink {
//        print("stringProperty changes to \($0)")
//    }
//
//let sub3 = obj.publisher(for: \.arrayProperty)
//    .sink {
//        print("arrayProperty changes to \($0)")
//    }


obj.integerProperty = 100
obj.integerProperty = 200

obj.stringProperty = "Hello"
obj.arrayProperty = [1.0]
obj.stringProperty = "World"
obj.arrayProperty = [1.0, 2.0]



class MonitorObject:ObservableObject {
    @Published var someProperty = true
    @Published var someOtherProperty = ""
}

let object = MonitorObject()
let sub = object.objectWillChange.sink {
    print("object will change")
}

object.someProperty = true
object.someOtherProperty = "HW"
