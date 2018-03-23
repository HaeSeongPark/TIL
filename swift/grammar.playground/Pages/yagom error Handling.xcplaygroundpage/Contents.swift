import Foundation

// enum & Error (protocol)
// Error empty protocol

enum VendingMachineError:Error{
    case invalidSelection
    case insufficientFunds(coninsNeeded: Int)
    case outOfStock
}

// 오류 포착 및 처리
// 1.함수에서 발생한 오류를 해당 함수를 호출한 코드에 알리는 방법
// 2.do - catch 구문을 이용하여 오류를 처리하는 방법
// 3.옵셔날 값으로 오류를 처리하는 방법
// 4.오류가 발생하지 않을 것이라고 확신하는 방법

// 1.함수에서 발생한 오류를 해당 함수를 호출한 코드에 알리는 방법

/*
 throws는 함수나 메서드의 자체 타입에도 영향을 미칩니다.
 즉, throws를 포함한 함수, 메서드, 이니셜라이저는 일반 함수, 메서드와 구분됩니다.
 또, throws를 포함한 함수, 메서드, 이니셜라이저는 일반 함수, 메서드, 이니셜라이저로 재정의 할 수 없다.
 반대로 일반 함수, 메서드, 이니셜라이저는 throws함수, 메서드, 이니셜라이저로 재정의 가능
 */

struct Item {
    var price: Int
    var count: Int
}

class VendingMachine {
    var inventory = [
        "Candy Bar": Item(price:12, count:7),
        "Chips" : Item(price:10, count:4),
        "Biscuit": Item(price:7, count:11)
    ]
    
    var coinsDeposited = 0
    
    func dispense(snack:String){
        print("\(snack)제공")
    }
    
    func vend(itemNamed name : String) throws {
        guard let item = self.inventory[name] else {
            throw VendingMachineError.invalidSelection
        }
        
        guard item.count > 0 else {
            throw VendingMachineError.outOfStock
        }
        
        guard item.price <= self.coinsDeposited else {
            throw VendingMachineError.insufficientFunds(coninsNeeded:item.price - self.coinsDeposited)
        }
        
        self.coinsDeposited -= item.price
        
        var newItem = item
        
        newItem.count -= 1
        self.inventory[name] = newItem
        
        self.dispense(snack:name)
    }
}

let favoriteSnacks = [
    "yagom": "Chips",
    "jinsung": "Biscuit",
    "heejin": "Chocolate"
]

func buyFavoriteSnack(person:String, vendingMachine:VendingMachine) {
    let snackName = favoriteSnacks[person] ?? "Candy Bar"
    tryingVend(itemNamed:snackName, vendingMachine:vendingMachine)
}

struct PurchasedSnack {
    let name: String
    init(name: String, vendingMachine: VendingMachine) {
        tryingVend(itemNamed:name, vendingMachine:vendingMachine)
        self.name = name
    }
}

// 2.do - catch 구문을 이용하여 오류를 처리하는 방법


func tryingVend(itemNamed:String, vendingMachine:VendingMachine){
    do{
        try vendingMachine.vend(itemNamed: itemNamed)
    } catch VendingMachineError.invalidSelection{
        print("유효하지 않은 선택")
    } catch VendingMachineError.outOfStock{
        print("품절")
    } catch VendingMachineError.insufficientFunds(let coninsNeeded){
        print("자금 부족 - 동전 \(coninsNeeded)개를 추가로 지급해주세요.")
    } catch {
        print("그 외 오류 발생 : ", error)
    }
}


let machine: VendingMachine = VendingMachine()
machine.coinsDeposited = 30

var purchase: PurchasedSnack = try PurchasedSnack(name: "Biscuit", vendingMachine:machine)
// Biscuit 제공

print(purchase.name) // Biscuit

purchase = PurchasedSnack(name: "Ice Cream", vendingMachine:machine)

print(purchase.name)

for (person, favoriteSnack) in favoriteSnacks {
    print(person, favoriteSnack)
    try buyFavoriteSnack(person: person, vendingMachine:machine)
}

// do - catch 구문을 이용하여 오류처리
/*
 do{
    try 오류 발생 가능 코드
    오류가 발생하지 않으면 실행할 코드
 } catch 오류 패턴 1 {
    처리 코드
 } catch 오류 패턴 2 where 추가 조건 {
    처리 코드
 }
 */

// 옵셔널 값으로 오류처리


// 3.옵셔날 값으로 오류를 처리하는 방법
// try?

//func someThrowingFunction(shouldThrowError:Bool) throws -> Int {
//    if shouldThrowError {
//        enum someError: Error {
//            case justSOmeError
//        }
//        throw someError.justSOmeError
//    }
//    return 100
//}
//
//let x: Optional = try? someThrowingFunction(shouldThrowError:true)
//print(x)
//let y: Optional = try? someThrowingFunction(shouldThrowError:false)
//print(y)

// 옵셔널 값으로 오류를 처리하는 방법과 기존 옵셔널 반환 타입과의 결합
// fetchData() 함수는 반환 타입을 옵셔널로 정의했습니다.
// 즉, 함수 내부에서 제대로 처리가 이뤄지지 않으면 반환 값이 nil이 될 수 있음을 내포하는 것
// 예를 들어 데이터를 디스크에서 가져오지 못하면 서버에서 가져오는 것을 시도해보고 그조차 없으면 nil을
// 반환해주도록 응용해볼 수 있습니다.
//func fetchData() -> Data? {
//    if let data = try? fetchDataFromDisk() {
//        return data
//    }
//
//    if let data = try? fetchDataFromServer(){
//        return data
//    }
//
//    return nil
//}


// 오류가 발생하지 않을 것이라고 확신하는 방법
//let a:Int = try! someThrowingFunction(shouldThrowError:false)
//let b:Int = try! someThrowingFunction(shouldThrowError:true) // 런타임 오류!!


// 다시던지기
// 함수나 메서드는 rethrows 키워드를 사용하여 자신의 매개변수로 전달받은 함수가 오류를 던진다는 것을 나타낼 수 있다.
// rethrows 키워드를 사용하여 다시던지기(rethrowing)가 가능하게 하려면 최소 하나 이상의 오류 발생 가능한 함수를
// 매개변수로 전달받아야 합니다.

// 예제
// 오류를 던지는 함수
func someThrowingFunction() throws {
    enum someError: Error {
        case justSOmeError
    }
    throw someError.justSOmeError
}

// 다시 던지기 함수
func someFunction(callback: () throws -> Void ) rethrows {
    try callback()  // 다시 던지기 함수는 오류를 다시 던질 뿐 따로 처리하지는 않습니다.
}

do {
    try someFunction(callback: someThrowingFunction)
} catch {
    print(error)
}
/*
 다시던지기 함수 또는 메서드는 기본적으로 스스로 오류를 던지지 못합니다.
 즉, 자신 내부에 직접적으로 throw 구문을 사용할 수 없습니다.
 그러나 catch 절 내부에서는 throw구문을 작성할 수 있습니다.
 다시던지기 함수나 메서드가 오류를 던지는 함수를 do-catch 구문 내부에서 호출하고 catch 절
 내부에서 다른 오류를 던짐으로써 오류를 던지는 함수에서 발생한 오류를 제어할 수 있습니다.
 다시던지기 내부의 catch절에서는 다시던지기 함수의 매개변수로 전달받은 오류 던지기 함수만 호출하고
 결과로 던져진 오류만 제어할 수 있습니다.
 */

