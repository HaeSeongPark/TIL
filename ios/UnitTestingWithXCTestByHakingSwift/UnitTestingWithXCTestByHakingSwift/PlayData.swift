//
//  PlayData.swift
//  UnitTestingWithXCTestByHakingSwift
//
//  Created by rhino Q on 2018. 3. 18..
//  Copyright © 2018년 rhino Q. All rights reserved.
//

import Foundation

class PlayData{
    var allWorrds = [String]()
    var wordCounts: NSCountedSet!
    private(set) var filteredWords = [String]()
    
    init(){
        if let path = Bundle.main.path(forResource: "plays", ofType: "txt"){
            if let plays = try? String(contentsOfFile: path) {
                allWorrds = plays.components(separatedBy: CharacterSet.alphanumerics.inverted)
            }
        }
        
        allWorrds = allWorrds.filter { $0 != "" }
        
        wordCounts = NSCountedSet(array: allWorrds)
        let sorted = wordCounts.allObjects.sorted() { wordCounts.count(for: $0) > wordCounts.count(for: $1)}
        allWorrds = sorted as! [String]
        applyUserFilter("swift")
//        filteredWords = allWorrds
    }
    
    func applyUserFilter(_ input:String){
        if let userNumber = Int(input){
            applyFilter { self.wordCounts.count(for: $0) >= userNumber }
        } else {
            applyFilter { $0.range(of: input, options: .caseInsensitive) != nil }
        }
    }
    
    func applyFilter(_ filter:(String) -> Bool){
        filteredWords = allWorrds.filter(filter)
    }
}
