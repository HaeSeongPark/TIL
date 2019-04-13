//
//  SquiggleShapeView.swift
//  Squiggle
//
//  Created by rhino Q on 13/04/2019.
//  Copyright © 2019 rhino Q. All rights reserved.
//

import UIKit

@IBDesignable
class SquiggleShapeView: UIView {
    private let DISTANCE_BETWEEN_STRIPES = 4
    
    //TODO: need to consider Model, refer PlayingCard(in lecture 6)
    enum Shading {
        case solid
        case striped
        case open
    }

    enum Color {
        case red
        case green
        case purple
    }
    //
    
    override func draw(_ rect: CGRect) {
        drawSquiggle(in: self.bounds, with: .red, with: .solid)
    }
    
    private func drawSquiggle(in bounds:CGRect, with color:UIColor, with shading:Shading) {
        let path = UIBezierPath()
        color.setStroke()
        path.lineWidth = 2;
        
        path.move(to: CGPoint(x: bounds.origin.x + bounds.size.width * 0.05, y: bounds.origin.y + bounds.size.height * 0.40))
        
        path.addCurve(to: CGPoint(x: bounds.origin.x + bounds.size.width * 0.35,y: bounds.origin.y + bounds.size.height * 0.25),
                      controlPoint1: CGPoint(x: bounds.origin.x + bounds.size.width * 0.09, y: bounds.origin.y + bounds.size.height * 0.15),
                      controlPoint2: CGPoint(x: bounds.origin.x + bounds.size.width * 0.18, y: bounds.origin.y + bounds.size.height * 0.10))
        
        path.addCurve(to: CGPoint(x: bounds.origin.x + bounds.size.width * 0.75,y: bounds.origin.y + bounds.size.height * 0.30),
                      controlPoint1: CGPoint(x: bounds.origin.x + bounds.size.width * 0.40, y: bounds.origin.y + bounds.size.height * 0.30),
                      controlPoint2: CGPoint(x: bounds.origin.x + bounds.size.width * 0.60, y: bounds.origin.y + bounds.size.height * 0.45))
        
        path.addCurve(to: CGPoint(x: bounds.origin.x + bounds.size.width * 0.97,y: bounds.origin.y + bounds.size.height * 0.35),
                      controlPoint1: CGPoint(x: bounds.origin.x + bounds.size.width * 0.87, y: bounds.origin.y + bounds.size.height * 0.15),
                      controlPoint2: CGPoint(x: bounds.origin.x + bounds.size.width * 0.98, y: bounds.origin.y + bounds.size.height * 0.00))
        
        path.addCurve(to: CGPoint(x: bounds.origin.x + bounds.size.width * 0.45,y: bounds.origin.y + bounds.size.height * 0.85),
                      controlPoint1: CGPoint(x: bounds.origin.x + bounds.size.width * 0.95, y: bounds.origin.y + bounds.size.height * 1.10),
                      controlPoint2: CGPoint(x: bounds.origin.x + bounds.size.width * 0.50, y: bounds.origin.y + bounds.size.height * 0.95))
        
        path.addCurve(to: CGPoint(x: bounds.origin.x + bounds.size.width * 0.25,y: bounds.origin.y + bounds.size.height * 0.85),
                      controlPoint1: CGPoint(x: bounds.origin.x + bounds.size.width * 0.40, y: bounds.origin.y + bounds.size.height * 0.80),
                      controlPoint2: CGPoint(x: bounds.origin.x + bounds.size.width * 0.35, y: bounds.origin.y + bounds.size.height * 0.75))
        
        path.addCurve(to: CGPoint(x: bounds.origin.x + bounds.size.width * 0.05,y: bounds.origin.y + bounds.size.height * 0.40),
                      controlPoint1: CGPoint(x: bounds.origin.x + bounds.size.width * 0.00, y: bounds.origin.y + bounds.size.height * 1.10),
                      controlPoint2: CGPoint(x: bounds.origin.x + bounds.size.width * 0.005, y: bounds.origin.y + bounds.size.height * 0.60))
        
        path.close()
        drawShading(with: shading, with: .red, in: path)
        path.stroke()
        
        
    }
    
    private func drawShading(with shading:Shading, with color:UIColor, in path: UIBezierPath) {
        switch shading {
        case .solid:
            drawSolid(with: color, in: path)
        case .striped:
            drawStriped(for: path)
        case .open:
            break
        }
    }
    
    private func drawSolid(with color:UIColor, in path:UIBezierPath) {
        color.setFill()
        path.fill()
    }
    
    private func drawStriped(for pathOfSymbol: UIBezierPath) {
        // There is no change to nil in draw method.
        let context = UIGraphicsGetCurrentContext()!
        
        // why I need it? what is it?
        context.saveGState()
        let bounds = pathOfSymbol.bounds
        let path = UIBezierPath()
        
        //TODO: need to refactor
        var i = 0
        while i < Int(bounds.size.width) {
            path.move(to: CGPoint(x: CGFloat(bounds.origin.x + CGFloat(i)), y: bounds.origin.y))
            path.addLine(to: CGPoint(x: CGFloat(bounds.origin.x + CGFloat(i)), y: bounds.origin.y + bounds.size.height))
            i += DISTANCE_BETWEEN_STRIPES
        }
        
        pathOfSymbol.addClip()
        path.stroke()
        
        // why I need it? what is it?
        context.restoreGState()

    }
}
