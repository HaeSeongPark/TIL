//
//  Photo.swift
//  ImageLoading
//
//  Created by rhino Q on 2023/04/28.
//

import Foundation
import SwiftUI

struct Photo:Codable,Identifiable {
    var id:String
    var author:String
    var width:CGFloat
    var height:CGFloat
    var url:URL
    var download_url:URL
}

struct LoadingError: Error {}

final class Remote<A>:ObservableObject {
    @Published var result: Result<A,Error>? = nil
    
    var value:A? {
        try? result?.get()
    }
    let url:URL
    let transform:(Data) -> A?
    
    init(url:URL, transform:@escaping (Data) -> A?) {
        self.url = url
        self.transform = transform
    }
    
    func load() {
        URLSession.shared.dataTask(with: url) { data, _, _ in
            DispatchQueue.main.async {
                    if let d = data, let v = self.transform(d) {
                        self.result = .success(v)
                    } else {
                        self.result = .failure(LoadingError())
                    }
                }
        }.resume()
    }
}
