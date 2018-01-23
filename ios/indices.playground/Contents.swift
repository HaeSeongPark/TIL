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
