//: [Previous](@previous)

import Foundation

let anotherValue: String = "ABC"

if case "ABC" = anotherValue {
    print(anotherValue)
}

enum MainDish {
    case pasta(taste: String)
    case pizza(dough: String, topping: String)
    case chicken(withSauce: Bool)
    case rice
}

var dishes: [MainDish] = []
var dinner: MainDish = .pasta(taste: "크림")
dishes.append(dinner)

if case .pasta(let taste) = dinner {
    print("\(taste) 파스타")
}

dinner = .pizza(dough: "치즈크러스트", topping: "불고기")
dishes.append(dinner)

func whatIsThis(dish: MainDish){
    guard case .pizza(let dough, let topping) = dinner else {
        print("It's not a Pizza")
        return
    }
    print("\(dough) \(topping) 피자")
}
whatIsThis(dish:dinner)

dinner = .chicken(withSauce: true)
dishes.append(dinner)

while case .chicken(let sauced) = dinner {
    print("\(sauced ? "양념" : "후라이드") 통닭")
    break
}

dinner = .rice
dishes.append(dinner)
if case .rice = dinner {
    print("오늘 저녁은 밥입니다.")
}
print("=====")
for dish in dishes {
    switch dish {
    case .pasta(let taste): print(taste)
    case .pizza(let dough, let topping): print("\(dough, topping)")
    case .chicken(let sauced): print("\(sauced ? "양념" : "후라이드")")
    case .rice: print("Just 쌀")
    }
}
