//: [Previous](@previous)

import Foundation


protocol polymopismable{
    func printSelf()
}

extension Double: polymopismable {
    func printSelf(){
        print("Double입니다.")
    }
}

extension Int: polymopismable {
    func printSelf(){
        print("Int입니다.")
    }

}

extension String: polymopismable {
    func printSelf(){
        print("strring입니다.")
    }

}

func polymopism(_ value : polymopismable ) {
    value.printSelf()
}

polymopism("1")

//func polymopism(_ value : Any ) {
//    if value is Double {
//        print("double입니다.")
//    } else if value is Int {
//        print("Int입니다,")
//    } else if value is String {
//        print("String 입니다.")
//    }
//}




//: [Next](@next)
