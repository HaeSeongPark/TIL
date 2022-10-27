//
//  ViewController.swift
//  appearanceTest
//
//  Created by rhino Q on 2022/10/27.
//

import UIKit

class ViewController: UIViewController {
    
    private var label:UILabel = {
       let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Test"
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        /*
         AppAppearance에서 전역(?)으로 설정하면 VC의 view에도 먹는 데 그러면 view 레이아웃이 안 잡힌다
         subview가 많아지면 그 subview들마다 설정하는 것보다
         전역으로 설정하고 VC의 view에만 true로 하는 게 코드양이 줄 듯
         */
        self.view.translatesAutoresizingMaskIntoConstraints = true
        setUpLayout()
    }
    
    private func setUpLayout() {
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor)
        ])
    }
}

