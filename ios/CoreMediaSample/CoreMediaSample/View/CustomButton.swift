//
//  CustomButton.swift
//  CoreMediaSample
//
//  Created by rhino Q on 24/11/2018.
//  Copyright © 2018 rhino Q. All rights reserved.
//

import UIKit

class CustomButton: UIButton {
    
    enum Option: String {
        case begin = "Begin"
        case playMovie = "Play Movie"
        case closeMovie = "Close Moive Player"
    }
    
    var option: Option {
        didSet {
            self.setTitle(option.rawValue, for: .normal)
        }
    }
    
    override init(frame: CGRect) {
        self.option = .begin
        super.init(frame: frame)
        self.setTitle(self.option.rawValue, for: .normal)

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
