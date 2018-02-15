//
//  CellB.swift
//  CollectionView
//
//  Created by rhino Q on 2018. 2. 15..
//  Copyright © 2018년 rhino Q. All rights reserved.
//

import UIKit

class CellB: UICollectionViewCell,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource {
    
    // MARK: - Collection View
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let ItemCellB = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCellB", for: indexPath) as! ItemCellB
        
        return ItemCellB
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: ( frame.width - 40 ) / 3, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
}
