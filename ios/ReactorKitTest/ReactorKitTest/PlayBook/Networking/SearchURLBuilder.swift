//
//  SearchURLBuilder.swift
//  KidsNoteHomework
//
//  Created by rhino Q on 2022/11/02.
//

import Foundation
struct SearchURLBuilder {
    static func build(
        baseURL:String,
        searchText:String,
        startIndex:Int
    ) -> URL
    {
        var urlComponets = URLComponents(string: baseURL)!
        let searchParam = URLQueryItem(name: "q", value: searchText)
        let genderParam = URLQueryItem(name: "startIndex", value: String(startIndex))
        urlComponets.queryItems = [searchParam,genderParam]
        
        return urlComponets.url!
    }
}
