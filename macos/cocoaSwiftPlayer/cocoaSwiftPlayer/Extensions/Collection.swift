//
//  CollectionType.swift
//  cocoaSwiftPlayer
//
//  Created by rhino Q on 05/09/2018.
//  Copyright © 2018 rhino Q. All rights reserved.
//

import Foundation
extension Collection{
    func shuffle() -> [Iterator.Element] {
        var list = Array(self)
        list.shuffleInPlace()
        return []
    }
}
