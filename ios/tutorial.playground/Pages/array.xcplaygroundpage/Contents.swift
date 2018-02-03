//: [Previous](@previous)

import Foundation


var numbers = [10, 20, 30, 40, 50]
numbers.count
numbers.capacity

numbers.append(contentsOf: stride(from: 60, through: 100, by: 10))
numbers.count
numbers.capacity


var digitCounts = Array(repeating: 0, count: 10)
digitCounts.remove(at: 0)
digitCounts.capacity
digitCounts.count
digitCounts

digitCounts.append(1)
digitCounts.capacity
digitCounts.count

var arr = [Int]()
arr.capacity
arr.append(1)
arr.capacity
arr.append(1)
arr.capacity

var threeDoubles2 = Array(repeating: 0, count: 3)
//:[Next](@next)
