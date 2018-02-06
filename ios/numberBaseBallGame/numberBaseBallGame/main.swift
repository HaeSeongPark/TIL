//
//  main.swift
//  numberBaseBallGame
//
//  Created by hellonature on 2018. 2. 6..
//  Copyright © 2018년 rhino. All rights reserved.
//

//
//  main.swift
//  baseBallGame
//
//  Created by hellonature on 2018. 2. 6..
//  Copyright © 2018년 rhino. All rights reserved.
//

import Foundation

/**
 입력값을 받는다.
 */


/**
  유효성검사를 한다.
  문자열 마지막에 \n까지 포함해야 해서 4자리 수인지 아닌지 체크한다.
 */
func inValidCheck(input:String) -> Bool{
    return input.count == 4
}

/**
  정답 체크를 한다.
 */
func checkAnswer(input:String) -> Bool {
    return true
}

/**
 */



/**
 정답지 아닌지 체크한다.
 */
func isAnswer() -> Bool{
    var returnValue = false
    // 입력을 받는다.
    let inputString = input()
    // 유효성 검사를 한다. 만약에 3자리수가 아니면 재귀
    if ( inValidCheck(input: inputString) == false ){
        isAnswer()
    } else {
        //정답체크를 한다.
        returnValue = checkAnswer(input: inputString)
        print("유효성검사 완료")
    }
    return returnValue
}
//
//while(isAnswer() == false){
//
//}



// TODO: 유효성검사 : 숫자로만 돼 있으면서 3자리 수여야 함.

/**
 1부터 9까지의 서로 다른 숫자 중 랜덤으로 3개를 뽑아서 배열로 만들어서 리턴한다.
 */
// TODO: randomNumber 생성하는 것 자세히 알기
func makeRandomAnswer() -> [Int] {
    var randomAnswerArray = [Int]()
    while randomAnswerArray.count < 3 {
        let randomNumber = arc4random_uniform(UInt32(10))
        
        if randomAnswerArray.contains(Int(randomNumber)) == false {
            randomAnswerArray.append(Int(randomNumber))
        }
    }
    return randomAnswerArray
}

/**
 입력을 받는다.
 */
func input() -> String {
    print("숫자를 입력해주세요 ex)123 :")
    let keyboard = FileHandle.standardInput
    let inputData = keyboard.availableData
    return String(data: inputData, encoding: String.Encoding.utf8)!
}

func makeInputIntArray(_ input:String) -> [Int] {
    // 문자열 끝 \n 제거
    let makeValidString = input[..<input.index(before: input.endIndex)]
    // 비교하기 편하게 [Int]배열로 만들어서 리턴
    var intArray = [Int]()
    for i in makeValidString {
        intArray.append(Int(String(i))!)
    }
    return intArray
}

func compare(com:[Int], user:[Int]){
    
}

func startNumberBsseBallGame(){
    // makeRandomAnswer, 정답은 바뀌면 안되니까 let으로 선언
    let randomAnswer = makeRandomAnswer()
    print("randomAnswer : \(randomAnswer)" )
    // 입력을 받는다.
    let inputArray =  makeInputIntArray(input())
    print("inputArray : \(inputArray)")
    
    compare(com: randomAnswer, user: inputArray)
    //비교를 하고 결과 출력
    // 정답이 아닐 때까지 반복
    // 정답이면 종료
}

startNumberBsseBallGame()


