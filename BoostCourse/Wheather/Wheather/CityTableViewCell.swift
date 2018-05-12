//
//  CityTableViewCell.swift
//  Wheather
//
//  Created by rhino Q on 2018. 5. 11..
//  Copyright © 2018년 rhino Q. All rights reserved.
//

import UIKit

class CityTableViewCell: UITableViewCell {
    @IBOutlet weak var wheatherImage: UIImageView!
    @IBOutlet weak var cityNameLbl: UILabel!
    @IBOutlet weak var celsiusAndFahrenheitLbl: UILabel!
    @IBOutlet weak var rainProbabilityLbl: UILabel!
    var nameOfCityWheather:String?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
