//
//  Device.swift
//  CoreMediaSample
//
//  Created by rhino Q on 24/11/2018.
//  Copyright © 2018 rhino Q. All rights reserved.
//

import UIKit

struct Device {
    
    static var isPhone: Bool {
        return UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone
    }
    
}
