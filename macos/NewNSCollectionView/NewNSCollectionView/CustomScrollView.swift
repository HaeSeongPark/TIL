//
//  CustomScrollView.swift
//  NewNSCollectionView
//
//  Created by rhino Q on 05/09/2018.
//  Copyright © 2018 rhino Q. All rights reserved.
//

import Cocoa

class CustomScrollView: NSScrollView {
    override func scrollWheel(with event: NSEvent) {
        // for user
        switch event.phase {
        case .began:
            print("began")
//        case .changed:
//            print("changed")
        case .ended:
            print("ended")
        default: break
        }
        
        // for scrollview animation
        switch event.momentumPhase {
        case .began:
            print(">>>began")
//        case .changed:
//            print("changed")
        case .ended:
            print(">>>ended")
        default: break
        }
        
        super.scrollWheel(with: event)
//        if let view = self.documentView as? NSCollectionView {
//            print("Something")
//        }
    }
}
