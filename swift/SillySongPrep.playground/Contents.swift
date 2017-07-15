//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

func customizeTemplate(name:String, template:String){
    
}

func shortNameFromName(name:String)->String{
    var subName = name
    subName.remove(at: subName.startIndex)
    return subName
}

shortNameFromName(name: "Nate")
shortNameFromName(name: "Talia")

let bananaFanaTemplate = [
    "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
    "Banana Fana Fo F<SHORT_NAME>",
    "Me My Mo M<SHORT_NAME>",
    "<FULL_NAME>"].joined(separator: "\n")

func lyricsFromName(lyricsTemplate: String, fullName:String) -> String{
    lyricsTemplate.replacingOccurrences(of: "<FULL_NAME>", with: fullName).replacingOccurrences(of: "<SHORT_NAME>", with: shortNameFromName(name: fullName))
    return lyricsTemplate

}

lyricsFromName(lyricsTemplate: bananaFanaTemplate, fullName: "Nate")

