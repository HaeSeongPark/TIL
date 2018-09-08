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
    
    // 앞에서 부터 2칸 지우는 것..
    //TODO: - "- " 아니면 지우지 말기...
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
    
    override func deleteBackward(_ sender: Any?) {
        if let (text, range) = paragrapAndRange(range: selectedRange()) {
            if BulletPoint.isCheckList(text: text) {
                let loc = textStorage!.string.distance(from: string.startIndex, to: range.lowerBound)
                if loc == selectedRange().location - 2 {
                    let deleteRange = NSMakeRange(loc, 2)
                    textStorage?.replaceCharacters(in: deleteRange, with: "")
                    return
                }
            }
        }
        super.deleteBackward(sender)
    }
    
    //MARK: - Mouse events
    //TODO: - 엔터치면 empty가 range로 잡히는 것 방지
    override func mouseMoved(with event: NSEvent) {
//        print(event.locationInWindow)
        let fullTextRange = NSMakeRange(0, textStorage!.length)
        layoutManager?.removeTemporaryAttribute(.backgroundColor, forCharacterRange: fullTextRange)
        
        var lineGlyphRange = NSMakeRange(0, textStorage!.length)
        
        let point = convert(event.locationInWindow, from: nil)
//        print(point)
        
        if let layoutManager = layoutManager, let textContainer = textContainer {
            let glyphIndex = layoutManager.glyphIndex(for: point, in: textContainer)
            let glyphRect = layoutManager.boundingRect(forGlyphRange: NSMakeRange(glyphIndex, 1), in: textContainer)
            
            if NSPointInRect(point, glyphRect) {
                let charIndex = layoutManager.characterIndexForGlyph(at: glyphIndex)
                
                layoutManager.lineFragmentRect(forGlyphAt: glyphIndex, effectiveRange: &lineGlyphRange)
                let lineRange = layoutManager.characterRange(forGlyphRange: lineGlyphRange, actualGlyphRange: nil)
                
                let wordRange = selectionRange(forProposedRange: NSMakeRange(charIndex, 0), granularity:.selectByWord)
                
                layoutManager.addTemporaryAttributes([.backgroundColor:NSColor.yellow], forCharacterRange: lineRange)
                layoutManager.addTemporaryAttributes([.backgroundColor:NSColor.green], forCharacterRange: wordRange)
                layoutManager.addTemporaryAttributes([.backgroundColor:NSColor.red], forCharacterRange: NSMakeRange(charIndex, 1))
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

extension MyTextView: NSTextViewDelegate {
    func textView(_ textView: NSTextView, doCommandBy commandSelector: Selector) -> Bool {
        print(commandSelector)
        return false
    }
    func textView(_ textView: NSTextView, shouldChangeTextIn affectedCharRange: NSRange, replacementString: String?) -> Bool {
        print(affectedCharRange)
        print(replacementString)
        
        if let (_, range) = paragrapAndRange(range: selectedRange()) {
            let startRange = NSMakeRange(string.distance(from: string.startIndex, to: range.lowerBound), 0)
            if affectedCharRange.location != startRange.location {
                if let str = replacementString, str.contains("-") {
                    return false // not show
                }
            }
        }
        return true
    }
    
    func textViewDidChangeSelection(_ notification: Notification) {
        print("textViewDidChangeSelection")
    }
    
    func textViewDidChangeTypingAttributes(_ notification: Notification) {
        print("textViewDidChangeTypingAttributes")
        print(textStorage)
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
