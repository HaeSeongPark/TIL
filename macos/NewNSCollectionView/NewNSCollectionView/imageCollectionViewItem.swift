//
//  imageCollectionViewItem.swift
//  NewNSCollectionView
//
//  Created by rhino Q on 04/09/2018.
//  Copyright © 2018 rhino Q. All rights reserved.
//

import Cocoa

class imageCollectionViewItem: NSCollectionViewItem {
    override var isSelected: Bool {
        didSet {
            updateColor()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        view.wantsLayer = true
        view.layer?.backgroundColor = NSColor.red.cgColor
    }
    
    func updateColor() {
        if isSelected {
            switch highlightState {
            case .none, .forDeselection:
                view.layer?.backgroundColor = NSColor.red.cgColor
            case .forSelection:
                view.layer?.backgroundColor = NSColor.green.cgColor
            default: break
          }
        } else {
            view.layer?.backgroundColor = NSColor.red.cgColor
        }
    }
}
