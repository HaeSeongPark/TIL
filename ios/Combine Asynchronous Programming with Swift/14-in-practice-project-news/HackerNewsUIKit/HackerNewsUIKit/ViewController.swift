//
//  ViewController.swift
//  HackerNewsUIKit
//
//  Created by rhino Q on 2023/02/01.
//

import UIKit
import Combine

enum Section {
    case main
}

typealias DataSource = UITableViewDiffableDataSource<Section, Story>
typealias Snapshot = NSDiffableDataSourceSnapshot<Section, Story>

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    
    private let api = API()
    private var subscriptions = [AnyCancellable]()

    
    private lazy var dataSource = {
        return DataSource(tableView: self.tableView) { tableView, indexPath, story in
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TempCell
            cell.title.text = story.title
            cell.subtitle.text = "By \(story.by)"
            return cell
        }
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        api.stories()
            .receive(on: DispatchQueue.main)
            .catch { _ in Empty() }
            .sink(receiveValue: { [weak self] storys in
                var snapshot = Snapshot()
                snapshot.appendSections([.main])
                snapshot.appendItems(storys)
                self?.dataSource.apply(snapshot, animatingDifferences: false)
            })
            .store(in: &subscriptions)
    }
}
