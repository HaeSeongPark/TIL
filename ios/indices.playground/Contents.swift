//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var a = [1,2,3,4,5]
for index in a.indices
{
    print("\(a[index])")
}

let date = Date()
let formatter = DateFormatter()
formatter.dateFormat = "hh:mm aaa"
print("\(formatter.string(from: date))")

var value = (5,3)

switch value {
case (2, _):
    print("dd")
case (3, let y):
    print("튜플의 첫 번째 값이 3일 때 두 번째 값은 \(y)입니다.")
default:
    print("default")
}

func times(x:Int, y:Int) -> Int{
    return x*y
}
times(x:5, y:10)
times(x:y:)(5,10)



protocol PoliceCodes{
    func nineOhTwo()
    
}

class Officer{
    var radio:PoliceCodes?
    func callItIn(){
        radio?.nineOhTwo()
    }
}


class Dispatcher:PoliceCodes{
    func nineOhTwo() {
        print("902 received and handled")
    }
}

var o = Officer()
var d = Dispatcher()

o.radio = d
o.callItIn()


class 강아지{
    var 품종:String
    var 짖는소리:String
    func 짖기(){
        print(짖는소리)
    }
    fileprivate init(품종:String, 짖는소리:String) {
        self.품종 = 품종
        self.짖는소리 = 짖는소리
    }
}


class 사람:강아지{
    var age:Int = 0
}

var 해성 = 사람(품종: "사람", 짖는소리: "아아아아아")
var 백구 = 강아지(품종: "진돗개", 짖는소리: "왈왈")


func 짖는다(dog:강아지){
    dog.짖기()
}

짖는다(dog: 백구)
짖는다(dog: 해성)

/**
 Concatenate two strings separaed by a space and use this for the elements of an array.
 
 - Autor:
 An Author
 
 */
func printing(){
    print("ab")
}



printing()

