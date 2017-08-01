//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

struct Money {
    var currencyRate : Double = 1100 {
        willSet {
            print("환율이 \(currencyRate) 에서 \(newValue)으로 변경될 예정")
        }
        didSet{
            print("환율이 \(oldValue) 에서 \(currencyRate)으로 변경 됐습니다")
        }
    }
}

var moneyInMyPocket = Money()

moneyInMyPocket.currencyRate = 1150