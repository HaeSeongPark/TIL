import UIKit

var title : String = "Story board prototyping"
var ratings : [Double]? = nil
var supportURL : String! = nil

supportURL = "www.codershigh.com"
ratings = [4.5,3.0,5.0,2.5]

func ratingRecord (history:[Double]) -> (average:Double, min:Double, max:Double)
{
    var sum = 0.0, min = history[0], max = history[0]
    
    for value in history
    {
        if min > value { min = value }
        if max < value { max = value }
        sum += value
    }
    
    let average = sum / Double(history.count)
    
    return (average,min,max)
}

var bookDescription : String = "\(title)"
if let theRationgs = ratings {
    let record = ratingRecord(history: theRationgs)
    bookDescription += "has \(theRationgs.count) ratings, \r\n average is\(record.average),from \(record.min) to \(record.max)"
}
bookDescription += "\r\nsupport web page : \(supportURL)"
print("\(bookDescription)")


typealias Time = (minute:Int, second:Int)

let lunch = (16, 37)
let walk = (18, 48)

// 함수의 인자와 리턴 타입을 명시해주세요
func addTime (time1:Time, time2:Time) -> Time {
    let secondSum = time1.second + time2.second
    let second = secondSum % 60
    let minute = time1.minute + time2.minute + (secondSum / 60)
    
    // minute과 second를 이용해서 적절한 값을 리턴해주세요
   
    return (minute,second)
}

//atNoon의 값은 (35, 25) 이어야 합니다.
let atNoon = addTime(time1:lunch, time2:walk)
print(atNoon)

// structure

struct Task {
    var title:String
    var time:Int?
    
    var owner:Employee
//    var participant:Employee?
    
    var type:TaskType
    
    enum TaskType
    {
        case Call(number:String)
        case Report(to:Employee, when:String)
        case Meet(with:Employee, location:String)
        case Support(who:Employee, duration:Int)
        
        var typeTitle:String
        {
            get
            {
                let titleString:String
                switch  self
                {
                case .Call:
                    titleString = "Call"
                case .Report:
                    titleString = "Report"
                case .Meet :
                    titleString = "Meet"
                case .Support:
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
    
    func doBasicTask() -> String
    {
        let taskDescription:String
        switch type
        {
        case .Call(let number) :
            taskDescription = "\(owner.name) make a call to \(number)"
        case .Report(let receiver, let time) :
            taskDescription = "\(owner.name) report to \(receiver.name) at \(time)"
        case .Meet(let participant, let location) :
            taskDescription = "\(owner.name) meet \(participant.name) at \(location)"
        case .Support(let taskOwner, let duration ):
            taskDescription = "\(owner.name) support \(taskOwner.name) for \(duration) days"
        default:
            taskDescription = "Need more information for task."
        }
        return taskDescription
    }
}

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
    
    func report()
    {
        if let myBoss = boss
        {
            print("\(self.name) reported to \(myBoss.name)")
        }
        else
        {
            print("\(name) don't have boss")
        }
    }
    
    func callTaskToBoss () -> Task?
    {
        if let myBoss = boss, let callTo = myBoss.phoneNumber
        {
            var callTask = Task(type: .Call(number: callTo), owner: self)
            return callTask
        }
         return nil
    }
}

var todayTask:[Task] = []

let me:Employee = Employee(name:"Alex", phone:"010-1234-5678")
//me.name = "Alex"
//me.phoneNumber = "010-1234-5678"

let toby:Employee = Employee(name:"Toby", phone:"011-1234-5678")

me.boss = toby
me.report()



//var callTask = Task(title:"Call to toby", time: 10*60, owner:me, participant:toby, type:.Call)
//var callTask = Task(type: .Call, owner: me)

//var reportTask = Task(title:"report to Boss", time:nil, owner:me, participant:nil, type:Task.TaskType.Report)
var reportTask = Task(type: .Report(to:toby,when:"Afternoon"), owner: me)

todayTask += [reportTask]

if let callTask = me.callTaskToBoss()
{
    todayTask += [callTask]
    callTask.doBasicTask()
}

reportTask.doBasicTask()



indirect enum Fuel {
    case Gasoline
    case Diesel
    case LPG
    case Electic(hybrid:Fuel?)
}

let mini01Fuel = Fuel.Diesel
let mini02Fuel = Fuel.Gasoline
let sedan01Fuel = Fuel.Electic(hybrid:nil)

print("mini01은 연료로 \(mini01Fuel)을 씁니다.")
print("mini02는 연료로 \(mini02Fuel)을 씁니다.")
print("sedan01은 연료로 \(sedan01Fuel)을 씁니다.")

func addTwoInts(a:Int, b:Int) -> Int
{
    return a+b
}

func multiplyTwoInts(a:Int, b:Int) -> Int
{
    return a * b
}

var mathFunction: (Int, Int) -> Int = addTwoInts
mathFunction(2,3)

mathFunction = multiplyTwoInts
mathFunction(2,5)




























