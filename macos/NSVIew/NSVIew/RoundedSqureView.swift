//
//  RoundedSqureView.swift
//  NSVIew
//
//  Created by rhino Q on 05/09/2018.
//  Copyright © 2018 rhino Q. All rights reserved.
//

import Cocoa

class RoundedSqureView: NSView {
    
    var innerFrame: NSRect?
    var roundedPath: NSBezierPath?
    
    override func awakeFromNib() {
        let click = NSClickGestureRecognizer(target: self, action:  #selector(click(gestrue:)))
        addGestureRecognizer(click)
    }
    
    @objc func click(gestrue:NSClickGestureRecognizer){
        print("click")
        if innerFrame!.contains(gestrue.location(in: self)) {
            print("inside")
        }
        
        if roundedPath!.contains(gestrue.location(in: self)) {
            print("inside beszierPath")
        }
    }
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        let backgroundColor = NSColor.gray
        backgroundColor.set()
        NSBezierPath.fill(bounds)
        
        NSColor.green.set()
        let path = NSBezierPath()
        path.move(to: NSPoint(x:0, y:0))
        path.line(to: NSPoint(x: bounds.width, y:bounds.height))
        path.stroke()
        
        let innerFrame = bounds.insetBy(dx: 10, dy: 10)
//        NSBezierPath.fill(innerFrame)
        let roundedPath = NSBezierPath(roundedRect: innerFrame, xRadius: 20, yRadius: 20)
        roundedPath.fill()
        
        self.innerFrame = innerFrame
        self.roundedPath = roundedPath
    }
}
