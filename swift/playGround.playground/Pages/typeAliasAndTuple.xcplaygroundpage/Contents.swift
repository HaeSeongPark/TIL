import Foundation

typealias age = Int

var myAge:age = 19

let http404Error:(Int,String) = (404, "Not Found")

let (statusCode, statusMessage) = http404Error
print("The status code is \(statusCode)")
// Prints "The status code is 404"
print("The status message is \(statusMessage)")
// Prints "The status message is Not Found"

// 값이 필요없으면 _ 와일드 카드를 쓰면 됩니다.
let (justTheStatusCode, _) = http404Error
print("The status code is \(justTheStatusCode)")
// Prints "The status code is 404"

// index 번호로 가져올 수 있다.
//(1,2,3,4,5,...)
print("The status code is \(http404Error.0)")
// Prints "The status code is 404"
print("The status message is \(http404Error.1)")
// Prints "The status message is Not Found"

// 혹은 이름을 줄 수도 있다.
let http200Status = (statusCode: 200, description: "OK")
print("The status code is \(http200Status.statusCode)")
// Prints "The status code is 200"
print("The status message is \(http200Status.description)")
// Prints "The status message is OK

//tuple은 함수의 멀티 리턴값으로 쓸 때 유용하다
func minMax(array: [Int]) -> (min: Int, max: Int) {
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

var person1:(name:String, age:Int, height:Double)
var person2:(name:String, age:Int, height:Double)
var person3:(name:String, age:Int, height:Double)

typealias person = (name:String, age:Int, height:Double)

var person4:person
var person5:person
var person6:person
