//
//  ViewController.swift
//  ActivityViewController
//
//  Created by rhino Q on 2018. 2. 23..
//  Copyright © 2018년 rhino Q. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target:self, action: #selector(shareImage))
    }
    @objc func shareImage(){
        let vc = UIActivityViewController(activityItems: [imageView.image!], applicationActivities: [])
        present(vc, animated: true, completion: nil)
    }


}

