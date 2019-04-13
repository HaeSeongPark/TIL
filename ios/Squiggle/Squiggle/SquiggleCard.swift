//
//  SquiggleCard.swift
//  Squiggle
//
//  Created by rhino Q on 13/04/2019.
//  Copyright © 2019 rhino Q. All rights reserved.
//

import Foundation

struct SquiggleCard {
    var shading:Shading
    var color:Color
    
    enum Shading {
        case solid
        case striped
        case open
    }
    
    enum Color {
        case red
        case green
        case purple
    }
}
