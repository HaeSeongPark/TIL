//
//  Country.swift
//  Wheather
//
//  Created by rhino Q on 2018. 5. 11..
//  Copyright © 2018년 rhino Q. All rights reserved.
//

import Foundation

struct Country: Codable {
    let koreanName: String
    let assetName: String
    
    enum CodingKeys: String, CodingKey {
        case koreanName = "korean_name"
        case assetName = "asset_name"
    }
}
