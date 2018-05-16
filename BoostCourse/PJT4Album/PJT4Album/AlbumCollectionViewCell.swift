//
//  AlbumCollectionViewCell.swift
//  PJT4Album
//
//  Created by rhino Q on 2018. 5. 13..
//  Copyright © 2018년 rhino Q. All rights reserved.
//

import UIKit

class AlbumCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var firstImage: UIImageView!
    @IBOutlet weak var albumName: UILabel!
    @IBOutlet weak var photosCountInAlbum: UILabel!
    
    var representImage:UIImage! {
        didSet{
            firstImage.image = representImage
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.firstImage.layer.cornerRadius = 5.0
        self.firstImage.layer.masksToBounds = true
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        firstImage.image = nil
    }
}
