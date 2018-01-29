//
//  MainSupport.swift
//  Graph
//
//  Created by rhino Q on 2018. 1. 29..
//  Copyright © 2018년 rhino Q. All rights reserved.
//

import UIKit

@IBDesignable class MainSupport: UIView {
    
    override func draw(_ rect: CGRect) {
        
        // Border Line
        
        let LinePath = UIBezierPath()
        LinePath.move(to: CGPoint(x: 10, y: 10))
        LinePath.addLine(to: CGPoint(x: 10, y: bounds.height-10))
        LinePath.addLine(to: CGPoint(x: bounds.width-10, y:bounds.height-10))
        LinePath.addLine(to: CGPoint(x: bounds.width-10, y:10))
        LinePath.addLine(to: CGPoint(x: 10, y: 10))
        
        UIColor.darkGray.setStroke()
        LinePath.lineWidth = 1
        LinePath.stroke()
        
        // Marking Point
        let PointPath = UIBezierPath()
        
        PointPath.move(to: CGPoint(x: 30, y: 60))
        PointPath.addLine(to: CGPoint(x: 30, y: 70))
        UIColor.red.setStroke()
        PointPath.lineWidth = 10
        PointPath.stroke()
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
