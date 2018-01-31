//
//  PieGraphSupport.swift
//  Graph
//
//  Created by rhino Q on 2018. 1. 31..
//  Copyright © 2018년 rhino Q. All rights reserved.
//

import UIKit

@IBDesignable class PieGraphSupport: UIView {
    override func draw(_ rect: CGRect) {
        // Variable
        let Center = CGPoint(x: rect.width/2, y: (rect.height * 2) / 3)
        let GraphWidth = CGFloat(30)
        let WalkCalorieRadius = CGFloat(100)
        
        let π = CGFloat(Double.pi)
        let StartAngle = CGFloat(-0.5 * π)
        let EndAngle = CGFloat(1.5 * π)
        var WalkCalorieEndAngle = CGFloat()
        
        // Data //
        let TotalCalorie = CGFloat(2000)
        let WalkCalorie = CGFloat(800)
        
        WalkCalorieEndAngle = StartAngle + ( WalkCalorie / TotalCalorie * 2 * π)
        
        // Pie Graph Backgroud
        let WalkCalorieBGPath = UIBezierPath(arcCenter: Center, radius: WalkCalorieRadius, startAngle: StartAngle, endAngle: EndAngle, clockwise: true)
        
        WalkCalorieBGPath.lineWidth = GraphWidth
        UIColor(red: 33/255, green: 0/255, blue: 3/255, alpha: 1.0).setStroke()
        WalkCalorieBGPath.stroke()
        
        // Pie Graph
        let WalkCaloriePath = UIBezierPath(arcCenter: Center, radius: WalkCalorieRadius, startAngle: StartAngle, endAngle: WalkCalorieEndAngle, clockwise: true)
        
        WalkCaloriePath.lineWidth = GraphWidth
        WalkCaloriePath.lineCapStyle = .round
        UIColor(red: 223/255, green: 12/255, blue: 36/255, alpha: 1.0).setStroke()
        WalkCaloriePath.stroke()
        
        
    }
}
