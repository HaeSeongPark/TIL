//
//  MyTextView.swift
//  NSTextView
//
//  Created by rhino Q on 07/09/2018.
//  Copyright © 2018 rhino Q. All rights reserved.
//

import Cocoa

class MyTextView: NSTextView {
    override func insertTab(_ sender: Any?) {
        //          super.insertTab(sender)
        //          print(selectedRange())
        if let (text ,range) = paragrapAndRange(range: selectedRange()) {
            // 글자 중간에 "- "이 있다면?
            if !BulletPoint.isCheckList(text: text) {
                let startRange = NSMakeRange(string.distance(from: string.startIndex, to: range.lowerBound), 0)
                insertText("- ", replacementRange: startRange)
            }
        }
    }
    
    override func insertBacktab(_ sender: Any?) {
        //        print("insertBackTab")
        if let (_, range) = paragrapAndRange(range: selectedRange()) {
            let loc = string.distance(from: string.startIndex, to: range.lowerBound)
            let bulletRange = NSMakeRange(loc, 2)
            replaceCharacters(in:bulletRange , with: "")
        }
    }
    
    override func insertNewline(_ sender: Any?) {
        if let (text, _) = paragrapAndRange(range: selectedRange()) {
            if BulletPoint.isCheckList(text: text) {
                insertText("\n- ", replacementRange: selectedRange())
            } else {
                super.insertNewline(sender)
            }
        }
    }
    
    // MARK: - Helpers
    
    // find the current paragraph
    private func paragrapAndRange(range: NSRange) -> (String, Range<String.Index>)? {
        if !string.isEmpty {
            let r = range.stringRangeForText(string: string)
            let paragrapRange = string.paragraphRange(for: r)
            let paragraphString = String(string[paragrapRange])
            return (paragraphString, paragrapRange)
        } else {
            return nil
        }
    }
}

// convert objc nsrange to swift range
extension NSRange {
    func stringRangeForText(string: String) -> Range<String.Index> {
        let start = string.index(string.startIndex, offsetBy: self.location)
        let end = string.index(start, offsetBy: self.length)
        return start..<end
    }
}
