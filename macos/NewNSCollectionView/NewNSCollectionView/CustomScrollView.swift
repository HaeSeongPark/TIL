//
//  CustomScrollView.swift
//  NewNSCollectionView
//
//  Created by rhino Q on 05/09/2018.
//  Copyright © 2018 rhino Q. All rights reserved.
//

import Cocoa

class CustomScrollView: NSScrollView {
    
    override func awakeFromNib() {
        let area = NSTrackingArea(rect: bounds, options: [.inVisibleRect, .activeAlways, .mouseMoved], owner: self, userInfo: nil)
        addTrackingArea(area)
    }
    
    override func mouseMoved(with event: NSEvent) {
//        print(event.locationInWindow)
        var pointInView = convert(event.locationInWindow, from: nil)
//        print(pointInView)
        
        pointInView.y += documentVisibleRect.origin.y
        
        if let collectionView = documentView as? NSCollectionView {
            
            for item in collectionView.visibleItems() {
                (item as? imageCollectionViewItem)?.setBackground(highlight: false)
            }
            
            if let indexPath = collectionView.indexPathForItem(at: pointInView) {
//                print(indexPath)
                if let item = collectionView.item(at: indexPath) as? imageCollectionViewItem{
                    item.setBackground(highlight: true)
                }
            }
        }
    }
    
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
