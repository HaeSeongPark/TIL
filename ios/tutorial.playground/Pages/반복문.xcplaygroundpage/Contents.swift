//: [Previous](@previous)
/*:
 ## 반복문
  같거나 비슷한 명령을 반복
 
  반복문의 유용함.
 */
// "Hello world"를 5번 출력하기.

//print("hello world")
//print("hello world")
//print("hello world")
//print("hello world")
//print("hello world")
//
//




//for i in 1...5{ // 1~5까지 진행됩니다.
//    print("hello world")
//}

//for <#item#> in <#items#> {
//    <#code#>
//}

/*
 for-in 구문
 
 for 임시상수 in 시퀀스아이템(ex; 배열, 범위연산자, string) {
    반복되는 것
 }
 */


/* 위 예제 hello world는
 for 임시상수 in 범위연산자 {
    반복되는 것 : print("hello world")
 }
 */

/*
 범위 연사자 : 값이나 수의 범위를 나타낸다.
 A...B : A부터 B까지의 수를 묶어 범위를 표현, A와 B를 포함.
 A..<B : A부터 B미만까지의 수를 묶어 범위를 표현, A만 포함, B는 미 포함
 A... A이상의 수를 묶어 범위를 표현 A포함
 ...A A이하의 수를 묶어 범위를 표현 A포함
 ..<A A미만의 수를 묶어 범위를 표현 A미포함
 */


//for i in 1...5 {
//    print("hello world")
//}
//
//for i in 1..<5 {  //1~4
//    print("hello world 2")
//}

//임시상수
//
//for i in 1..<5 {  // 1~4
//    print("hello world \(i)")
//}

// 임시상수가 필요없으면 _(underbar)를 이용
//for _ in 1..<5{
//    print("hello world")
//}


/*
 1.  for value in 0...10
     for value in 0..<10
     for _ in 0...10
     for _ in 0..<10
 */


// 구구단

for i in 1...9 {
    print("3 * \(i) = \(i*3)")
}

// 배열을 이용한 for - in 문

let names = ["홍재진","전진수","윤재연","조수연"]
for name in names{
    print("디자이너 \(name)")
}

//for name in names[2...]{
//    print(name)
//}

//for name in names[...2] {
//    print(name)
//}

// string을 이용한 for - in 문
//for letter in "ABCD"{
//    print("The letter is \(letter)")
//}

// 반복문과 함께 알아야 할 것 break, continue
// break 반복문은 종료한다.
// continue 해당 차례를 건너띤다.

//for counter in -3...3 {
//    if counter == 0 {
//        break
//    }
//    print(counter)
//}
//
//for counter in -3...3 {
//    if counter == 0 {
//        continue
//    }
//    print(counter)
//}

//while <#condition#> {
//    <#code#>
//}

//repeat code {
//
//} while condition

// while, repeat-while
//var timer = 10
//while timer > 0 {
//    timer -= 1
//}
/*
 repeat {
    --timer
 } whilte timer > 0
 */

//var beerVolume = 12.0
//var sip = 0.3
//
//while beerVolume > 0 {
//    print("Cheers!")
//    beerVolume -= sip
//}
//repeat {
//    print("Cheers!")
//    beerVolume -= sip
//} while beerVolume > 0

//for i in 1...5{
//    if i % 2 == 0 {
//        print("\(i) == 짝수")
//    } else {
//        print("\(i) == 홀수")
//    }
//}
//: [Next](@next)
