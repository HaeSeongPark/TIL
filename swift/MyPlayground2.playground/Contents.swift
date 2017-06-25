//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

var str = "Hello, playground"
print("\(str)")

let frame = CGRect(x: 0, y: 0, width: 150, height: 150)

let customView = UIView(frame: frame)
customView.backgroundColor = UIColor.blue

//XCPlaygroundPage.currentPage.liveView = customView
PlaygroundPage.current.liveView = customView

// : var(변수)와 let(상수)
let maxSpeed = 200
//let maxSpeed:Int = 200
// maxSpeed += 10

var currentSpeed =  110
currentSpeed += 10
Int(20.5)
currentSpeed += Int(20.5)
//currentSpeed += 20.5

let intMax = Int.max
let UintMax = UInt.max
let intMin = Int.min
let UintMin = UInt.min

let pi = 3.14
let divider = 2
let halfPi = 3.14/Double(divider)

// : String과 Numbers
let name:String = "Seongkwan"
var greeting = "Hello"
greeting += " " + name

// 문자열의 문자를 하나하나
let charecters = name.characters
let count = charecters.count

let url = "www.codershigh.com"
let hasProtocol = url.hasPrefix("http://")

// 문자열 결합이나 문자열 안에 숫자를 넣을 경우 \() 사용
print("\(name)")

// : Tuple : (,) , 모든 타입이 가능함
var time1 = (9,0,48)
time1.0
let time2 : (h:Int, m:Int, s:Int) = (11, 51, 5)
time2.h
time2.m
time2.s

// 튜플은 참조가 아닌 복사
var time3 = time1
time1.0 = 8
time1 // 8 0 48
time3 // 9 0 48

// tuple in tuple
let duration = (time1, time2)

let (start, end) = duration
let endHour = end.h

// typealias
typealias Time = (h:Int, m:Int, s:Int)
typealias Duration = (start:Time, end:Time)

let today:Duration = ((9,10,23),(17,8,21))
print("We studied until \(today.end.h) today")

//Array, 하나의 타입만 가능
var meetingRooms:Array<String> = ["Bansky", "Rivera", "Kahlo", "Picasso", "Cezanne", "Matisse"]
// 축약
var groups:[Int] = [10, 8, 14, 9]

meetingRooms += ["Renoir"]

//추가1
var speedHistory:[Int] = []
speedHistory += [currentSpeed]

//추가2
let gpsSpeed0901 = 114.1
speedHistory.append(Int(gpsSpeed0901))

// 값에 접근
speedHistory[0]
speedHistory.first

// Array는 참조가 아닌 복사된다.
let historyBackup = speedHistory
// 하나가 변하는 순간이 복사되는 순간
speedHistory += [150]

historyBackup

// Dictionary  값에 이름표를 붙여 저정하는 상자, 순서 없다
var roomCapacity:[String:Int] = ["Bansky":4, "Rivera":8, "Kahlo":8, "Picasso":10, "Cezanne":20, "Matisse":30]
//roomCapacitiy += ["Renoir":40]
roomCapacity["Renoir"] = 40
roomCapacity
roomCapacity["Kahlo"]

//let roomNames = roomCapacity.keys
//let capacityes = roomCapacity.values

let roomNames = [String](roomCapacity.keys)
let capacityes = [Int](roomCapacity.values)

let total = capacityes.reduce(0, +)

// Set : 순서를 가지고 있지 않다., 집합연산
// intersection : 교집합
// subtracting : 차집합
// Union : 합집합
// ExclusiveOR : 합집합 - 교집합

let subway2 : Set = ["시청", "을지로입구"]
let subway3 : Set = ["지축","구파발","연신내","시청"]

let transfer = subway2.intersection(subway3)
let notTransfer = subway2.subtracting(subway3)
let union = subway2.union(subway3)
let exOR = subway2.symmetricDifference(subway3)

// Collections 연습문제1
var heros = ["프린스", "마녀", "해골 군대", "고블린 통"]
let newHero = "흑룡"

//heros에 newHero를 추가해보세요
heros.insert(newHero,at:0)

print(heros)

// Collections 연습문제2

let heros1:Set = ["프린스", "마녀", "해골 군대", "고블린 통"]
let oppHeros:Set = ["자이언트 해골", "고블린 통", "대형석궁", "프린스"]

let intersectHeros = heros1.intersection(oppHeros)
print(intersectHeros)

// control flow
if transfer.count > 0
{
    print("환승역은 \(transfer) 입니다.")
}
else
{
    print("환승역은 없습니다.")
}

for station in subway2
{
    print("이번역은 \(station)입니다.")
}

for (roomName, capacity) in roomCapacity {
    let roomDescription:String
    switch capacity {
    case 4:
        roomDescription = "\(roomName)은 스터디 룸이면 정원은 \(capacity)명입니다."
    case 5...10:
        roomDescription = "\(roomName)은 스터디 룸이면 정원은 \(capacity)명입니다."
    case 11...30:
        roomDescription = "\(roomName)은 스터디 룸이면 정원은 \(capacity)명입니다."
    case _ where capacity > 30:
        roomDescription = "\(roomName)은 스터디 룸이면 정원은 \(capacity)명이며 별도의 상요신청이 필요"
    default:
        "\(roomName)의 정보를 다시 확인해 주세요"
    }
}

typealias ShopingItem = (name:String, amount:Int)
let cart = ShopingItem("beer", 1)

switch cart {
case ("beer", 0...3) : //맥주 3병 이하
    print("Guide to small item counter")
case ("beer", 51...100) : //맥주 51병이상 100병 까지
    print("Call manager")
case ("beer", _) where cart.amount>100 : //맥주 100병 초과
    print("Call police")
default: //나머지(맥주 4병 이상 50병 이하)
    print("Make wait in line")
}


