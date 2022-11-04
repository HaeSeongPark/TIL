//
//  DetailViewController.swift
//  KidsNoteHomework
//
//  Created by rhino Q on 2022/11/02.
//

import UIKit

final class BookDetailViewController: UIViewController {
    enum Section:CaseIterable {
        case main
        case info
    }
    
    var sections:[Section] = [.main, .info]
    
    private let tableView:UITableView = {
        let tableView = UITableView()
        tableView.register(BookTableViewCell.self, forCellReuseIdentifier: BookTableViewCell.identifier)
        tableView.register(BookDetailInfoTableViewCell.self, forCellReuseIdentifier: BookDetailInfoTableViewCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        return tableView
    }()

    
    let book:Book
    
    init(book:Book) {
        self.book = book
        super.init(nibName: nil, bundle: nil)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        configureView()
    }
    
    private func configureView() {
        view.backgroundColor = .black
        title = "도서 정보"
        
        tableView.dataSource = self
        tableView.delegate = self
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
}

extension BookDetailViewController:UITableViewDataSource {

     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return sections.count
    }

     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let section = sections[indexPath.row]
         switch section {
         case .main:
             guard let cell = tableView.dequeueReusableCell(withIdentifier: BookTableViewCell.identifier, for: indexPath) as? BookTableViewCell else {
                 return UITableViewCell()
             }
             cell.configure(book, type: .detailMain)
             return cell
         case .info:
             guard let cell = tableView.dequeueReusableCell(withIdentifier: BookDetailInfoTableViewCell.identifier, for: indexPath) as? BookDetailInfoTableViewCell else {
                 return UITableViewCell()
             }
             cell.configure(book)
             return cell
         }
    }
}

extension BookDetailViewController:UITableViewDelegate {}
