//
//  Request.swift
//  networking
//
//  Created by rhino Q on 2018. 5. 16..
//  Copyright © 2018년 rhino Q. All rights reserved.
//

import Foundation

let DidReceiveFriendsNotification: Notification.Name = Notification.Name("DidRecieveFriends")

func requestFriends() {
    guard let url = URL(string: "https://randomuser.me/api/?results=20&inc=name,email,picture") else { return }
    
    let session = URLSession(configuration: .default)
    let dataTask = session.dataTask(with: url) { (data:Data?, response: URLResponse?, error:Error?) in
        if let error = error {
            print(error.localizedDescription)
            return
        }
        
        guard let data = data else { return }
        do {
            let apiResponse: APIResponse = try JSONDecoder().decode(APIResponse.self, from: data)
            
            NotificationCenter.default.post(name: DidReceiveFriendsNotification, object: nil, userInfo: ["friends" : apiResponse.results])
            
        } catch(let err) {
            print(err.localizedDescription)
        }
    }
    
    dataTask.resume()
}
