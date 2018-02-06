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

func input() -> String {
    let keyboard = FileHandle.standardInput
    let inputData = keyboard.availableData
    return String(data: inputData, encoding: String.Encoding.utf8)!
}

func inValidCheck(input:String) -> Bool{
    print("count : \(input.count)")
    return input.count == 3
}

/*
 배열로 하는 게 좋을 것 같다...
 */
//exit(0)
print("숫자를 입력해주세요 ex)123 :")
let inputString = input()
if ( inValidCheck(input: inputString) == true ) {
    print("You typed: " + inputString)
}
else{
    print("잘 못 입력하셨습니다.")
}



