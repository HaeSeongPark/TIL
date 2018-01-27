//
//  ViewControllerCellTableViewCell.swift
//  memo_archer
//
//  Created by rhino Q on 2018. 1. 27..
//  Copyright © 2018년 rhino Q. All rights reserved.
//

import UIKit

class ViewControllerCellTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
