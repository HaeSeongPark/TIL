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
    var title:String
    var time:Int?
    
    var owner:Employee
//    var participant:Employee?
    
    var type:TaskType
    
    //Enumerations
    enum TaskType
    {
        case Call(number:String)
        case Report(to:Employee, when:String)
        case Meet(with:Employee, location:String)
        case Support(who:Employee, duration:Int)
        
        // computed property
        var typeTitle:String
        {
            get
            {
                let titleString:String
                switch self
                {  // self : TaskType
                case .Call:
                    titleString = "Call"
                case .Report:
                    titleString = "Report"
                case .Meet:
                    titleString = "Meet"
                case .Support :
                    titleString = "Support"
                }
                return titleString
            }
        }
    }
    
    init(type:TaskType, owner:Employee)
    {
        self.type = type
        self.title = type.typeTitle
        self.owner = owner
        self.time = nil
//        self.participant = nil
    }
    
    func doBasicTask() -> String{
        let taskDescription:String
        switch type {
        case .Call(let number):
            taskDescription = "\(owner.name) make a call to \(number)"
        case .Report(let receiver, let time):
            taskDescription = "\(owner.name) report to \(receiver.name) at \(time)"
        case .Meet(let participant, let location):
            taskDescription = "\(owner.name) meet \(participant.name) at \(location)"
        case .Support(let taskOwner, let duration):
            taskDescription = "\(owner.name) support \(taskOwner.name) for \(duration)"
        default:
             taskDescription = "Need more information for task."
        }
        return taskDescription
    }
}

//Class
class Employee
{
    var name:String?
    var phoneNumber:String?
    var boss:Employee?
    
    init(name:String)
    {
        self.name = name
    }
    convenience init(name:String, phone:String)
    {
        self.init(name:name)
        self.phoneNumber = phone
    }
    
    func report(){
        if let myBoss = boss
        {
          print("\(self.name) reported to \(myBoss.name)")
        }
        else
        {
            print("\(name) don't have boss")
        }
    }
    
    func callTaskToBoss() -> Task? {
        if let myBoss = boss, let callTo = myBoss.phoneNumber
        {
            var callTask = Task(type: .Call(number: callTo), owner: self)
            return callTask
        }
        return nil
    }
    
}

var todayTask:[Task] = []

let me:Employee = Employee(name:"Alex",phone:"010-1234-5678")
//me.name = "Alex"
//me.phoneNumber = "010-1234-5678"

let toby = Employee(name:"Toby",phone:"010-1234-5678")

me.boss = toby
me.report()

//var callTask = Task(title: "Call to Toby", time: 10*60, owner: me, participant:toby, type:.Call)
//초기화메서드 생성 후
//var callTask = Task(type: .Call, owner: me)
//callTask.time = 10 * 60

//var reportTask = Task(title: "reprot to Boos", time: nil, owner:me, participant:nil, type:Task.TaskType.Report)
var reportTask = Task(type: .Report(to:toby, when:"After noon"), owner: me)

todayTask += [reportTask]

if let callTask = me.callTaskToBoss(){
    todayTask += [callTask]
    callTask.doBasicTask()
}

reportTask.doBasicTask()







print("g")
Date(timeIntervalSince1970: 1515748870.80631)






