//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

struct SomeStructure{
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 1
    }
}

enum SomeEnumeration{
    static var storeddTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 6
    }
}

class SomeClass{
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty:Int {
        return 27
    }
    class var overrideableComputedTypeProperty:Int{
        return 107
    }
}

// class가 붙은 건 뭐지
// static 붙은 변수는 상속이 안 되나?
//

class childClass:SomeClass{
    var computedTypeProperty:Int{
        return 28
    }
    
    override class var overrideableComputedTypeProperty:Int{
       return 108
    }
}

print(SomeStructure.storedTypeProperty)
SomeStructure.storedTypeProperty = "Another value."
print(SomeStructure.storedTypeProperty)
print(SomeEnumeration.computedTypeProperty)
print(SomeClass.computedTypeProperty)

childClass.storedTypeProperty
childClass.computedTypeProperty
childClass.overrideableComputedTypeProperty

struct AudioChanner{
    var abc = 5
    static let thresholdLevel = 10
    static var maxInputLevelForAllChannels = 0
    var currentLevel:Int = 0{
        didSet {
            if currentLevel > AudioChanner.thresholdLevel{
                currentLevel = AudioChanner.thresholdLevel
            }
            
            if currentLevel > AudioChanner.maxInputLevelForAllChannels {
                AudioChanner.maxInputLevelForAllChannels = currentLevel
            }
        }
    }
}
var leftChanner = AudioChanner()
var rightChannel = AudioChanner()
leftChanner.currentLevel = 7
print(leftChanner.currentLevel)
AudioChanner.maxInputLevelForAllChannels



rightChannel.currentLevel = 11
rightChannel.currentLevel
AudioChanner.maxInputLevelForAllChannels
//: [Next](@next)



