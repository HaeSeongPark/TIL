//: Playground - noun: a place where people can play

import UIKit

//: Session 5-1 Function Types

func addVAT(source:Double) -> Double
{
    return source * 1.1
}

func couponDiscount(source:Double) -> Double
{
    return source * 0.9
}

var additional:(Double) -> Double

let transaction032701:Double = 120.7

additional = addVAT

let price03020701 = additional(transaction032701)

func finalPrice(source:Double, additional:(Double)->Double) -> Double
{
    return additional(source)
}

let price030702 = finalPrice(source: 350.0, additional: couponDiscount)

//: Session 5-3 Closure

let addVATClosure =
{
    (source:Double) -> Double in
    return source * 1.1
}

// 매개변수와 리턴값의 타입 생략
let addVATClosure2 =
    {
        source in
        return source * 1.1
}

// return 생략
let addVATClosure3 =
    {
        source in
        source * 1.1
}

// 매개변수의 이름은 내부적으로 사용하는 것이므로 축약하고 위치로 참조 가능하므로 축약한다
// 매개변수 생략 후 "$0(매개변수 첫 번째 위치)" 추가
let addVATClosure4 = { $0 * 1.1 }

let price = addVATClosure(157.6)
let price02 = addVATClosure2(157.6)
let price03 = addVATClosure3(157.6)
let price04 = addVATClosure4(157.6)
let couponDiscountClosure =

    {
        (source:Double) -> Double in
        return source * 0.9
}

let couponDiscountClosure2 = { $0 * 0.9 }

let couponPrice = couponDiscountClosure2(200.0)

// 함수를 리턴하는 함수(Curring)
// Int형 매개변수 x를 받아서 "(Int) -> Int"함수 반환
func makeAdder (x:Int) -> (Int) -> Int
{
    func adder(a:Int) -> Int
    {
        return x + a
    }
    return adder
}

//클로저사용
func makeAdder2 (_ x:Int) -> (Int) -> Int{
    return{
        return $0 + x
    }
}

let add5 = makeAdder2(5)
let add10 = makeAdder2(10)

print(add5(2))
print(add10(2))
print(makeAdder2(5)(2))


// Session 5-6 map
// 고차함수, 함수를 매개변수로 받는 함수
// 배열의 항목에 함수를 적용하기 [a,b,c,d,e].map{f(x)} -----> [f(a),f(b),f(c),f(d),f(e)]  

let transactions = [560.0, 321.5, 190.0, 652.6, 1120.0, 450.0]

func addVAT2(source:Double) -> Double
{
    return source * 1.1
}

// 일반적인 방법
var vatPrices:[Double] = []

for transaction in transactions
{
    vatPrices += [addVAT2(source: transaction)]
}

// map사용
let vatMapPrices = transactions.map({ transaction -> Double in
    return transaction * 1.1
})

let vatMapPrices2 = transactions.map({ $0 * 1.1})
print(vatMapPrices2)

// Session 5-7 filter
// filter를 이용해서 조건문을 대신
// 컬렉션의 항목들 중 조건에 맞는 항목만 찾아내기
// [a, b, c, d, e].filter{ x>100 }를 하면 100보다 큰 항목들로 이루어진 배열 리턴

var bigTransactions:[Double] = []
for price in vatPrices
{
    if price >= 500
    {
        bigTransactions += [price]
    }
}

let bigFilterTransactions = vatPrices.filter( { $0 >= 500 } )

var meetingRooms:[String:Int] = ["Banksy":4, "Rivera":8, "Kahlo":8, "Picasso":10, "Cezanne":20, "Matisse":30]

let member = 9

let available = meetingRooms.filter({$0.value > member})
print(available)

// Session 5-8 sort
// 컬렉션의 항목들 중 조건에 맞게 순서를 바꾸기
// [a,b,c,d,e].sort{$0 > $1 }을 하면 큰 항목이 아프올 오는 정렬

func ascendantSort (sort1:Double, sort2:Double) -> Bool
{
    return sort1 > sort2
}

let sortedPrices = vatPrices.sorted(by: ascendantSort)
let sortedPrices2 = vatPrices.sorted(by: {sort1, sort2 in
    return sort1 > sort2
})

let sortedPrices3 = vatPrices.sorted(by:{$0 > $1})
print(sortedPrices3)

let sortedPrices4 = vatPrices.sorted(by:>)

let sortedMeetingRooms = meetingRooms.sorted(by: {$0.1 > $1.1})
print(sortedMeetingRooms)

// Session 5-9 reduce 하나의 값으로 수렴
// 컬렉션의 항목들을 조건에 따라 하나의 값으로 만들기
// [a, b, c, d, e].reduce(초기값, combine: +)를 하면 배열의 모든 값이 더해진 하나의 값 리턴

func priceSum(_ base:Double, _ adder:Double) -> Double
{
    return base + adder
}

var sum:Double = 0.0
for price in vatPrices
{
    sum = priceSum(sum, price)
}
print(sum)

var sum2:Double = 0.0
let sumReduce = vatPrices.reduce(sum2, priceSum)
let sumReduce2 = vatPrices.reduce(0.0, { base, adder in
    base + adder
})
print(sumReduce2)
let sumReduce3 = vatPrices.reduce(0.0, +)
                                        //base    adder
let pricesInString = vatPrices.reduce("", {$0 + "\($1)\n"})
print(pricesInString)

let descriptionString = meetingRooms.reduce("We have meeting romms : \n", { $0 + "\($1.key) for \($1.value) person \n"})
print(descriptionString)

var cu = "dsafdsfsf"
cu.endIndex
cu.characters.count
String.in
cu.remove(at: 8)







