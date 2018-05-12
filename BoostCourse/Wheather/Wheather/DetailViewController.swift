//
//  DetailViewController.swift
//  Wheather
//
//  Created by rhino Q on 2018. 5. 11..
//  Copyright © 2018년 rhino Q. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var wheatherImage: UIImageView!
    @IBOutlet weak var wheatherNameLbl: UILabel!
    @IBOutlet weak var celsiusAndFahrenheitLbl: UILabel!
    @IBOutlet weak var rainProbabilityLbl: UILabel!
    
    var selectedCityWeatherImage:UIImage?
    var selectedCityWeatherName:String?
    var selectedCityCelsiusAndFahrenheit:String?
    var selectedCitiyRainProbability:String?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        wheatherImage.image = selectedCityWeatherImage
        wheatherNameLbl.text = selectedCityWeatherName
        celsiusAndFahrenheitLbl.text = selectedCityCelsiusAndFahrenheit
        rainProbabilityLbl.text = selectedCitiyRainProbability
    }

}
