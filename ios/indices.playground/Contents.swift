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

