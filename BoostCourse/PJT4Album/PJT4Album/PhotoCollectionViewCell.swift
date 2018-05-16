//
//  PhotoCollectionViewCell.swift
//  PJT4Album
//
//  Created by rhino Q on 2018. 5. 14..
//  Copyright © 2018년 rhino Q. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                imageView.layer.opacity = 0.8
                imageView.layer.borderWidth = 10
            } else {
                imageView.layer.opacity = 1.0
                imageView.layer.borderWidth = 0
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageView.layer.borderColor = UIColor.black.cgColor
        isSelected = false
    }
    
    var photo:UIImage! {
        didSet {
            imageView.image = photo
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }
}
