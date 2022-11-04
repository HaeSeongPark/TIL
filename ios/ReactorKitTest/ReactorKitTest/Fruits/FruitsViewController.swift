//
//  ViewController.swift
//  ReactorKitTest
//
//  Created by rhino Q on 2022/11/01.
//

import UIKit
import ReactorKit
import RxCocoa

class FruitsViewController: UIViewController,View {
        
    private let appleButton:UIButton = {
        let bt = UIButton(type: .system)
        bt.setTitle("사과", for: .normal)
        bt.translatesAutoresizingMaskIntoConstraints = false
        return bt
    }()
    
    private let bananaButton:UIButton = {
        let bt = UIButton(type: .system)
        bt.setTitle("바나나", for: .normal)
        bt.translatesAutoresizingMaskIntoConstraints = false
        return bt
    }()
    
    private let grapesButton:UIButton = {
        let bt = UIButton(type: .system)
        bt.setTitle("포도", for: .normal)
        bt.translatesAutoresizingMaskIntoConstraints = false
        return bt
    }()
    
    private let selectedLabel:UILabel = {
        let label = UILabel()
        label.text = "선택되어진 과일 없음"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var stack:UIStackView = {
        let stack = UIStackView(arrangedSubviews: [appleButton, bananaButton,grapesButton, selectedLabel])
        stack.spacing = 16
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        view.addSubview(stack)
        NSLayoutConstraint.activate([
            stack.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            stack.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
        ])
    }
    
    func bind(reactor: FruitsReactor) {
        appleButton.rx.tap.map { FruitsReactor.Action.apple }
        .bind(to: reactor.action)
        .disposed(by: disposeBag)
        
        bananaButton.rx.tap.map { FruitsReactor.Action.banana }
        .bind(to: reactor.action)
        .disposed(by: disposeBag)
        
        grapesButton.rx.tap.map { FruitsReactor.Action.grapes }
        .bind(to: reactor.action)
        .disposed(by: disposeBag)
        
        reactor.state.map { $0.fruitName }
        .distinctUntilChanged()
        .bind(to: selectedLabel.rx.text)
        .disposed(by: disposeBag)
        
        reactor.state.map { $0.isLoading }
        .distinctUntilChanged()
        .filter { $0 }
        .map { _ -> String in return "로딩중입니다." }
        .bind(to: selectedLabel.rx.text)
        .disposed(by: disposeBag)
    }
}

