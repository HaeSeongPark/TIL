//
//  BaseCell.swift
//  sampleLogin
//
//  Created by cord7894 on 2017. 8. 4..
//  Copyright © 2017년 rhino. All rights reserved.
//

import UIKit

class BaseCell: UITableViewCell{
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
        separatorInset = .zero
        preservesSuperviewLayoutMargins = false
        layoutMargins = .zero
        layoutIfNeeded()
        
        // Set the selection style to None.
        selectionStyle = .none
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
