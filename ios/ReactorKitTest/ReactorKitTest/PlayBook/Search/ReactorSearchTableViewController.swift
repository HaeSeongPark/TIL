//
//  ReactorSearchTableViewController.swift
//  ReactorKitTest
//
//  Created by rhino Q on 2022/11/03.
//

import UIKit
import ReactorKit
final class ReactorSearchTableViewController: UIViewController, View {
    var disposeBag:DisposeBag = DisposeBag()
    
    private let tableView:UITableView = {
        let tableView = UITableView()
        tableView.register(BookTableViewCell.self, forCellReuseIdentifier: BookTableViewCell.identifier)
        tableView.estimatedRowHeight = 100
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        return tableView
    }()
    
    private let searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.placeholder = "검색어를 입력하세요"
       return searchController
    }()
    
    private let activityIndicatorView:UIActivityIndicatorView = {
        let activityIndicatorView = UIActivityIndicatorView(style: .large)
        activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        return activityIndicatorView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        configureView()
        embedSearchControl()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.navigationItem.hidesSearchBarWhenScrolling = true
    }
    
    private func setupView() {
        
        self.view.addSubview(tableView)
        self.view.addSubview(activityIndicatorView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            
            activityIndicatorView.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
            
            activityIndicatorView.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor),
        ])
    }
    
    private func configureView() {
        view.backgroundColor = .black

        self.navigationItem.title = "검색"
        self.navigationItem.hidesSearchBarWhenScrolling = false

    }
    
    private func embedSearchControl() {
        self.navigationItem.searchController = searchController
    }
    
    func bind(reactor: SearchReactor) {
        self.searchController.searchBar.rx.text.orEmpty
            .filter { !$0.isEmpty }
            .distinctUntilChanged()
            .debounce(RxTimeInterval.milliseconds(500), scheduler: MainScheduler.instance)
            .map { Reactor.Action.search($0)}
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        self.tableView.rx.contentOffset
            .filter { [weak self] offset -> Bool in
                guard let `self` = self else { return false }
                
                let scrollPosition: CGFloat = offset.y
                let contentHeight: CGFloat = self.tableView.contentSize.height
                
                return scrollPosition > contentHeight - self.tableView.bounds.height
            }
            .map { _ in Reactor.Action.nextPage }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        self.tableView.rx.modelSelected(Book.self)
            .subscribe(onNext: { [weak self] book in
                let bdv = BookDetailViewController(book: book)
                self?.navigationController?.pushViewController(bdv, animated: true)

            })
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.isLoading }
        .bind(to:activityIndicatorView.rx.isAnimating)
        .disposed(by: disposeBag)
        
        reactor.pulse(\.$errorMessage)
            .compactMap { $0 }
            .subscribe(onNext: { [weak self] in
                self?.simpleAlert(message: $0)
            })
            .disposed(by: disposeBag)
        
        
        reactor.state.map { $0.searchResult.items }
        .bind(to: tableView.rx.items(cellIdentifier: BookTableViewCell.identifier, cellType: BookTableViewCell.self)) { (index:Int, eleemnt:Book, cell:BookTableViewCell) in
            cell.configure(eleemnt)
        }.disposed(by: disposeBag)

    }
}
