//
//  ViewController.swift
//  KidsNoteHomework
//
//  Created by rhino Q on 2022/11/02.
//

import UIKit

final class SearchTableViewController: UIViewController {
    
    private var searchResult:SearchResult = SearchResult(items: [])
    private var isLoading:Bool = false
    private var startIndex:Int = 1
    private var searchText:String = ""
    
    private let tableView:UITableView = {
        let tableView = UITableView()
        tableView.register(BookTableViewCell.self, forCellReuseIdentifier: BookTableViewCell.identifier)
        tableView.estimatedRowHeight = 100
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        return tableView
    }()
    
    private let networkService:NetworkService
    init(networkService:NetworkService = NetworkClient.shared) {
        self.networkService = networkService
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        ])
    }
    
    private func configureView() {
        view.backgroundColor = .black
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func embedSearchControl() {
        self.navigationItem.title = "검색"
        let searchController = UISearchController(searchResultsController: nil)
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.placeholder = "검색어를 입력하세요"
        searchController.searchBar.delegate = self
        self.navigationItem.hidesSearchBarWhenScrolling = false
        self.navigationItem.searchController = searchController
    }
    
    
    private func searchBooks(pagination:Pagination) {
        guard !self.isLoading else { return }

        switch pagination {
        case .search(let string):
            searchText = string
            startIndex = 1
        case .nextPage:
            startIndex += 1
        }
                
        self.isLoading = true
        networkService.getResult(searchText: searchText, startIndex: startIndex) { [weak self] (result:Result<SearchResult,NetworkError>) in
            
            self?.isLoading = false
            
            switch result {
            case .success(let searchResult):
                switch pagination {
                case .search:
                    self?.searchResult = searchResult
                case .nextPage:
                    self?.searchResult.items.append(contentsOf: searchResult.items)
                }

                self?.tableView.reloadData()
            case .failure(let error):
                self?.simpleAlert(message: error.description)
            }
            
        }

    }
}

extension SearchTableViewController:UITableViewDataSource {
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResult.items.count
    }

    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         guard let cell = tableView.dequeueReusableCell(withIdentifier: BookTableViewCell.identifier, for: indexPath) as? BookTableViewCell else {
            return UITableViewCell()
        }
        let book = searchResult.items[indexPath.item]
        cell.configure(book)
        return cell
    }
}

extension SearchTableViewController:UITableViewDelegate {
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let book = searchResult.items[indexPath.row]
        let bdv = BookDetailViewController(book: book)
        navigationController?.pushViewController(bdv, animated: true)
    }
}

extension SearchTableViewController:UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let keyword = searchBar.text, !keyword.isEmpty else { return }
        searchBooks(pagination: .search(keyword))
    }
}

extension SearchTableViewController {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {

        let hasReacehdBottom = scrollView.contentOffset.y + self.tableView.frame.height >= self.tableView.contentSize.height - 100
        && self.tableView.contentSize.height > 0

        if hasReacehdBottom {
            searchBooks(pagination: .nextPage)
        }
    }
}

