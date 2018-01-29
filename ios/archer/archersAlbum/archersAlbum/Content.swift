//
//  Content.swift
//  archersAlbum
//
//  Created by rhino Q on 2018. 1. 28..
//  Copyright © 2018년 rhino Q. All rights reserved.
//

import UIKit

class Content: UIViewController {

    @IBOutlet weak var ContentImageView: UIImageView!
    @IBOutlet weak var ContentLabel: UILabel!
    
    var PageIndex = Int()
    var ContentImage = String()
    var ContentText = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ContentImageView.image = UIImage(named: ContentImage)
        ContentLabel.text = ContentText
    }
}
