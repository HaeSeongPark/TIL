//
//  CollectionViewListLayout.swift
//  NewNSCollectionView
//
//  Created by rhino Q on 04/09/2018.
//  Copyright © 2018 rhino Q. All rights reserved.
//

import Cocoa

class CollectionViewListLayout: NSCollectionViewLayout {
    
    var itemHeight:CGFloat = 50
    
    override var collectionViewContentSize: NSSize {
        
        // only one session
        let count = collectionView?.numberOfItems(inSection: 0)
        
        if count == 0 {
            return NSZeroSize
        }
        
        var size = collectionView?.superview?.bounds.size
        size?.height = itemHeight * CGFloat(count!)
        
        return size!
    }
    
    override func layoutAttributesForElements(in rect: NSRect) -> [NSCollectionViewLayoutAttributes] {
        let count = collectionView?.numberOfItems(inSection: 0)
        var attributes = [NSCollectionViewLayoutAttributes]()
        for index in 0...(count! - 1) {
            let indexPath = NSIndexPath(forItem: index, inSection: 0)
            if let itemAttributes = layoutAttributesForItem(at: indexPath as IndexPath) {
                attributes.append(itemAttributes)
            }
        }
        
        
        return attributes
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> NSCollectionViewLayoutAttributes? {
        let count = collectionView?.numberOfItems(inSection: 0)
        if count! == 0  {
            return nil
        }
        
        let frame = NSRect(x: 0, y: itemHeight * CGFloat(indexPath.item), width: collectionViewContentSize.width, height: itemHeight)
        
        let itemAttributes = NSCollectionViewLayoutAttributes(forItemWith: indexPath)
        itemAttributes.frame = frame
        
        return itemAttributes
        
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: NSRect) -> Bool {
        return true
    }
}
