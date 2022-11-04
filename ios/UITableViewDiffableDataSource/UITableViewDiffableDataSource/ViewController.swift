//
//  ViewController.swift
//  UITableViewDiffableDataSource
//
//  Created by rhino Q on 2022/11/04.
// https://ios-development.tistory.com/717

import UIKit

class ViewController: UIViewController {
    var dataSource: UITableViewDiffableDataSource<Int, UUID>!

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        dataSource = UITableViewDiffableDataSource<Int, UUID>(tableView: tableView, cellProvider: { tableView, indexPath, itemIdentifier in
            print("indexPath: \(indexPath)")
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.text = "\(indexPath.row) 번째"
            return cell
        })
        
        tableView.dataSource = dataSource
        
        var snapShot  = NSDiffableDataSourceSnapshot<Int,UUID>()
        snapShot.appendSections([0])
        dataSource.apply(snapShot)
        
    }
    
    @IBAction func didTapAppendButton(_ sender: Any) {
        var snapshot = dataSource.snapshot()

        snapshot.appendItems([UUID()])
        dataSource.apply(snapshot,animatingDifferences: false)
    }
    
    @IBAction func didTapInsertButton(_ sender: Any) {
        var snapshot = dataSource.snapshot()

        if let first = snapshot.itemIdentifiers.first {
            snapshot.insertItems([UUID()], beforeItem: first)
        }

//        snapshot.reloadSections([0])
        dataSource.apply(snapshot,animatingDifferences: false) { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
    @IBAction func didTapDeleteButton(_ sender: Any) {
        var snapshot = dataSource.snapshot()

        if let lastItem = snapshot.itemIdentifiers.last {
            snapshot.deleteItems([lastItem])
        }
        dataSource.apply(snapshot)
    }
}

