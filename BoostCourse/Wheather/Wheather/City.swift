//
//  City.swift
//  Wheather
//
//  Created by rhino Q on 2018. 5. 12..
//  Copyright © 2018년 rhino Q. All rights reserved.
//

import Foundation
import UIKit

struct City: Codable {
    let cityName:String
    let state:Int
    let celsius:Double
    let rainProbability:Int
    
    var celsiusAndFahrenheit:String {
        return "섭씨 \(celsius)도 / 화씨 \(fahrenheit)도"
    }
    
    var rainProbabilityFullName:String {
        return "강수확률 \(rainProbability)%"
    }
    
    var fahrenheit:Double {
        return celsius * 1.8 + 32
    }
    
    let stateAndImage = [ 10:"sunny", 11:"cloudy", 12:"rainy", 13:"snowy" ]
    
    var wheatherImage:UIImage? {
        guard let wheatherName = stateAndImage[state] else {
            return nil
        }
        return UIImage(named:wheatherName)
    }
    
    var wheaterName:String? {
        guard let wheatherName = stateAndImage[state] else {
            return nil
        }
        return wheatherName
    }
    
    enum CodingKeys: String, CodingKey {
        case state, celsius
        case cityName = "city_name"
        case rainProbability = "rainfall_probability"
    }
}
