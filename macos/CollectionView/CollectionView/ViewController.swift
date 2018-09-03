//
//  ViewController.swift
//  CollectionView
//
//  Created by rhino Q on 03/09/2018.
//  Copyright © 2018 rhino Q. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
}

extension ViewController: NSCollectionViewDataSource {
    
    static let identifier = "LabelCollectionViewItem"
    
    func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        let item = collectionView.makeItem(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: ViewController.identifier), for: indexPath)
        
        return item
    }
}
