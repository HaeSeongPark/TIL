//
//  FlickPhotoCell.swift
//  FlickSearchCollectionVCPractice
//
//  Created by rhino Q on 2018. 5. 14..
//  Copyright © 2018년 rhino Q. All rights reserved.
//

import UIKit

class FlickPhotoCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    override var isSelected: Bool {
        didSet {
            imageView.layer.borderWidth = isSelected ? 10 : 0
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageView.layer.borderColor = themeColor.cgColor
        isSelected = false
    }
    
}
