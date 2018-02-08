//: [Previous](@previous)

/*
 ------------------
 클래스를 이용해서 함수(정의&호출), 변수, 옵셔널, 등을 설명하는 게 좋을 것 같다.
 다만 클래스에 대한 자세한 설명은 다음에....
*/
/*:
 ## Class
 
 
 class 이름 {
 
prameters: 변수(속성)
 
//init:초기화
 
function:함수(행위)
 
 }
 */

class 사람{
    var 이름:String = "박해성"
    let 고향:String = "서울"
    var 운전면허증:Bool?
    
    func sayHello(){
        print("Hello there!")
    }
    
    func 먹는다(food:String){
        print("\(self.이름)이 \(food)를 먹는다.")
    }
    
    func 운동한다() -> Int {
        return 100 // kcal
    }
    
    func 세금을낸다(income:Double) -> Double {
        let tax:Double = income * 0.154 // 15.4%
        return tax
        
    }
}

var 사람1 = 사람()
사람1.sayHello()
사람1.먹는다(food: "햄버거")
print("사람1이 운동해서 소모한 kcal : \(사람1.운동한다())")
print("사람1이 세금 \(사람1.세금을낸다(income: 154))원 낸다.")
//: [Next](@next)
