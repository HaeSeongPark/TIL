
//[[String],[String],[String],...]
//[["","","",...],["","","",...],...]
/*
 [
 ["abc"], ["def"],
 ["ghi"], ["jkl"]
 ]
 */

// 19 프로토콜
// 구조체, 클래스, 열거형등에 프로토콜 추가 할 수 있음
// 프로토콜은 프로퍼티, 메서드, 서브스크립트, 이니셜라이저 등의 기능을 요구할 수 있음
//

// 19.1 테이블 만들기
//func printTable(_ data:[[String]]){
//    for row in data{
//        // 출력 문자열 시작
//        var out = "|"
//
//        // 이행의 각 항목을 문자열에 덧붙인다.
//        for item in row {
//            out += " \(item) |"
//        }
//        print(out)
//    }
//}

let data = [
    ["Joe","30","6"],
    ["Karen","40","18"],
    ["Fred","50","30"]
]

//printTable(data)

//10:56 ~
// 19.2 열에 제목 붙이기
// 19.3 열 정렬하기
//func printTable(_ data:[[String]], withColumnLabels columLabels:String...){
//    // 열 헤더가 포함된 첫 번쨰 행을 만든다
//    var firstRow = "|"
//
//    // 각 열의 너비를 판단한다
//    var columnWidths = [Int]()
//
//
//    for columnLabel in columLabels{
//        let columnHeader = " \(columnLabel) |"
//        firstRow += columnHeader
//        columnWidths.append(columnLabel.count)
//    }
//
////    print(columnWidths)
////
//    print(firstRow)
//
//    // 이 행의 각 항목을 문자열에 덧붙인다.
//    for row in data{
//        // 출력 문자열 시작
//        var out = "|"
//
//        // 이행의 각 항목을 문자열에 덧붙인다.
//        for (j, item) in row.enumerated(){   // 번째 값  0 Joe
//            let paddingNeeded = columnWidths[j] - item.count
//            // paddingNeeded에 저장된 공백들을 문자열에 붙일 때는 공백들을 컬렉션으로 만드는
//            // repeatElement(_:count:)와 이 둘을 하나의 문자열로 합치는
//            // Joined(separator:)을 사용
//            let padding = repeatElement(" ", count: paddingNeeded).joined()
//            out += " \(padding)\(item) |"
//        }
//
//        print(out)
//    }
//}
//
//printTable(data, withColumnLabels: "Employee Name", "Age", "Years of Experience")

// 19.4 모델 객체 사용하기
// printTable(_:withColumnLabels:)는 열의 제목과 데이터 배열을 분리하고
// 열 제목의 개수가 데이터 배열의 요소 개수가 일치하는지 확인해야 한다.
// 모델 객체로 만들기

//struct Person{
//    let name: String
//    let age:Int
//    let yearsOfExperience:Int
//}
//
//struct Department{
//    let name: String
//    var people = [Person]()
//
//    init(name:String) {
//        self.name = name
//    }
//
//    mutating func add(_ person:Person){
//        people.append(person)
//    }
//}


// 그대로 진행해도 무방할 듯한데 하면서 바로 프로토콜이 유용하다는데...? 왜지?

// 19.5 프로토콜 정의하기
/* printTable(_:withColumnLabels:) 함수에 필요한 인터페이스를 지정하는 프로토콜을 정의해 보자.
 이 함수는 행과 열이 몇 개 인지 알아야 하고
 열의 제목 각 셀에 어떤 데이터를 출력해야 하는지 알아야 한다.
 이 프로토콜은 printTable 앞에만 오면 된다.
*/

// 드디어 프로토콜 쓰네
// 계산 프로퍼티나 함수 정의 모두 생략된다.
// 읽기 쓰기용 { get set }
//protocol TabularDataSource {
//    var numberOfRows: Int { get }
//    var numberOfColumns: Int { get }
//
//    func label(forColumn column:Int) -> String
//    func itemFor(row: Int, column: Int) -> String
//}


// 19.6 Department가 TabularDataSource를 준수하도록 선언하기
// 19.7 프로퍼티와 메서드 추가하기

struct Person{
    let name: String
    let age:Int
    let yearsOfExperience:Int
}

