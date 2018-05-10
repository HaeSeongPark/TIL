//
//  UserInfomation.swift
//  SignUp
//
//  Created by rhino Q on 2018. 5. 10..
//  Copyright © 2018년 rhino Q. All rights reserved.
//

import Foundation

class UserInfomation {
    static let shared: UserInfomation = UserInfomation()
    
    var id: String?
    var password: String?
    var phoneNumber: String?
    var birthday: String?
}
