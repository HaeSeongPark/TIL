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
    
    var strings = ["a", "b", "c", "d"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColors = [.gray]
        
//        let layout = NSCollectionViewGridLayout()
//        layout.maximumNumberOfColumns = 2
//        layout.maximumNumberOfRows = 5
//        layout.minimumItemSize = NSSize(width: 0, height: 50)
//
//        collectionView.collectionViewLayout = layout
        
//        collectionView.addGestureRecognizer(NSClickGestureRecognizer(target: self, action: #selector(click(gesture:))))
//        collectionView.addGestureRecognizer(NSPanGestureRecognizer(target:self, action: #selector(pan(gesture:))))
        
    }
    
    // add checking empty case
    @objc func pan(gesture:NSGestureRecognizer){
        switch gesture.state {
        case .ended:
            self.strings.removeLast()
            var set = Set<IndexPath>()
            set.insert(IndexPath(item: self.strings.count, section: 0))
            self.collectionView.deleteItems(at: set)
        default: break
        }
    }
    
    @objc func click(gesture:NSGestureRecognizer) {
        collectionView.performBatchUpdates({
            self.strings.append("New")
            
            var set = Set<IndexPath>()
            set.insert(IndexPath(item: self.strings.count-1, section: 0))
            
            self.collectionView.insertItems(at: set)
        }, completionHandler: nil)
    }
}


extension ViewController: NSCollectionViewDataSource {
    func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return strings.count
    }
    
    func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        let item = collectionView.makeItem(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "imageCollectionViewItem"), for: indexPath)
        
        item.textField?.stringValue = strings[indexPath.item]
        
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
        
        let fromIndexPath = indexPaths.first!
        let toIndexPath = NSIndexPath(forItem: strings.count - 1, inSection: 0)
        
        collectionView.performBatchUpdates({
            self.collectionView.moveItem(at: fromIndexPath, to: toIndexPath as IndexPath)
        }, completionHandler: nil)
    }
}

extension ViewController: NSCollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: NSCollectionView, layout collectionViewLayout: NSCollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> NSSize {
        return NSSize(width: collectionView.bounds.width, height: 50)
    }
    
    func collectionView(_ collectionView: NSCollectionView, layout collectionViewLayout: NSCollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> NSSize {
        return NSSize(width: 0, height: 20)
    }
    
    func collectionView(_ collectionView: NSCollectionView, layout collectionViewLayout: NSCollectionViewLayout, referenceSizeForFooterInSection section: Int) -> NSSize {
        return NSSize(width: 0, height: 20)
    }
}