//struct Department:TabularDataSource{
//    let name: String
//    var people = [Person]()
//
//    init(name:String) {
//        self.name = name
//    }
//
//    mutating func add(_ person:Person){
//        people.append(person)
//    }
//
//    var numberOfRows: Int {
//        return people.count
//    }
//
//    var numberOfColumns: Int {
//        return 3
//    }
//
//    func label(forColumn column: Int) -> String {
//        switch column {
//        case 0: return "Employee Name"
//        case 1: return "Age"
//        case 2: return "Years Of Experience"
//        default: fatalError("Invalid column!")
//        }
//    }
//
//    // 에러 처리를 이렇게도 할 수 있구나...
//
//    func itemFor(row: Int, column: Int) -> String {
//        let person = people[row]
//        switch column {
//        case 0: return person.name
//        case 1: return String(person.age)
//        case 2: return String(person.yearsOfExperience)
//        default: fatalError("Invalid column!")
//        }
//    }
//}

// 19.8 printTable(_:)에서 TabulardataSource 인스턴스를 받도록 변경하기

//func printTable(_ dataSource: TabularDataSource){
//    // 열 헤더가 포함된 첫 번쨰 행을 만든다
//    var firstRow = "|"
//
//    // 각 열의 너비를 판단한다
//    var columnWidths = [Int]()
//
//
//    for i in 0..<dataSource.numberOfColumns{
//        let columnLabel = dataSource.label(forColumn: i)
//        let columnHeader = " \(columnLabel) |"
//        firstRow += columnHeader
//        columnWidths.append(columnLabel.count)
//    }
//
//    print(firstRow)
//
//    // 이 행의 각 항목을 문자열에 덧붙인다.
//    for i in 0..<dataSource.numberOfRows{
//        // 출력 문자열 시작
//        var out = "|"
//
//        // 이행의 각 항목을 문자열에 덧붙인다.
//        for j in 0..<dataSource.numberOfColumns{
//            let item = dataSource.itemFor(row: i, column: j)
//            let paddingNeeded = columnWidths[j] - item.count
//            let padding = repeatElement(" ", count: paddingNeeded).joined()
//            out += " \(padding)\(item) |"
//        }
//
//        print(out)
//    }
//}

// 19.9 Department 출력하기
//printTable(department)

// 우와 어떻게 이렇게 짤 수 있지?


// 프로토콜 준수
// 타입은 모두 프로토콜을 준수할 수 있다.
// enum도 된다. 오호?

// 19.10 CustomStringConvertible준수하기
// 타입이 여러개 프로토콜을 따를 수 있다.

//protocol TabularDataSource {
//    var numberOfRows: Int { get }
//    var numberOfColumns: Int { get }
//
//    func label(forColumn column:Int) -> String
//    func itemFor(row: Int, column: Int) -> String
//}
//
//struct Department:TabularDataSource, CustomStringConvertible{
//    let name: String
//    var people = [Person]()
//
//    var description: String {
//        return "Department (\(name))"
//    }
//
//    init(name:String) {
//        self.name = name
//    }
//
//    mutating func add(_ person:Person){
//        people.append(person)
//    }
//
//    var numberOfRows: Int {
//        return people.count
//    }
//
//    var numberOfColumns: Int {
//        return 3
//    }
//
//    func label(forColumn column: Int) -> String {
//        switch column {
//        case 0: return "Employee Name"
//        case 1: return "Age"
//        case 2: return "Years Of Experience"
//        default: fatalError("Invalid column!")
//        }
//    }
//
//    // 에러 처리를 이렇게도 할 수 있구나...
//
//    func itemFor(row: Int, column: Int) -> String {
//        let person = people[row]
//        switch column {
//        case 0: return person.name
//        case 1: return String(person.age)
//        case 2: return String(person.yearsOfExperience)
//        default: fatalError("Invalid column!")
//        }
//    }
//}

//var department = Department(name: "Engineering")
//department.add(Person(name: "joe", age: 30, yearsOfExperience: 6))
//department.add(Person(name: "Karen", age: 40, yearsOfExperience: 18))
//department.add(Person(name: "Fred", age: 50, yearsOfExperience: 20))

// 19.11 부서의 이름 출력하기
//print(department)


// 프로토콜 상속


