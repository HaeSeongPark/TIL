
/*
 다양한 타입이 같은 방식으로 동작하는 코드는 어떻게 작성할 수 있을까?
 제네릭을 적용하면 컴파일러가 알지 못하는 타입을 사용하여 타입이나 함수를 작성할 수 있다.
 */

// 코드 22.1 Stack 설정하기
// 정수만 저장하는 Stack 구조체
//struct Stack{
//    var items = [Int]()
//
//    mutating func push(_ newIntem:Int){
//        items.append(newIntem)
//    }
//
//    mutating func pop() -> Int? {
//        guard !items.isEmpty else {
//            return nil
//        }
//        return items.removeLast()
//    }
//}
//
//var intStack = Stack()
//intStack.push(1)
//intStack.push(2)
//
//print(intStack.pop())
//print(intStack.pop())
//print(intStack.pop())


// 코드 22.3 Stack을 제네릭으로 만들기
// 제네릭 선언 <>를 상요하여 묶고 탕입 이름을 바로 표기한다.
// Element는 일종의 자리 맡기 타입
//struct Stack<Element>{
//    var items = [Element]()
//
//    mutating func push(_ newIntem:Element){
//        items.append(newIntem)
//    }
//
//    mutating func pop() -> Element?{
//        guard !items.isEmpty else {
//            return nil
//        }
//        return items.removeLast()
//    }
//
//}
// intStack 구체화하기
//var intStack = Stack<Int>()
//var stringStack = Stack<String>()
//stringStack.push("this is a string")
//stringStack.push("another string")
//print(stringStack.pop())

// 제네릭 함수와 메서드
// 22.6 직접 구현하는 map 함수
// T,U역시 자리 맡기용 타입, T타입의 인수를 받아 U타입의 값을 리턴하는 클로저, U타입의 배열
//func myMap<T,U>(_ items:[T], _ f:(T) -> (U)) -> [U]{
//    var result = [U]()
//    for item in items{
//        result.append(f(item))
//    }
//    return result
//}

// 22.7 배열 매핑하기
//let strings = ["one","two","three"]
//let stringLengths = myMap(strings){ $0.count }
//// 여기서 T String이고 U는 Int
//print(stringLengths)

// 22.8 Stack 매핑하기
//struct Stack<Element>{
//    var items = [Element]()
//
//    mutating func push(_ newIntem:Element){
//        items.append(newIntem)
//    }
//
//    mutating func pop() -> Element?{
//        guard !items.isEmpty else {
//            return nil
//        }
//        return items.removeLast()
//    }
//
//    // Element는 Stack<Element>이다
//    func map<U>(_ f: (Element) -> U) -> Stack<U>{
//        var mappedItems = [U]()
//        for item in items {
//            mappedItems.append(f(item))
//        }
//        return Stack<U>(items:mappedItems)
//    }
//}
// 코드 22.9 map(_:)사용하기
var intStack = Stack<Int>()
intStack.push(1)
intStack.push(2)
var doubledStack = intStack.map { $0 * 2 }
print(intStack.pop())
print(intStack.pop())
print(intStack.pop())

print(doubledStack.pop())
print(doubledStack.pop())


// 타입제한 조건
// 어떤 타입도 올 수 있기 때문에...
//func checkIfEqual<T>(_ first:T, _ second:T) -> Bool{
//    return first == second
//}

// 코드 22.10 타입 제한 조건을 적용하여 동일성 판다 서용하기
// 타입 T가 Equatable을 준수해야 한다고 선언했다.
func checkIfEqual<T:Equatable>(_ first:T, _ second:T) -> Bool{
    return first == second
}

print(checkIfEqual(1,1.1))

// 코드 22.11 타입 제한 조건을 적용하여 CustomStringConvertible값 판단하기
func CheckIfDescriptionsMatch<T:CustomStringConvertible, U:CustomStringConvertible>(_ first:T, _ second:U) -> Bool{
    return first.description == second.description
}

// 연결되는 타입 프로토콜
// 타입과 함수 메서드를 제네릭으로 만들 수 있었다.
// 프로토콜은 제네릭으로 만들 수 없다.
// 대신 연결되는 타입을 지원한다.
// 사용되는 프로토콜은 IteratorProtocol과 Sequence이며
// 이 둘을 사용하면 fon - in 루프로 반복 처리할 수 있는 타입을 직접 만들 수 있다..

// 코드 22.15 Stack이 Sequence를 준수하도록 하기
struct StackIterator<T>: IteratorProtocol{
    var stack: Stack<T>
    mutating func next() -> T?{
        return stack.pop()
    }
}

protocol IteratorProtocol{
    associatedtype  Element
    mutating func next() -> Element?
}

// 코드 22.12 StackIterator 만들기


// Sequence 만들기
protocol Sequence {
    associatedtype Iterator: IteratorProtocol
    func makeIterator() -> Iterator
}

struct Stack<Element>:Sequence{
    var items = [Element]()
    
    mutating func push(_ newIntem:Element){
        items.append(newIntem)
    }
    
    mutating func pop() -> Element?{
        guard !items.isEmpty else {
            return nil
        }
        return items.removeLast()
    }
    
    // Element는 Stack<Element>이다
    func map<U>(_ f: (Element) -> U) -> Stack<U>{
        var mappedItems = [U]()
        for item in items {
            mappedItems.append(f(item))
        }
        return Stack<U>(items:mappedItems)
    }
    
    func makeIterator() -> StackIterator<Element>{
        return StackIterator(stack:self)
    }
}



var myStack = Stack<Int>()
myStack.push(10)
myStack.push(20)
myStack.push(30)

for value in myStack{
    
}

var myStackIterator = StackIterator(stack:myStack)
while let value = myStackIterator.next(){
    print("got \(value)")
}


print("sdf")

//myStack 반복 처리하기

