//
//  MosaicBox.swift
//  CusomSlider
//
//  Created by rhino Q on 24/03/2019.
//  Copyright © 2019 rhino Q. All rights reserved.
//

import UIKit

@IBDesignable
class MosaicBox: UIView {
    var widthSlider:CustomUISilder!
    var heightSlider:CustomUISilder!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
        addBorder()
        addSliders()
    }
    
    func addBorder() {
        layer.borderColor = UIColor.red.cgColor
        layer.borderWidth = 1
    }
    
    func addSliders() {
        widthSlider = CustomUISilder(frame: CGRect(x: bounds.origin.x, y: bounds.maxY + 10, width: bounds.width, height: 30))
        widthSlider.trackHeight = 1
        widthSlider.customThumImage = UIImage(named: "square")
        widthSlider.tintColor = #colorLiteral(red: 1, green: 0.8, blue: 0, alpha: 1)
        
        
        heightSlider = CustomUISilder(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        
//        addSubview(widthSlider)
//        addSubview(heightSlider)
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
