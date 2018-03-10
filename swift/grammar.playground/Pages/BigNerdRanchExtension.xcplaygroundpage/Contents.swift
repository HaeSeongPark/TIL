// extension
// 기존 타입에 새로운 기능을 추가
// 구조체, 열거형, 클래스, 커스텀타입을 확장할 수 있다.
// 계산형프로포티, 새 이니셜라이저, 프로토콜 준수, 내장 타입
// 긱존 타입 확장하기
// typealias -> 타입에 별명 붙이기
//typealias Velocity = Double
//extension Velocity {
//    var kph: Velocity { return self * 1.60934}
//    var mph: Velocity { return self }
//}
//
//// 어 그럼 내가 지금 하고 있는 단위계산기에?
//
//typealias Length = Double
//
//extension Length {
//    var cm: Length { return self }
//    var m: Length { return self * 100 }
//}
//100.cm // 기본이 cm니까 100
//1.m //  1m 100cm 이까 100
//// 응?
//
//typealias Weigth = Double
//
//extension Weigth {
//    var g: Weigth { return self }
//    var kg: Weigth { return self * 1000 }
//}
//
//1000.g
//1.kg
//1.cm
///////////아 안되겠네 이게 Length와 Weigth를 확장해도 결국에 Double을 확장하네 좋다말았네

// 21.3 확장을 적용하고 프로토콜 준수 추가

//typealias Velocity = Double
//extension Velocity {
//    var kph:Velocity { return self * 1.60934 }
//    var mph:Velocity { return self }
//}
//
//protocol Vehicle{
//    var topSpeed: Velocity { get }
//    var mph: Velocity { get }
//    var hasFlatbed:Bool { get }
//}
//  var value:Velocity = 10
//  value.mph
//  value.kph
// 직접 만든 타입 확장하기

typealias Velocity = Double
extension Velocity {
    var kph:Velocity { return self * 1.60934 }
    var mph:Velocity { return self }
}

protocol Vehicle{
    var topSpeed: Velocity { get }
    var numberOfDoors: Int { get }
    var hasFlatbed:Bool { get }
}

struct Car {
    let make:String
    let model:String
    let year:Int
    let color:String
    let nickname:String
    var gasLevel:Double {
        willSet{
            // precondition()을 사용하면 gasLevel 프로퍼티에 대입된 enwValue가 0과 1사이에 오도록 담보한다.
            precondition(newValue <= 1.0 && newValue >= 0.0, "New value must be between 0 and 1")
        }
    }
}

// 21.5
// 확장은 서로 관련된 기능을 한데 묶을 수 있는 뛰어난 구조를 제공한다. 서로 관련된 기능을 하나의 확장으로 묶으면
// 코드의 가독성이 높아지고 유지보수도 수월해진다. 또한, 이 패턴은 그 인터페이스를 정돈하는 데도 도움이 된다.
// Vehicle 프로토콜을 준수하도록 Car 타입을 확장해 보자.
extension Car: Vehicle{
    var topSpeed:Velocity { return 180 }
    var numberOfDoors:Int { return 4 }
    var hasFlatbed:Bool { return false }
}

// 코드 21.6
// 확장이 적용된 이니셜라이저 추가하기
extension Car {
    init(make:String, model:String, year:Int){
        self.init(make: make, model: model, year: year, color: "Black", nickname: "N/A", gasLevel: 1.0)
    }
}

// 코드 21.7 Car의 인스턴스
var car = Car(make: "Ford", model: "Fustion", year: 2013)

// 21.8 중첩 타입으로 확장 만들기
extension Car {
    enum Kind {
        case coupe, sedan
    }
    var kind:Kind{
        if numberOfDoors == 2{
            return .coupe
        } else {
            return .sedan
        }
    }
}
car.kind

// 21.10 확장을 사용하여 함수 추가하기
extension Car {
    mutating func emptyGas(by amount:Double){
        precondition(amount <= 1 && amount > 0 , "Amount to remove must be between and 1.")
        gasLevel -= amount
    }
    
    mutating func fillGas(){
        gasLevel = 1.0
    }
}


// 21.11 기름 상요하기오 ㅏ채우기

car.emptyGas(by: 0.3)
car.gasLevel
car.fillGas()
car.gasLevel
