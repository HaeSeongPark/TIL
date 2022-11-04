//
//  ViewController.swift
//  UIKitPreview
//
//  Created by rhino Q on 2022/11/04.
//

import UIKit

class ViewController: UIViewController {
    private let label:UILabel = {
       let label = UILabel()
        label.text = "테스트"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
    }


}

