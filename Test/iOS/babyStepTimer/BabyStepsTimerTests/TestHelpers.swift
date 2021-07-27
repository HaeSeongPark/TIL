//
//  TestHelpers.swift
//  BabyStepsTimerTests
//
//  Created by rhino Q on 2021/07/21.
//  Copyright © 2021 Quality Coding. All rights reserved.
//

import UIKit

func tap(_ button:UIButton) {
    button.sendActions(for: .touchUpInside)
}

func makeURL(with path:String) -> URL {
    func makeSoundPath(with resource:String) -> String {
        return Bundle.main.path(forResource: resource, ofType: "wav")!
    }
    
    return URL(fileURLWithPath: makeSoundPath(with: path))
}