//protocol TabularDataSource: CustomStringConvertible {
//    var numberOfRows: Int { get }
//    var numberOfColumns: Int { get }
//
//    func label(forColumn column:Int) -> String
//    func itemFor(row: Int, column: Int) -> String
//}
//
//struct Department:TabularDataSource{
//    let name: String
//    var people = [Person]()
//
//    var description: String {
//        return "Department (\(name))"
//    }
//
//    init(name:String) {
//        self.name = name
//    }
//
//    mutating func add(_ person:Person){
//        people.append(person)
//    }
//
//    var numberOfRows: Int {
//        return people.count
//    }
//
//    var numberOfColumns: Int {
//        return 3
//    }
//
//    func label(forColumn column: Int) -> String {
//        switch column {
//        case 0: return "Employee Name"
//        case 1: return "Age"
//        case 2: return "Years Of Experience"
//        default: fatalError("Invalid column!")
//        }
//    }
//
//    func itemFor(row: Int, column: Int) -> String {
//        let person = people[row]
//        switch column {
//        case 0: return person.name
//        case 1: return String(person.age)
//        case 2: return String(person.yearsOfExperience)
//        default: fatalError("Invalid column!")
//        }
//    }
//}
//
//func printTable(_ dataSource: TabularDataSource){
//    print("Table: \(dataSource.description)")
//    // 열 헤더가 포함된 첫 번쨰 행을 만든다
//    var firstRow = "|"
//
//    // 각 열의 너비를 판단한다
//    var columnWidths = [Int]()
//
//
//    for i in 0..<dataSource.numberOfColumns{
//        let columnLabel = dataSource.label(forColumn: i)
//        let columnHeader = " \(columnLabel) |"
//        firstRow += columnHeader
//        columnWidths.append(columnLabel.count)
//    }
//
//    print(firstRow)
//
//    // 이 행의 각 항목을 문자열에 덧붙인다.
//    for i in 0..<dataSource.numberOfRows{
//        // 출력 문자열 시작
//        var out = "|"
//
//        // 이행의 각 항목을 문자열에 덧붙인다.
//        for j in 0..<dataSource.numberOfColumns{
//            let item = dataSource.itemFor(row: i, column: j)
//            let paddingNeeded = columnWidths[j] - item.count
//            let padding = repeatElement(" ", count: paddingNeeded).joined()
//            out += " \(padding)\(item) |"
//        }
//
//        print(out)
//    }
//}
//
//var department = Department(name: "Engineering")
//department.add(Person(name: "joe", age: 30, yearsOfExperience: 6))
//department.add(Person(name: "Karen", age: 40, yearsOfExperience: 18))
//department.add(Person(name: "Fred", age: 50, yearsOfExperience: 20))
//
//printTable(department)

// 다중상속
// protocol MyProtocol: MyOtherProtocol, CustomStringConvertible
// 쉼표로 구분


//프로토콜 구성
/*
    프로토콜 상속은 기존 프로토콜(들)에 일정 요건이 더해진 새 프로토콜을 쉽게 만들 수 있는
    강력한 도구라 할 수 있다. 하지만 프로토콜 상속을 적용하면 타입을 만들 때 잘못된 선택을 할
    가능성이 농후해진다. 사실 데이터 소스의 설명을 출력하기 위햏 TabularDataSource에서
    CustomStringConvertible을 상속받도록 했을 떄도 같은 상황이었다.
 테이블 형식의 데이터 소스와는 CustomStringConvertible이 아무런 관계가 없다.
 */

// 코드 19.14
/*
 이제 printTable(_:)에 전달된 데이터 소스의 description을 가져오려고 하면
 컴파일러는 제대로 투덜된다.
 프로토콜 구성을 적용ㅎ아면 문자열로 변환되어야 한다는 관련도 없는
 요건으로 TabularDataSource를 더럽히지 않고 문제를 해결할 수 있다.
 하나의 타입이 여러 프로토콜을 준수해야 한다고 분명하게 밝히는 방법이 프로토콜 구성인 셈이다.
 */



protocol TabularDataSource{
    var numberOfRows: Int { get }
    var numberOfColumns: Int { get }
    
    func label(forColumn column:Int) -> String
    func itemFor(row: Int, column: Int) -> String
}

