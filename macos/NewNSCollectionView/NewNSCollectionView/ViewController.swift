//
//  ViewController.swift
//  NewNSCollectionView
//
//  Created by rhino Q on 04/09/2018.
//  Copyright © 2018 rhino Q. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    @IBOutlet weak var collectionView: NSCollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColors = [.gray]
        
        let layout = NSCollectionViewGridLayout()
        layout.maximumNumberOfColumns = 2
//        layout.maximumNumberOfRows = 5
        layout.minimumItemSize = NSSize(width: 0, height: 50)
        
        collectionView.collectionViewLayout = layout
        
    }

    override var representedObject: Any? {
        didSet {
            
        }
    }
}


extension ViewController: NSCollectionViewDataSource {
    func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        let item = collectionView.makeItem(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "imageCollectionViewItem"), for: indexPath)
        
        return item
        
    }
}

extension ViewController: NSCollectionViewDelegate {
    
    func collectionView(_ collectionView: NSCollectionView, didSelectItemsAt indexPaths: Set<IndexPath>) {
        print(indexPaths)
    }
}

