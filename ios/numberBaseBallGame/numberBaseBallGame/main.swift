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
// TODO: 프로그래밍 구현 제약사항에 맞게 재정리

/**
 유효성검사를 한다.
 문자열 마지막에 \n까지 포함해야 해서 4자리 수인지 아닌지 체크, 숫자인지 아닌지 체크
 왜 \n까지 포함되는지 모르겠다.
 */
func inValidCheck(input:String) -> Bool
{
    return input.count == 4 && Int(input[..<input.index(before: input.endIndex)]) != nil
}


/**
 1부터 9까지의 서로 다른 숫자 중 랜덤으로 3개를 뽑아서 배열로 만들어서 리턴한다.
 
 arc4random_uniform(_:) returns a random number between zero and the first parameter, minus one.
 arc4random_uniform(_:) use the UInt32 type instead of the more typical Int.
 UInt32 0~4294967295
 
 
 - Author:
 rhino
 
 
 - returns:
 컴퓨터가 랜덤으로 생성한 숫자들의 배열
 */
func makeRandomAnswer() -> [Int]
{
    var randomAnswerArray = [Int]()
    while randomAnswerArray.count < 3
    {
        let randomNumber = Int(arc4random_uniform(UInt32(9))) + 1
        
        if randomAnswerArray.contains(randomNumber) == false
        {
            randomAnswerArray.append(randomNumber)
        }
    }
    return randomAnswerArray
}

/**
 사용자가 입력한 값을 비교하기 편하게 Int array로 만드는 함수
 
 - Author:
 rhino
 

 - returns:
 사용자가 입력한 값
 */
func input() -> String
{
    print("숫자를 입력해주세요 ex)123 :")
    let keyboard = FileHandle.standardInput
    let inputData = keyboard.availableData
    return String(data: inputData, encoding: String.Encoding.utf8)!
}


/**
 사용자가 입력한 값을 비교하기 편하게 Int array로 만드는 함수
 
 - Author:
 rhino
 
 
 - returns:
 사용자가 입력한 숫자들의 배열
 
 
 - parameters:
   - input : 사용자가 입력한 값
 
 */
func makeInputIntArray(_ input:String) -> [Int]
{
    // 문자열 끝 \n 제거
    let makeValidString = input[..<input.index(before: input.endIndex)]
    var intArray = [Int]()
    for i in makeValidString
    {
        intArray.append(Int(String(i))!)
    }
    return intArray
}

/**
 스트라이크를 체크하는 함수
 
 - Author:
 rhino
 
 
 - returns:
 스트라이크 갯수, 스트라이크되지 않는 숫자(들)의 배열
 
 
 - parameters:
     - com : 컴퓨터가 랜덤으로 생성한 숫자 배열
     - user : 사용자가 입력한 숫자 배열
 
 */
func checkStrike(_ com:[Int], _ user:[Int]) -> (Int,[Int])
{
    var strikeCount = 0
    var tempBallArray = [Int]()
    
    for i in 0..<com.count
    {
        if (com[i] == user[i])
        {
            strikeCount += 1
        }
        else
        {
            tempBallArray.append(user[i])
        }
    }
    return (strikeCount, tempBallArray)
}

/**
 볼을 체크하는 함수
 
 - Author:
 rhino
 
 
 - returns:
    볼 갯수
 
 
 - parameters:
     - com : 컴퓨터가 랜덤으로 생성한 숫자 배열
     - tempBallArray : checkStrike를 하고 스트라이크되지 않는 숫자(들)의 배열
 
 */

func checkBall(_ com:[Int], _ tempBallArray:[Int]) -> Int
{
    var ballCount = 0
    if tempBallArray.count <= 0
    {
        return 0
    }
    for i in 0..<tempBallArray.count
    {
        if com.contains(tempBallArray[i])
        {
            ballCount += 1
        }
    }
    return ballCount
}


/**
 컴퓨터값과 유저값을 비교하는 함수. checkStrike와 checkBall를 가지고 비교한다.
 
 - Author:
 rhino
 
 
 - returns:
    스트라이크 갯수와, 볼 갯수
 
 - parameters:
     - com : 컴퓨터가 랜덤으로 생성한 숫자 배열
     - user : 사용자가 입력한 숫자 배열
 
 */

func compare(com:[Int], user:[Int]) ->(Int,Int)
{
    var strikeCount = 0, ballCount = 0
    var tempBallArray = [Int]()
    
    (strikeCount, tempBallArray)  = checkStrike(com,user)
    
    ballCount = checkBall(com,tempBallArray)
    
    return (strikeCount,ballCount)
}

/**
 결과를 출력하는 함수
 
 - Author:
   rhino

 
 - parameters:
      - strikeCount : 스트라이크 갯수
      - ballCount : 볼 갯수
 
 */
func printResult(_ strikeCount:Int, _ ballCount:Int)
{
    if strikeCount != 0
    {
        print("\(strikeCount) 스트라이크 ", terminator:"")
    }
    if ballCount != 0
    {
        print("\(ballCount)볼")
    }
}
/**
 게임을 시작하는 함수
 */
func startNumberBsseBallGame()
{
    // makeRandomAnswer, 정답은 바뀌면 안되니까 let으로 선언
    let randomAnswer = makeRandomAnswer()
    print("randomAnswer : \(randomAnswer)" )
    
    //정답일 때까지 계속 돌기
    while true
    {
        let inputData = input()
        if inValidCheck(input: inputData) == false{
            print("유효하지 않는 값입니다. 다시입력해주세요!")
            continue
        }
        
        // 입력받은 값을 비교하기 편하게 Int Array로 만든다.
        let inputArray =  makeInputIntArray(inputData)
        print("inputArray : \(inputArray)")
        
        // 컴퓨터와 사용자 값을 비교해서 strikeCount와 ballCount를 알아낸다.
        let (strikeCount, ballCount) = compare(com: randomAnswer, user: inputArray)
        
        //출력한다.
        printResult(strikeCount, ballCount)
        
        // strikeCount가 3이면 정답이다. 게임을 끝낸다.
        if(strikeCount == 3)
        {
            print("\n\(strikeCount)개의 숫자를 모두 맞히셨습니다! 게임종료")
            break
        }
    }
}
startNumberBsseBallGame()


