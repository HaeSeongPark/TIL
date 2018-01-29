//
//  ViewController.swift
//  archersAlbum
//
//  Created by rhino Q on 2018. 1. 27..
//  Copyright © 2018년 rhino Q. All rights reserved.
//

import UIKit

class Main: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let Cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! MainCellCollectionViewCell
        
        Cell.Titleimage.image = UIImage(named: Data[indexPath.row]["TitleImage"]!)
        Cell.Titlelabel.text = Data[indexPath.row]["TitleLabel"]
        return Cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        UserDefaults.standard.set(indexPath.row, forKey: "selectedNumber")
        self.performSegue(withIdentifier: "ToDashBoard", sender: self)
        print("Cell")
    }
}

