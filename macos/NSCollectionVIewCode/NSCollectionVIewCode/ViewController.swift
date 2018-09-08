//
//  ViewController.swift
//  NSCollectionVIewCode
//
//  Created by rhino Q on 08/09/2018.
//  Copyright © 2018 rhino Q. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    var scrollView: NSScrollView!
    var collectionView: NSCollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView = NSScrollView(frame: view.frame)
        
        collectionView = NSCollectionView(frame: NSRect.zero)
        collectionView = NSCollectionView(frame:view.frame)
        collectionView.collectionViewLayout = NSCollectionViewLayout()
        collectionView.dataSource = self
        collectionView.delegate = self
        
        scrollView.documentView = collectionView
        
        view.addSubview(scrollView)
        collectionView.register(MyItem.self, forItemWithIdentifier: .init("MyItem"))
    }
}

extension ViewController: NSCollectionViewDataSource {
    
    func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        return collectionView.makeItem(withIdentifier: .init("MyItem"), for: indexPath)
    }
}

extension ViewController: NSCollectionViewDelegate {
    
}

extension ViewController:NSCollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: NSCollectionView, layout collectionViewLayout: NSCollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> NSSize {
        return NSSize(width: 60, height: 30)
    }
}
