/*:
 ## 변수와 상수
 */
/*:
변수는 변하는 값
 
 var 이름:타입 = 값
*/
var 현재위치:String = "서울"
현재위치 = "무안"
/*:
상수는 변하지 않는 값
 
 let 이름:타입 = 값
 */
let 고향:String = "서울"


/*:
 ## 변수에 대해서 좀 더 알아봅시다.
 */

var curlingScoreOfKorea = 0
// 3점을 따면
curlingScoreOfKorea = 3
// 3점을 또 따면
curlingScoreOfKorea = 6

//: 보다 프로그래밍적으로 표현하면
curlingScoreOfKorea = 0
curlingScoreOfKorea = curlingScoreOfKorea + 3
curlingScoreOfKorea = curlingScoreOfKorea + 3

//: = 의 의미는 박스에 뭔가를 집어 넣는다
//: 그렇다면 = 이 없으면
curlingScoreOfKorea = 0
curlingScoreOfKorea + 5
//curlingScoreOfKorea
curlingScoreOfKorea + 3
//curlingScoreOfKorea

/*:
 - experiment: score1과 score2는 각각 얼마일까요?
 
 ```
 var score1 = 5
 score1 + score1
 
 let score2 = 5
 score2 = score2 + score2
 ```
 */

//: 단축표현   '+=', '-=', '*=', '/=', '%=',
curlingScoreOfKorea = 0
//curlingScoreOfKorea = curlingScoreOfKorea + 3
curlingScoreOfKorea += 3
//curlingScoreOfKorea = curlingScoreOfKorea + 3
curlingScoreOfKorea += 3

var greeting = ""
greeting += "Hello"
greeting += " "
greeting += "World"
//: 단축표현 연습
let word1 = "Compound"
let word2 = "assignment"
let word3 = "is"
let word4 = "useful"
let space = " "

var statement = ""

var a:Int = 5
a += 5
a -= 5
a *= 2
a /= 2
a %= 2


/*:
 ## 실습
 */

/*:
 
 Q1. score의 값은?
 
 Q2. 2번째 문장을 단축표현을 이용해서 써보세요~
 
 ```
 var score = 2
 score = score + 1
 ```
 */

/*:
 
 Q3. score의 값은?
 
 Q4. 2번째 문장의 단축표현을 풀어서 써보세요
 
 ```
 var score = 0
 score += 1
 score + 1
 ```
 */

/*:
 
 Q5. message의 값은? 띄어쓰기 주의
 
 ```
 var message:String = ""
 message += "Hello"
 message += "Nature"
 ```
 */


/*:
 ## 타입
 
 Int -> 1 2 3 4
 Double -> 1.1 2.2 3.3 4.4
 Bool -> true false
 String -> "헬로네이처"
 
 예제
 
 var abc = "abc"
 let finger = "10"
 let pi = 75.6
 */

/*:
 ## 보기 편하게 camelCase
 단어 2개 이상을 붙여서 변수 명을 만들 때는 보기 편하게
 */
var numberOfLikes = 39
var numberoflikes = 39

var numberOfComments = 23
var numberofcomments = 23

let yearCreated = 2018
let yearcreated = 2018


/*:
 ## 숫자도 보기 편하게 with _
 
 */
var uglyBillion =  100000000
var prettyBillion =  100_000_000

/*
 참조필
 https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/TheBasics.html
 */


