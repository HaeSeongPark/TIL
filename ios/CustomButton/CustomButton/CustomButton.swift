//
//  CustomButton.swift
//  CustomButton
//
//  Created by rhino Q on 27/03/2019.
//  Copyright © 2019 rhino Q. All rights reserved.
//

import UIKit

@IBDesignable
class CustomButton: UIButton {
    private let lineWidth:CGFloat = 6.0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    private func setup() {
        backgroundColor = .clear
        let circleLayer = CALayer()
        circleLayer.backgroundColor = UIColor.white.cgColor
        circleLayer.bounds = bounds.insetBy(dx: 8.0, dy: 8.0)
        circleLayer.position = CGPoint(x: bounds.midX, y: bounds.midY)
        circleLayer.cornerRadius = circleLayer.bounds.size.width / 2.0
        layer.addSublayer(circleLayer)
    }


    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        context?.setStrokeColor(UIColor.white.cgColor)
        context?.setFillColor(UIColor.white.cgColor)
        context?.setLineWidth(lineWidth)
        let insetRect: CGRect = rect.insetBy(dx: lineWidth / 2.0, dy: lineWidth / 2.0)
        context?.strokeEllipse(in: insetRect)
    }
}
