public protocol EnumCollection: Hashable {
    static func cases() -> AnySequence<Self>
    static var allValues: [Self] { get }
}

public extension EnumCollection {
    
    public static func cases() -> AnySequence<Self> {
        return AnySequence { () -> AnyIterator<Self> in
            var raw = 0
            return AnyIterator {
                let current: Self = withUnsafePointer(to: &raw) { $0.withMemoryRebound(to: self, capacity: 1) { $0.pointee } }
                guard current.hashValue == raw else {
                    return nil
                }
                raw += 1
                return current
            }
        }
    }
    
    public static var allValues: [Self] {
        return Array(self.cases())
    }
}

enum Weekdays: String, EnumCollection {
    case sunday, monday, tuesday, wednesday, thursday, friday, saturday
}

for weekday in Weekdays.cases() {
    if "sunday" == weekday.rawValue as String!{
        print("true")
    }
    print(weekday.rawValue)
}
var adfsd = Weekdays.allValues.description
print(adfsd)
var sdf = [String]()
Weekdays.allValues.map({ sdf.append($0.rawValue) })
sdf
print(Weekdays.allValues.map { $0.rawValue })
