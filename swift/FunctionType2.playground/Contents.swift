//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

func addVAT(source:Double) -> Double {
    return source * 1.1
}

func couponDiscount(source:Double) -> Double{
    return source * 0.9
}

var additional:(Double) -> Double

let transaction032701 = 120.7
additional = addVAT

let price032701 = additional(transaction032701)

func finalPrice(source:Double, additional:(Double)->Double) -> Double
{
    return additional(source)
}

let price032702 = finalPrice(source:350.0, additional: couponDiscount)

// Closure 소개
let addVATClosure = { (source:Double) -> Double in
    return source * 1.1
}

let couponDiscountClosure = { (source:Double) -> Double in
    return source * 0.9
}

// Closure 축약1 타입 제거
let addVATClosure2 = { source  in
    return source * 1.1
}

let couponDiscountClosure2 = { source in
    return source * 0.9
}

// Closure 축약2 리턴 제거

let addVATClosure3 = { source  in
    source * 1.1
}

let couponDiscountClosure3 = { source in
    source * 0.9
}

//Closure 축약3 매개변수명 제거 위치로 대체 $0은 첫 번째 매개변수를 의미
let addVATClosure4 = { $0 * 1.1 }
let couponDiscountClosure4 = { $0 * 0.9 }

let price032703 = addVATClosure4(157.6)
let priceCoupon = couponDiscountClosure4(10)

// curring
func makeAdder (_ x:Int) -> (Int) ->Int{
    func adder(_ a:Int) -> Int{
        return x + a
    }
    return adder
}

func makeAdder2 (_ x:Int) -> (Int) ->Int{
    let adder:(Int) -> Int = {
        return $0 + x
    }
    return adder
}

func makeAdder3 (_ x:Int) -> (Int) ->Int{
    return{
        return $0 + x
    }
}

let add5 = makeAdder3(5)
let add10 = makeAdder3(10)

print(add5(2))
print(add10(2))
print(makeAdder3(5)(2))

// Session 5-6 map
let transactions = [560.0, 321.5, 190.0, 672.9, 1190.0, 123.0]

func addVATMap(source:Double) -> Double {
    return source * 1.1
}

var vatPrices : [Double] = []
for transaction in transactions{
    vatPrices += [addVATMap(source: transaction)]
}

let vatMapPrices = transactions.map({ tran -> Double in
    return tran * 1.1
})

let vatMapPrices2 = transactions.map({ $0*1.1 })


// filter
let bigFilterTransactions = vatPrices.filter({$0 >= 500})

var roomCapacity:[String:Int] = ["Bansky":4, "Rivera":8, "Kahlo":8, "Picasso":10, "Cezanne":20, "Matisse":30]
print(roomCapacity) // Dictionary
print(roomCapacity["Bansky"]!)
let member = 9

let available = roomCapacity.filter({$0.value > member})
print(available) // tuple
print("\(available[1])")

// sort함수
func ascendanSort(sort1:Double, sort2:Double) -> Bool{
    return sort1 > sort2
}

let sortedPrices = vatPrices.sorted(by:ascendanSort)
let sortedPrices2 = vatPrices.sorted(by:{sort1, sort2 in
    return sort1 > sort2
})

let sortedPrices3 = vatPrices.sorted(by:{$0 > $1})
print("\(sortedPrices3)")

let sortedPrices4 = vatPrices.sorted(by:>)

let sortedMeetingRooms = roomCapacity.sorted(by: {$0.value > $1.value})
print("\(sortedMeetingRooms)")

// reduce 함수
let sumReduce3 = vatPrices.reduce(0, +)
                                        //$0, 첫 번째 매개변수는 기본 값, $1부터 실제 매개변수
let pricesInString = vatPrices.reduce("", {$0 + "\($1)\n"})

let descriptionString = roomCapacity.reduce("We have meeting rooms : \n", { $0 + "\($1.key) for \($1.value) person\n"})
