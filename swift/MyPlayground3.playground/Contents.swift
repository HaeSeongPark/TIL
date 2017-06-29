//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
let count = str.characters.count

let distance = 69500
let kmDistance = Double(distance)/1000
let description = "판교에서 파주는 " + String(kmDistance) + "km 거리입니다."

print(description)

// tuple
// ,로 구분된 값의 리스트
// 간단하게 만들어 쓰고 읽을 수 있다
// element 번호로 접근하거나 만들 때 지정한 일므으로 접근 가능
// Typealias
// 간단한 타입 지정
// Int타입으로 시간 간격을 나타내고 싶다면, Int인 TimeInterval을 만들 수 있음?
let time1 = (9,0,48)
let time2:(h:Int, m:Int, s:Int) = (11, 51, 5)
time2.h
time2.m
time2.s
//

// 튜플 안에 튜플
let duration = (time1, time2)
let (start, end) = duration
let endHour = end.h

typealias Time = (h:Int, m:Int, s:Int)
typealias Duration = (start:Time, end:Time)
let today:Duration = ((9,0,48),(11,51,5))

print("we studied until \(today.end.h) today")
print("df")




