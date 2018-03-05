//
//  main.swift
//  unitConverter
//
//  Created by rhino Q on 2018. 3. 5..
//  Copyright © 2018년 rhino Q. All rights reserved.
//

import Foundation

/*
 cm : centimeter
 m : meter
 */

let multiplierCmtoM:Double = 0.01
let multiplierMToCm:Double = 100

func checkUnit(inputValue:String){
    var result:String = ""
    // "c"가 있으면 cm 그렇지 않으면 m
    if inputValue.contains("c") {
        result = convertCmtoM(cmValue: inputValue)
    } else {
        result = convertMtoCm(mValue: inputValue)
    }
    print("result : \(result)")
}

func convertCmtoM(cmValue:String) -> String {
    // 함수이름에 정보가 있으므로 centimeter 단어 삭제
    let unitIndex = extractUnitIndex(inputValue: cmValue, unit: "c")
    let valueWithoutUnit = cmValue[..<unitIndex]
    let convertedToMeter = Double(valueWithoutUnit)! * multiplierCmtoM
    return "\(convertedToMeter)m"
}

func convertMtoCm(mValue:String) -> String {
    let unitIndex = extractUnitIndex(inputValue: mValue, unit: "m")
    let valueWithOutUnit = mValue[..<unitIndex]
    let convertedToCentimeter = Double(valueWithOutUnit)! * multiplierMToCm
    return "\(convertedToCentimeter)cm"

}

func extractUnitIndex(inputValue:String, unit:Character) -> String.Index{
    return inputValue.index(of: unit) ?? inputValue.endIndex
}
checkUnit(inputValue: "170cm")
checkUnit(inputValue: "1.8m")



