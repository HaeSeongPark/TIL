//
//  ChatCell.swift
//  sampleLogin
//
//  Created by cord7894 on 2017. 8. 4..
//  Copyright © 2017년 rhino. All rights reserved.
//

import UIKit

class ChatCell: BaseCell {
    
    @IBOutlet weak var lblChatMessage: UILabel!
    
    @IBOutlet weak var lblMessageDetails: UILabel!
    
    override func awakeFromNib(){
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}

