//
//  MyItem.swift
//  NSCollectionVIewCode
//
//  Created by rhino Q on 08/09/2018.
//  Copyright © 2018 rhino Q. All rights reserved.
//

import Cocoa

class MyItem: NSCollectionViewItem {
    
    var itemView: MyItemView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        itemView = MyItemView(frame: NSRect.zero)
        view = itemView!
    }
}
