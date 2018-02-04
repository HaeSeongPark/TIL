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
Int.min
Int.max


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
var 신호등:String = "빨간불"
//신호등 == "빨간불"
if 신호등 == "빨간불" {
    print("멈춘다.")
} else {
    print("건넌다.")
}

/*:
 ## 더 많은 비교 연산자들
 
 우리가 배웠던 == 만 예외하면 수학에서의 연산과 같다.
 
 \> 크다
 
 \< 작다
 
 \>= 크거나 같다
 
 \<= 작거나 같다
 
 \!= 같지 않다.
 
 메모앱 소스로 가서 확인
 */

//: [class👉](@next)

