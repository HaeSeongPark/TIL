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
        
//        let layout = NSCollectionViewGridLayout()
//        layout.maximumNumberOfColumns = 2
//        layout.maximumNumberOfRows = 5
//        layout.minimumItemSize = NSSize(width: 0, height: 50)
//
//        collectionView.collectionViewLayout = layout
        
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
    
    func collectionView(_ collectionView: NSCollectionView, viewForSupplementaryElementOfKind kind: NSCollectionView.SupplementaryElementKind, at indexPath: IndexPath) -> NSView {
        
        var nibName: String?
        
        if kind == NSCollectionView.SupplementaryElementKind.sectionHeader {
            nibName = "Header"
        } else if kind == NSCollectionView.SupplementaryElementKind.sectionFooter {
            nibName = "Footer"
        }
        
        let view = collectionView.makeSupplementaryView(ofKind: kind, withIdentifier: NSUserInterfaceItemIdentifier(rawValue: nibName!), for: indexPath)
        
        if let view = view as? HeaderView {
           view.titleTextField?.stringValue = "Custom Header"
        } else if let view = view as? FooterView {
            view.titleTextField?.stringValue = "Custom Footer"
        }
        
        return view
    }
}

extension ViewController: NSCollectionViewDelegate {
    
    func collectionView(_ collectionView: NSCollectionView, didSelectItemsAt indexPaths: Set<IndexPath>) {
        print(indexPaths)
    }
}

extension ViewController: NSCollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: NSCollectionView, layout collectionViewLayout: NSCollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> NSSize {
        return NSSize(width: 0, height: 20)
    }
    
    func collectionView(_ collectionView: NSCollectionView, layout collectionViewLayout: NSCollectionViewLayout, referenceSizeForFooterInSection section: Int) -> NSSize {
        return NSSize(width: 0, height: 20)
    }
}

