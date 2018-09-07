//
//  ViewController.swift
//  NSCollectionVIewDragDrop
//
//  Created by rhino Q on 06/09/2018.
//  Copyright © 2018 rhino Q. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    @IBOutlet weak var collectionView: NSCollectionView!
    var strings = ["a", "b", "c", "d", "e", "f", "g", "h"]
    var draggingIndexPaths: Set<IndexPath> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.registerForDraggedTypes([.string])
    }
    
    @IBAction func addtoToTop(_ sender: NSButton) {
        strings.insert("Top", at: 0)
        let indexPaths: Set<IndexPath> = [IndexPath(item: 0, section: 0)]
        
        // reload data happens before animation
        // to solve this, use perforBatchUpdates
        collectionView.animator().performBatchUpdates({
          
          // another way to animate scroll view which is better way i think
          // use performBatchUpdates to animate scroll view
          self.collectionView.scroll(NSPoint(x: 0, y: 0))
          //
            
          self.collectionView.animator().insertItems(at: indexPaths)
        }) { (finished) in
            self.collectionView.reloadData()
        }
    }
    
    @IBAction func removeFromTop(_ sender: NSButton) {
        guard !strings.isEmpty else { return }
        
        strings.removeFirst()
        let indexPaths: Set<IndexPath> = [IndexPath(item: 0, section: 0)]
        collectionView.animator().performBatchUpdates({
            self.collectionView.animator().deleteItems(at: indexPaths)
        }) { (finished) in
            self.collectionView.reloadData()
        }
    }
    
    @IBAction func replaceLast(_ sender: NSButton) {
        guard !strings.isEmpty else { return }
        strings.removeLast()
        strings.append("Last")
        
        let indexPaths: Set<IndexPath> = [IndexPath(item: strings.count-1, section: 0)]
        
        collectionView.animator().performBatchUpdates({
            // Deletes are processed before inserts in batch operations. from document
            self.collectionView.deleteItems(at: indexPaths)
            self.collectionView.insertItems(at: indexPaths)
        }) { (finished) in
            self.collectionView.reloadData()
        }
    }
    
    @IBAction func scrollDOwn(_ sender: NSButton) {
        let rect = collectionView.frameForItem(at: 2)
        
        // 1 get reference of clip view
        let clipView = collectionView.enclosingScrollView!.contentView
        
        NSAnimationContext.beginGrouping()
        NSAnimationContext.current.duration = 2
        
        //scrollPoint does not support animation
//        collectionView.scroll(rect.origin)
        
        // use boudns of clip view to animate.
        // start 1
        // 2
        clipView.animator().setBoundsOrigin(rect.origin)
        
        NSAnimationContext.endGrouping()
        
        //advanced
        clipView.postsFrameChangedNotifications = true
        NotificationCenter.default.addObserver(self, selector: #selector(boundsDidChange(noti:)), name: NSView.boundsDidChangeNotification, object: clipView)
    }
    
    @objc func boundsDidChange(noti: Notification) {
        print("boundsDidChange")
    }
}

extension ViewController: NSCollectionViewDataSource {
    func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return strings.count
    }
    
    func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        let item = collectionView.makeItem(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "MyItem"), for: indexPath)
        
        item.textField?.stringValue = "\(strings[indexPath.item]) \(indexPath.item)"
        return item
    }
}

extension ViewController: NSCollectionViewDelegate {
    func collectionView(_ collectionView: NSCollectionView, willDisplay item: NSCollectionViewItem, forRepresentedObjectAt indexPath: IndexPath) {
    }
    
    
    func collectionView(_ collectionView: NSCollectionView, pasteboardWriterForItemAt indexPath: IndexPath) -> NSPasteboardWriting? {
        let pb = NSPasteboardItem()
        pb.setString(strings[indexPath.item], forType: .string)
        return pb
    }
    
    func collectionView(_ collectionView: NSCollectionView, validateDrop draggingInfo: NSDraggingInfo, proposedIndexPath proposedDropIndexPath: AutoreleasingUnsafeMutablePointer<NSIndexPath>, dropOperation proposedDropOperation: UnsafeMutablePointer<NSCollectionView.DropOperation>) -> NSDragOperation {
        return .move
    }
    
    func collectionView(_ collectionView: NSCollectionView, draggingSession session: NSDraggingSession, willBeginAt screenPoint: NSPoint, forItemsAt indexPaths: Set<IndexPath>) {
        draggingIndexPaths = indexPaths
    }
    
    func collectionView(_ collectionView: NSCollectionView, draggingSession session: NSDraggingSession, endedAt screenPoint: NSPoint, dragOperation operation: NSDragOperation) {
        draggingIndexPaths = []
    }
    
    func collectionView(_ collectionView: NSCollectionView, acceptDrop draggingInfo: NSDraggingInfo, indexPath: IndexPath, dropOperation: NSCollectionView.DropOperation) -> Bool {
        for fromIndexPath in draggingIndexPaths {
            let temp = strings.remove(at: (indexPath.item <= fromIndexPath.item) ? indexPath.item : (indexPath.item - 1 ))
            strings.insert(temp, at: indexPath.item)
            
            NSAnimationContext.current.duration = 0.5
            collectionView.animator().moveItem(at: fromIndexPath, to: indexPath)
        }
        return true
    }
}



