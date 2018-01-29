//
//  BarGraphSupport.swift
//  Graph
//
//  Created by rhino Q on 2018. 1. 29..
//  Copyright © 2018년 rhino Q. All rights reserved.
//

import UIKit

@IBDesignable class BarGraphSupport: UIView {
    override func draw(_ rect: CGRect) {
        
        let Data = [10, 50, 80, 0, 0, 0, 60, 120, 150, 200, 140, 70, 60, 30, 50, 170, 130,200,200,200,200,200,200,60]
        
        let SupportPath = UIBezierPath()
        
        SupportPath.move(to: CGPoint(x:30, y: bounds.height-110))
        SupportPath.addLine(to: CGPoint(x: bounds.width-30, y: bounds.height-110))
        
        SupportPath.move(to: CGPoint(x:30, y: bounds.height-160))
        SupportPath.addLine(to: CGPoint(x: bounds.width-30, y: bounds.height-160))
        
        SupportPath.move(to: CGPoint(x:30, y: bounds.height-210))
        SupportPath.addLine(to: CGPoint(x: bounds.width-30, y: bounds.height-210))
        
        SupportPath.move(to: CGPoint(x:30, y: bounds.height-260))
        SupportPath.addLine(to: CGPoint(x: bounds.width-30, y: bounds.height-260))
        
        UIColor.gray.setStroke()
        SupportPath.lineWidth = 0.5
        SupportPath.stroke()
        
        
        let Xdis = CGFloat( (rect.width-60) / 23 )
        
        let GrpahBGPath = UIBezierPath()
        
        for i in 0...23 {
            GrpahBGPath.move(to: CGPoint(x: 30 + ( Xdis * CGFloat(i) ), y: bounds.height-60))
            GrpahBGPath.addLine(to: CGPoint(x: 30 + ( Xdis * CGFloat(i) ), y: bounds.height-65))
        }
        
        UIColor(red: 100/255, green: 0/255, blue: 0/255, alpha: 1.0).setStroke()
        GrpahBGPath.lineWidth = 2
        GrpahBGPath.stroke()
        
        let GraphPath = UIBezierPath()
        
        for i in 0...23 {
            GraphPath.move(to: CGPoint(x: 30 + ( Xdis * CGFloat(i) ), y: bounds.height-60))
            GraphPath.addLine(to: CGPoint(x: 30 + ( Xdis * CGFloat(i) ), y: bounds.height-60-CGFloat(Data[i])))
        }
        
        UIColor(red: 220/255, green: 10/255, blue: 30/255, alpha: 1.0).setStroke()
        GraphPath.lineWidth = 2
        GraphPath.stroke()
        
        
    }
}
