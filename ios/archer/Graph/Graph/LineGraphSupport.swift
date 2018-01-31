//
//  LineGraphSupport.swift
//  Graph
//
//  Created by rhino Q on 2018. 1. 30..
//  Copyright © 2018년 rhino Q. All rights reserved.
//

import UIKit

@IBDesignable class LineGraphSupport: UIView {
    override func draw(_ rect: CGRect) {
        print("rect.width : \(rect.width)")
        print("rect.height : \(rect.height)")
        // Data
        let Data = [1750, 2300, 2200, 1480, 1200, 1800, 1300]
        let TopBorder = CGFloat(400)
        let BottomBorder = CGFloat(0)
        
        
        // X Axis
        let XPoint = {
            (Column:Int) -> CGFloat in
            let Spacer = rect.width / CGFloat(Data.count-1)
            let X = CGFloat(Column) * Spacer
            return X
        }
        
        // Y Axis
        let GraphHeight = rect.height - TopBorder - BottomBorder
        let MaxValue = Data.max()!
        let YPoint = {(GraphPoint: Int) -> CGFloat in
            let Ydis = CGFloat(GraphPoint) / CGFloat(MaxValue) * GraphHeight
            let Y = GraphHeight + TopBorder - Ydis
            return Y
        }
        
        // Line Graph
        let LinePath = UIBezierPath()
        LinePath.move(to: CGPoint(x: XPoint(0), y: YPoint(Data[0])))
        
        for i in 1..<Data.count{
            let NextPoint = CGPoint(x: XPoint(i), y: YPoint(Data[i]))
            
            if Data[i] == 0{
                LinePath.addLine(to: NextPoint)
            } else {
                let MidPoint = CGPoint(x: ( XPoint(i-1) + XPoint(i) ) / 2, y: (YPoint(Data[i-1]) + YPoint(Data[i])) / 2)
                let Diff = ( YPoint(Data[i]) - MidPoint.y) / 2
                let ControlPoint1 = CGPoint(x: ( XPoint(i-1)+MidPoint.x ) / 2, y: ( YPoint(Data[i-1]) + MidPoint.y) / 2 - Diff)
                
                let ControlPoint2 = CGPoint(x: ( XPoint(i)+MidPoint.x ) / 2, y: ( YPoint(Data[i]) + MidPoint.y) / 2 + Diff)
                
                LinePath.addCurve(to: NextPoint, controlPoint1: ControlPoint1, controlPoint2: ControlPoint2)
                
            }
            
        }
        
        // Line Graph Background
        let Context = UIGraphicsGetCurrentContext()
        Context!.saveGState()
        let ClippingPath = LinePath.copy() as! UIBezierPath
        ClippingPath.addLine(to: CGPoint(x: XPoint(Data.count - 1), y: rect.height))
        ClippingPath.addLine(to: CGPoint(x: XPoint(0), y: rect.height))
        ClippingPath.close()
        ClippingPath.addClip()
        
        let Highest = YPoint(MaxValue)
        let StartPoint = CGPoint(x: 0, y: Highest)
        let EndPoint = CGPoint(x: 0, y: self.bounds.height)
        let StartColor = UIColor(red: 230/255, green: 220/255, blue: 30/255, alpha: 1.0)
        let EndColor = UIColor(red: 70/255, green: 70/255, blue: 10/255, alpha: 1.0)
        let Colors = [StartColor.cgColor, EndColor.cgColor]
        let ColorSpace = CGColorSpaceCreateDeviceRGB()
        let ColorLocations = [CGFloat(0.0), CGFloat(1.0)]
        let Gradient = CGGradient(colorsSpace: ColorSpace, colors: Colors as CFArray, locations: ColorLocations)
        
        Context!.drawLinearGradient(Gradient!, start: StartPoint, end: EndPoint, options: CGGradientDrawingOptions.init(rawValue: UInt32(0)))
        
        Context!.restoreGState()
        
        UIColor.white.setStroke()
        LinePath.lineWidth = 1
        LinePath.stroke()
    }
}
