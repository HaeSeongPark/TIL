//
//  NSBezierPath+.swift
//  NSCollectionVIewDragDrop
//
//  Created by rhino Q on 07/09/2018.
//  Copyright © 2018 rhino Q. All rights reserved.
//

import Cocoa
extension NSBezierPath {
    func toCGPath () -> CGPath? {
        if self.elementCount == 0 {
            return nil
        }
        
        let path = CGMutablePath()
        var didClosePath = false
        
        for i in 0...self.elementCount-1 {
            var points = [NSPoint](repeating: NSZeroPoint, count: 3)
            
            // need to solve below error
            // Nil is not compatible with expected argument type 'UnsafePointer<CGAffineTransform>'
//            switch self.element(at: i, associatedPoints: &points) {
//            case .moveToBezierPathElement:CGPathMoveToPoint(path, nil, points[0].x, points[0].y)
//            case .lineToBezierPathElement:CGPathAddLineToPoint(path, nil, points[0].x, points[0].y)
//            case .curveToBezierPathElement:CGPathAddCurveToPoint(path, nil, points[0].x, points[0].y, points[1].x, points[1].y, points[2].x, points[2].y)
//            case .closePathBezierPathElement:path.closeSubpath()
//            didClosePath = true;
//            }
        }
        
        if !didClosePath {
            path.closeSubpath()
        }
        
        return path.copy()
    }
}
