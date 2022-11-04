//
//  Models.swift
//  KidsNoteHomework
//
//  Created by rhino Q on 2022/11/02.
//

import Foundation

struct SearchResult:Decodable {
    var items:[Book]
}

struct Book:Decodable {
    let volumeInfo:VolumeInfo?
}

extension Book {
    var description:String {
        return volumeInfo?.description ?? "No dscription"
    }
    
    var title:String {
        return volumeInfo?.title ?? "No title"
    }
    
    var authors:String {
        guard let authors = volumeInfo?.authors, !authors.isEmpty else {
            return "No authors"
        }
        
        return authors.joined(separator: " | ")
    }
    
    var printType:String {
        return volumeInfo?.printType ?? "No book type"
    }
    
    var publishedInfo:String {
        return [volumeInfo?.publishedDate,
                volumeInfo?.publisher]
            .compactMap { $0 }.joined(separator: " | ")
    }
    
    var bookDetailInfo:String {
        return [
            volumeInfo?.publisher,
            volumeInfo?.pageCount.map { String($0)},
            volumeInfo?.averageRating.map { String($0)},
        ] .compactMap { $0 }.joined(separator: " | ")
    }
}

struct VolumeInfo:Decodable {
    let title:String
    let authors:[String]?
    let publisher:String?
    let publishedDate:String?
    let description:String?
    let pageCount:Int?
    let printType:String?
    let averageRating:Int?
    let ratingsCount:Int?
    let imageLinks: ImageLinks?
}

struct ImageLinks:Decodable {
    let smallThumbnail:String
    let thumbnail:String
}
