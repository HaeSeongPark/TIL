
import Foundation
//hello(to: "해성")
// 궁금한점 알려주시면 그 것에 대한 것만 집중적으로
/*
 수업과 연관 된 것 설명 후 각자 주석달게 하기
 View와 ViewController
 Userdefault swfit세계 밖에 저장 된다.
 캐스팅(as? as!)??
 
 함수 잘 못 설명한 것, 하고 실제 코드에서 사용되는 것 보여주기
 */



/**
   누군가에게 인사하다
 
*/
func greet(to name:String){
    print("hello \(name)")
}

greet(to: "박해성")

func greet2(_ name:String){
    print("hello2 \(name)")
}
// to = "박해성"이 아니라 to:"박해성"
greet2("박해성")










/*
    영역 설명
    같은 영역에 같은 이름은 있을 수 없다.
    영역을 구분해서는 지을 수 있다
 */

var a = 1
//var a = 2

func hello(_ firstName:String, _ lastName:String){
    let a = 2
    print(a)
    print("hello \(firstName)\(lastName)")
}
hello("해성", "박")

//: [ifelse👉](@next)
