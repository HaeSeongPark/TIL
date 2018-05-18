//
//  ViewController.swift
//  networking
//
//  Created by rhino Q on 2018. 5. 16..
//  Copyright © 2018년 rhino Q. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    let cellIdntifier = "friendCell"
    var friends: [Friend] = []
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdntifier, for: indexPath)
        
        let friend = self.friends[indexPath.row]
        
        cell.textLabel?.text = friend.name.full
        cell.detailTextLabel?.text = friend.email
//        cell.imageView?.image = nil
        cell.imageView?.image = UIImage(named: "sampleImage")
        
        //background
        DispatchQueue.global().async {
            guard let imageURL = URL(string: friend.picture.thumbnail) else { return  }
            guard let imageData = try? Data(contentsOf: imageURL) else { return  }
            
            DispatchQueue.main.async {
                if let index = tableView.indexPath(for: cell) {
                    if index.row == indexPath.row {
                        cell.imageView?.image = UIImage(data: imageData)
                    }
                }
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    @objc func didRecieveFriendsNotification(_ noti: Notification) {
        guard let friends:[Friend] = noti.userInfo?["friends"] as? [Friend] else { return }
        
        self.friends = friends
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(self.didRecieveFriendsNotification(_:)), name: DidReceiveFriendsNotification, object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        requestFriends()
    }
}

