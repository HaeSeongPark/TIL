//
//  CustomUISilder.swift
//  CusomSlider
//
//  Created by rhino Q on 23/03/2019.
//  Copyright © 2019 rhino Q. All rights reserved.
//

import UIKit

@IBDesignable
class CustomUISilder: UISlider {
    enum Axis:Int {
        case horizontal
        case vertical
    }
    
    var axis:Axis = .horizontal {
        didSet {
            switch axis {
            case .horizontal:
                break
            case .vertical:
                self.transform = CGAffineTransform(rotationAngle: -CGFloat(Double.pi * 0.5));
            }
        }
    }
    
    @IBInspectable var trackHeight: CGFloat = 2
    @IBInspectable var customThumImage:UIImage? {
        didSet {
            setThumbImageFor(cases: [.highlighted, .normal], image: customThumImage)
        }
    }
    
    private func setThumbImageFor(cases:[UISlider.State], image:UIImage?) {
        cases.forEach { setThumbImage(image, for: $0)}
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func trackRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(origin: bounds.origin, size: CGSize(width: bounds.width, height: trackHeight))
    }
    
//    override func thumbRect(forBounds bounds: CGRect, trackRect rect: CGRect, value: Float) -> CGRect {
//
//    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
