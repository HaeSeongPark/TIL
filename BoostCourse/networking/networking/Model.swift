//
//  Model.swift
//  networking
//
//  Created by rhino Q on 2018. 5. 16..
//  Copyright © 2018년 rhino Q. All rights reserved.
//

import Foundation

struct APIResponse: Codable {
    let results: [Friend]
}

struct Friend:Codable {
    struct Name:Codable {
        let title: String
        let first: String
        let last: String
        
        var full: String {
            return self.title.capitalized + ". " + self.first.capitalized + " " + self.last.capitalized
        }
    }
    
    struct Picture:Codable {
        let large: String
        let medium: String
        let thumbnail: String
    }
    
    let name: Name
    let email: String
    let picture: Picture
}
