//: Playground - noun: a place where people can play

import UIKit

var title : String = "bookName"
var ratings : [Double]? = nil
var supportURL : String? = nil

supportURL = "www.www.www"
// Force Unwrapping : !
// 값의 존재를 확신 할 때만 사용
// Crash Opperator라는 오명
ratings = [4.5, 3.0, 5.0, 2.5]
var bookDescription:String = "\(title)"


// function
func ratingRecord(_ history:[Double]) -> (average:Double, min:Double, max:Double)
{
    var sum = 0.0, min = history[0], max = history[0]
    
    for value in history
    {
        if min > value { min = value }
        if max < value { max = value }
        sum += value
    }
    
    let average = sum / Double(history.count)
    return (average, min, max)
}

if let theRatings = ratings
{
    let record = ratingRecord(theRatings)
    bookDescription += "has \(theRatings.count) ratings, \r\n average \(record.average), from \(record.min) to \(record.max))"
}

// Optional binding : if let, it var
if let theURL = supportURL
{
    bookDescription += "\r\nsupprot web page : \(theURL)"
}

// Implicitly Unwrapped Optional : 선언시 ! 사용


// structure
// 함수형에서 역할이 커지고 있다.

struct Task
{
    var title:String?
    var time:Int?
}


var callTask = Task(title: "Call to Randy", time: 10*60)


