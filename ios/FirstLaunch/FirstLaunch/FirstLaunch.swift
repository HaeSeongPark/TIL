//
//  FirstLaunch.swift
//  FirstLaunch
//
//  Created by rhino Q on 27/03/2019.
//  Copyright © 2019 rhino Q. All rights reserved.
//

import Foundation

final class FirstLaunch {
    
    let wasLaunchedBefore:Bool
    var isFristLaunch:Bool {
        return !wasLaunchedBefore
    }
    
    init(getWasLaunchedBefore: ()->Bool,
         setWasLaunchedBefore:(Bool) -> ()) {
        let wasLauncedBefore = getWasLaunchedBefore()
        self.wasLaunchedBefore = wasLauncedBefore
        if !wasLaunchedBefore {
            setWasLaunchedBefore(true)
        }
    }
    
    convenience init(userDefaults:UserDefaults, key:String) {
        self.init(getWasLaunchedBefore: { userDefaults.bool(forKey: key)},
                  setWasLaunchedBefore: { userDefaults.set($0, forKey: key)})
    }
    
//    init() {
//        let key = "yourKey"
//        let wasLaunchedBefore = userDefaults.bool(forKey: key)
//        self.wasLaunchedBefore = wasLaunchedBefore
//        if !wasLaunchedBefore {
//            userDefaults.set(true, forKey: key)
//        }
//    }
}

extension FirstLaunch {
    static func alwaysFirst() -> FirstLaunch {
        return FirstLaunch(getWasLaunchedBefore: { return false }, setWasLaunchedBefore: { _ in})
    }
}
