// 프로토콜 확장
protocol Exercise:CustomStringConvertible{
    var name:String {get}
    var caloriesBurned:Double{get}
    var minutes:Double{get}
}
extension Exercise{
    var caloriesBurnedPerMinute:Double{
        return caloriesBurned / minutes
    }
}

extension Exercise{
    var description:String{
        return "Exercise(\(name), burned \(caloriesBurned)calories in \(minutes) minutes"
    }
}

struct EllipticalWorkOut :Exercise{
    let name = "Elliptical workout"
    let caloriesBurned:Double
    let minutes:Double
}

struct TreadmilWorkout:Exercise{
    let name = "Treadmill Workout"
    let caloriesBurned:Double
    let minutes:Double
    let laps:Double
}

let ellipticalWorkout = EllipticalWorkOut(caloriesBurned:335, minutes:30)
let runningWorkout = TreadmilWorkout(caloriesBurned:350, minutes:25, laps:10.5)


ellipticalWorkout.caloriesBurnedPerMinute

extension Sequence where Iterator.Element == Exercise {
    func totalCaloriesBurned() -> Double{
        var total: Double = 0
        for exercise in self {
            total += exercise.caloriesBurned
        }
        return total
    }
}

let mondayWorkout:[Exercise] = [ellipticalWorkout, runningWorkout]
print(mondayWorkout.totalCaloriesBurned())
ellipticalWorkout
runningWorkout
