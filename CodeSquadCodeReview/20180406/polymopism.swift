import Foundation

protocol polymopismable{
    func printSelf()
}
//
extension Double: polymopismable {
    func printSelf(){
        print("Double입니다.")
    }
}
//
extension Int: polymopismable {
    func printSelf(){
        print("Int입니다.")
    }

}
//
extension String: polymopismable {
    func printSelf(){
        print("strring입니다.")
    }

}
//
//func polymopism<T:polymopismable>(_ value : T ) {
//    value.printSelf()
//}


func polymopism(_ value : Any ) {
    if value is Double {
        print("double입니다.")
    } else if value is Int {
        print("Int입니다,")
    } else if value is String {
        print("String 입니다.")
    }
}
//polymopism(1.9)
func poly<T>(value :T){
    print("\(type(of: value))입니다.")
}
poly(value: "dsf")
