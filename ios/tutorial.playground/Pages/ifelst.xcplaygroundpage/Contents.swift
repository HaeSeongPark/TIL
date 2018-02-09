//: [👈nextemmo](@previous)


//if else  / = == / boolean
/*:
 ## 결정한다, 제어한다.  ( Making Decisions, Control flow)
 
 신호등 걸널 때는 생각해 본다. 빨간불'이면' 멈추고 파란불'이면' 건넌다.
 
 이걸 프로그래밍적(swift 아님)으로 표현하면
 ````
 if 빨간불 {
    멈춘다
 } else {
    건넌다.
 }
 ````
 
 ## 판단은 true or false
 true와 false  boolean이라는 타입니다.
 
 Int는 정수(-9223372036854775808 ~ 9223372036854775807)를 담을 수 있듯이
 
 boolean은 true false 두 가지 값을 담는다.
 */
true
false


/*:
 ## 프로그래밍에서 '같다는' '=='이다. Equality
 */
10 == 9 + 1
"hellonature" == "hellonature"

/*:
 - Note:
    '='는 변수(그릇)에 무언가 담을 때 쓰고
 
    '=='는 변수(그릇)끼리 비교할 때 쓴다.
 */

/*:
 ## Quiz
 let 신호등:String = "빨간불" 이라고 할 때
 
 다음 문장은 swift 코드로 나타내시요
 
 신호등이 빨간불이면
 
 "멈춘다" 출력
 
 그렇지 않으면 (다른 말로 하면 파란불이면)
 
"건넌다" 출력
 */
let 신호등:String = "파란불"
if 신호등 == "빨간불" {
    print("멈춘다.")
} else {
    print("건넌다.")
}



let tenLet = 10
var tenVar = 10

if tenVar == 10 {
    print("10이다.")
//    tenLet = 10
} else {
    print("10이 아니다.")
}
/*
  ten이 10이면 "10이다"출력
  그렇지 않으면 "10이 아닙니다"출력
 */



var 배송비 = 2500
var 주문가격 = 80000
let 무료배송가격 = 40000
print(배송비)



/*
 주문가격이 무료배송가격보다 크면 배송비를 0원으로
 그렇지 않으면 배송비를 2500원으로...

 */

