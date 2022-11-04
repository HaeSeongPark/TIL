//
//  MainTableViewController.swift
//  ReactorKitTest
//
//  Created by rhino Q on 2022/11/02.
//

import UIKit

class MainTableViewController: UITableViewController {
    enum Samples:String,CaseIterable {
        case Fruits
        case Playbook
        
        var description:String {
            switch self {
            case .Fruits:
                return "간단 ReactorKit 예제"
            case .Playbook:
                return "google book api를 활용한 예제"
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Samples.allCases.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell:UITableViewCell!
        
        cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
        
        let sample = Samples.allCases[indexPath.row]
        cell.textLabel?.text = "\(sample.rawValue) | \(sample.description)"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sample = Samples.allCases[indexPath.row]
        switch sample {
        case .Fruits:
            let fruitsVC = FruitsViewController()
            fruitsVC.reactor = FruitsReactor()
            navigationController?.pushViewController(fruitsVC, animated: true)
        case .Playbook:
//            let searchBookVC = SearchTableViewController()
//            navigationController?.pushViewController(searchBookVC, animated: true)
            let vc = ReactorSearchTableViewController()
            vc.reactor = SearchReactor()
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
