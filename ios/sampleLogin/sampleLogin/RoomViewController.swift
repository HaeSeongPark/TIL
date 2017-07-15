//
//  RoomViewController.swift
//  sampleLogin
//
//  Created by cord7894 on 2017. 7. 13..
//  Copyright © 2017년 rhino. All rights reserved.
//

import UIKit

class RoomViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    var RoomName:[String]?
    var mainStroyboard:UIStoryboard? = nil
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var roomTitleLable: UITextField!
    
    @IBOutlet weak var mainViewBottomConstraint: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        mainStroyboard = self.storyboard!
        
        NotificationCenter.default.addObserver(self, selector: #selector(RoomViewController.keyboardWillShow(notification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(RoomViewController.keyboardWillHide(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    func keyboardWillShow(notification: NSNotification) {
        print("keybordWillShow")
        if let userInfoDict = notification.userInfo, let keyboardFrameValue = userInfoDict[UIKeyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardFrame = keyboardFrameValue.cgRectValue
            
            //The view will scroll up only for the following textfield
            UIView.animate(withDuration: 0.8) {
                self.mainViewBottomConstraint.constant = keyboardFrame.size.height
                self.view.layoutIfNeeded()
            }
        }
    }
    
    func keyboardWillHide(notification: NSNotification) {
        print("ketboardWillHide")
        UIView.animate(withDuration: 0.8) {
            self.mainViewBottomConstraint.constant = 0
            self.view.layoutIfNeeded()
        }
    }
    
    @IBAction func addRoom(_ sender: UIButton) {
        guard let roomName = roomTitleLable.text else{
            return
        }
        if (self.RoomName?.append(roomName)) == nil {
            self.RoomName = [roomName]
        }
        self.tableView.reloadData()
        roomTitleLable.text = ""
    }
    
    @IBAction func goTologinView(_ sender: UIBarButtonItem) {
        let LoginView = mainStroyboard?.instantiateViewController(withIdentifier: "LoginView")
        present(LoginView!, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let rowCount = RoomName?.count else {
            return 0
        }
        return rowCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RoomCell", for: indexPath)
        
        // Configure the cell...
        guard let room = RoomName?[indexPath.row] else {
            return cell
        }
        cell.textLabel?.text = room
        return cell
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "ChatSegue"{
            guard let destination = segue.destination as? ChatViewController, let selectedIndex = self.tableView.indexPathForSelectedRow?.row, let roomTitle = RoomName?[selectedIndex] else {
                return
            }
            destination.title = roomTitle
        }
    }
    
    
}