protocol PrintableTabularDataSource: TabularDataSource, CustomStringConvertible{
    
}
/* PrintableTabularDataSource는 분명한 타입이라는 점이 다르다.
 이 타입을 사용하려면 이미 모든 요건을 이행한다고 해도 Department를 수정하여
 PrintableTabularDataSource를 준수한다고 명시애햐 한다.
 
 그러나 TabularDataSource & CustomStringConvertible은
 새 타입을 만드는 것이 아니다.
 printTable(_:)의 인수가 프로토콜들을 준수한다고 알릴 뿐
 따라서 다시 돌아가 Deparment를 처리 할 필요가 없다.
 
 PrintableTabularDataSource -> 이 프로토콜을 준수하는 객체에 직접적인 변경이 필수
 TabularDataSource & CustomStringConvertible -> 이 프로토콜을 준수하는 객체에 직접적인 변경이 필요없음
 
 그래서 이게 뭔 효과가 있는 거지
 TabularDataSource & CustomStringConvertible 를 해도 printTable(_:)에 인자로 늘려면
 DepartMent를 수정해야 되잖아
 그냥 printTable(_:)이 PrintableTabularDataSource 라고 쓰면 되는 거 아닌가?
 왜 번거롭게 &를 써야되지 이름도 긴데...
 */

struct Department:PrintableTabularDataSource{
    let name: String
    var people = [Person]()
    
    var description: String {
        return "Department (\(name))"
    }
    
    init(name:String) {
        self.name = name
    }
    
    mutating func add(_ person:Person){
        people.append(person)
    }
    
    var numberOfRows: Int {
        return people.count
    }
    
    var numberOfColumns: Int {
        return 3
    }
    
    func label(forColumn column: Int) -> String {
        switch column {
        case 0: return "Employee Name"
        case 1: return "Age"
        case 2: return "Years Of Experience"
        default: fatalError("Invalid column!")
        }
    }
    
    func itemFor(row: Int, column: Int) -> String {
        let person = people[row]
        switch column {
        case 0: return person.name
        case 1: return String(person.age)
        case 2: return String(person.yearsOfExperience)
        default: fatalError("Invalid column!")
        }
    }
}

//코드 19.15 printTable의 인수가 CustomStringConvertible을 준수하도록 하기
/*
 프로토콜 구성은 &라는 중위 연산자(infix)를 사용하여 여러 프로토콜을 하나의 요건으로 결합하겠다고 컴파일러에
 알리는 문법 구조를 채택했다. 위에서 dataSource가
 TabularDataSource 및 CustomStringConvertible 둘 다를 준수해야 한다는 것이 요건
 */

func printTable(_ dataSource: TabularDataSource & CustomStringConvertible){
    print("Table: \(dataSource.description)")
    // 열 헤더가 포함된 첫 번쨰 행을 만든다
    var firstRow = "|"
    
    // 각 열의 너비를 판단한다
    var columnWidths = [Int]()
    
    
    for i in 0..<dataSource.numberOfColumns{
        let columnLabel = dataSource.label(forColumn: i)
        let columnHeader = " \(columnLabel) |"
        firstRow += columnHeader
        columnWidths.append(columnLabel.count)
    }
    
    print(firstRow)
    
    // 이 행의 각 항목을 문자열에 덧붙인다.
    for i in 0..<dataSource.numberOfRows{
        // 출력 문자열 시작
        var out = "|"
        
        // 이행의 각 항목을 문자열에 덧붙인다.
        for j in 0..<dataSource.numberOfColumns{
            let item = dataSource.itemFor(row: i, column: j)
            let paddingNeeded = columnWidths[j] - item.count
            let padding = repeatElement(" ", count: paddingNeeded).joined()
            out += " \(padding)\(item) |"
        }
        
        print(out)
    }
}

var department = Department(name: "Engineering")
department.add(Person(name: "joe", age: 30, yearsOfExperience: 6))
department.add(Person(name: "Karen", age: 40, yearsOfExperience: 18))
department.add(Person(name: "Fred", age: 50, yearsOfExperience: 20))

printTable(department)

// 변경용 메서드
// mutating!
protocol Toggleable{
    mutating func toggle()
}

enum Lightbulb{
    case on
    case off
    
    mutating func toggle(){
        switch self {
        case .on: self = .off
        case .off: self = .on
        }
    }
}


func calculator(n1:Int, n2:Int, operation:(Int, Int) -> Int) -> Int {
    return operation(n1,n2)
}


calculator(n1: 1, n2: 2, operation: { $0 + $1 })
