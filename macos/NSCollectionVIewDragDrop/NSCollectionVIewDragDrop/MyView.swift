
//
//  MyView.swift
//  NSCollectionVIewDragDrop
//
//  Created by rhino Q on 07/09/2018.
//  Copyright © 2018 rhino Q. All rights reserved.
//

import Cocoa


@IBDesignable class MyView: NSView {
    
    var leftArrowLayer: CAShapeLayer!
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        commonInit()
    }
    
    required init?(coder decoder: NSCoder) {
//      fatalError("init(coder:) has not been implemented")
        super.init(coder: decoder)
        commonInit()
    }
    
    func commonInit() {
        wantsLayer = true
        leftArrowLayer = CAShapeLayer()
        leftArrowLayer.opacity = 1
        layer?.addSublayer(leftArrowLayer)
    }
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        
//        NSColor.yellow.setFill()
//        dirtyRect.fill()
        layer?.backgroundColor = NSColor.yellow.cgColor
        
        // reset the arrow position
        leftArrowLayer.position = NSPoint(x: 30, y: bounds.height / 2)
    }
    
    override func prepareForInterfaceBuilder() {
        layer?.backgroundColor = NSColor.red.cgColor
    }
    
    func createArrow() -> CAShapeLayer {
        let rect = CGRect(x: 0, y: 0, width: 3, height: 10)
        let leftArrow = NSBezierPath()
        
        leftArrow.move(to: CGPoint(x: 0, y: 0))
        leftArrow.line(to: CGPoint(x: rect.width, y: rect.height))
        leftArrow.line(to: CGPoint(x:0, y: rect.height))
        
        let shape = CAShapeLayer()
        shape.strokeColor = NSColor.blue.cgColor
        shape.lineWidth = 2
//        shape.path = leftArrow.toCGPath()
        shape.bounds = rect
        return shape
    }
}
