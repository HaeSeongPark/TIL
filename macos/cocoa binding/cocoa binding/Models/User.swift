//
//  User.swift
//  cocoa binding
//
//  Created by rhino Q on 04/09/2018.
//  Copyright © 2018 rhino Q. All rights reserved.
//

import Foundation

class User: NSObject {
    // kvo complie
    @objc dynamic var firstName: String = "Harry"
    @objc dynamic var lastName: String = "Ng"
}
