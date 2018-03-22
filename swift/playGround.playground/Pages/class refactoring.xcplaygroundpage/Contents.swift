import Foundation
///////////// Account Class
//class Account{
//    var balance:Double = 0.0   // pulbic variable 캡술화 원칙에 어긋남
//}
//
//func deposit() -> Double {
//    let myAccount = Account()
//    myAccount.balance += 5000  // 객체 외부에서 데이터를 변경
//    myAccount.balance += 2000  // 요구사항 변경에 취약함
//    return myAccount.balance
//}
//
//func withdraw() -> Double {
//    let myAccount = Account()
//    myAccount.balance += 5000
//    myAccount.balance -= 2000
//
//    return myAccount.balance
//}
//////////////////
////////////////// 리팩터링 1
//class Account{
//    var balance:Double = 0.0
//    private var deposits : [Double] = []
//    private var withdraws: [Double] = []
//
//    func deposit(amount:Double){
//        deposits.append(amount)
//        balance += amount
//    }
//
//    func withdraw(amount:Double){
//        withdraws.append(amount)
//        balance -= amount
//    }
//}
//
//func deposit() -> Double {
//    let myAccount = Account()
//    myAccount.deposit(amount:3000)
//    myAccount.deposit(amount:2000)
//    return myAccount.balance
//}
//
//func withdraw() -> Double {
//    let myAccount = Account()
//    myAccount.balance += 5000
//    myAccount.balance -= 2000
//
//    return myAccount.balance
//}
//
///////////리팩토링 2
//class Account{
//    private var balance:Double = 0.0
//    private var deposits : [Double] = []
//    private var withdraws: [Double] = []
//
//    func deposit(amount:Double){
//        deposits.append(amount)
//        balance += amount
//    }
//
//    func withdraw(amount:Double){
//        withdraws.append(amount)
//        balance -= amount
//    }
//
//    func getBalance() -> Double {
//        return balance
//    }
//}
//
//func deposit() -> Double {
//    let myAccount = Account()
//    myAccount.deposit(amount:3000)
//    myAccount.deposit(amount:2000)
//    return myAccount.balance //
//}
//
//func withdraw() -> Double {
//    let myAccount = Account()
//    myAccount.balance += 5000
//    myAccount.balance -= 2000
//
//    return myAccount.balance //
//}

//////// 리팩토링 3
class Account{
    private var balance:Double = 0.0
    private var deposits : [Double] = []
    private var withdraws: [Double] = []
    
    func deposit(amount:Double){
        deposits.append(amount)
        balance += amount
    }
    
    func withdraw(amount:Double){
        withdraws.append(amount)
        balance -= amount
    }
    
    func getBalance() -> Double {
        var result:Double = 0
        for withdrawAmount in withdraws{
            result += withdrawAmount
        }
        
        for depositAmount in deposits {
            result += depositAmount
        }
        return result // 객체 내부 속성을 return 하는 게 객체 내부 속성을 이용해서 함수 내의 지역변수를 return
    }
}

