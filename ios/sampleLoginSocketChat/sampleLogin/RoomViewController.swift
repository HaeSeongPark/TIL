//
//  RoomViewController.swift
//  sampleLogin
//
//  Created by cord7894 on 2017. 7. 13..
//  Copyright © 2017년 rhino. All rights reserved.
//
// 방삭제 기능은 어떻게 해야하지? 만든사람만 삭제 가능하게? 흠...

import UIKit

class RoomViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    var roomsUsers = [String: AnyObject]()
    var rooms = [String]()
    var users = [Int]()
    var mainStroyboard:UIStoryboard? = nil
    var delay = 1000
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var roomTitleLable: UITextField!
    @IBOutlet weak var mainViewBottomConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainStroyboard = self.storyboard!
        
        NotificationCenter.default.addObserver(self, selector: #selector(RoomViewController.keyboardWillShow(notification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(RoomViewController.keyboardWillHide(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.handleSendRoomListNotification), name: Notification.Name("replyRoomListResetNotification"), object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let time = DispatchTime.now() + .milliseconds(delay)
        DispatchQueue.main.asyncAfter(deadline: time){
            SocketIoManager.sharedInstance.askRoomListReset()
            self.delay = 1
        }
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
    
    func handleSendRoomListNotification(notification: NSNotification) {
        roomsUsers = notification.object as! [String:AnyObject]
        self.rooms = roomsUsers["rooms"] as! [String]
        self.users = roomsUsers["users"] as! [Int]
        self.tableView.reloadData()
    }
    
    func keyboardWillHide(notification: NSNotification) {
        print("ketboardWillHide")
        UIView.animate(withDuration: 0.8) {
            self.mainViewBottomConstraint.constant = 0
            self.view.layoutIfNeeded()
        }
    }

    func foundRommWarningAlert() {

        let alertController = UIAlertController(title: "방이름 중복", message: "입력하신 이름의 방이 이미 있습니다.", preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: {(action:UIAlertAction)->Void in
           alertController.dismiss(animated: true, completion: nil)
        })
        alertController.addAction(OKAction)
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func addRoom(_ sender: UIButton) {
        guard let roomName = roomTitleLable.text else{
            return
        }
        
        var foundRoom = false
        
        for room in rooms
        {
            if room == roomName
            {
                foundRoom = true
                break
            }
        }
        
        if foundRoom == true {
            foundRommWarningAlert()
        } else
        {
            SocketIoManager.sharedInstance.connectToServerWithRoomname(roomName, completionHandler: {(roomList) -> Void in
                DispatchQueue.main.async(execute:
                    { () -> Void in
                        if roomList != nil
                        {
                            self.rooms = roomList!["rooms"] as! [String]
                            self.users = roomList!["users"] as! [Int]
                            self.tableView.reloadData()
                        }
                })
            })
        }
        roomTitleLable.text = ""
    }
    
    @IBAction func goTologinView(_ sender: UIBarButtonItem) {
        let LoginView = mainStroyboard?.instantiateViewController(withIdentifier: "LoginView")
        present(LoginView!, animated: true, completion: nil)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return rooms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RoomCell", for: indexPath)
        cell.textLabel?.text = rooms[indexPath.row]
        cell.detailTextLabel?.text = String(users[indexPath.row]) + " 명"
        return cell
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "ChatSegue"{
            guard let destination = segue.destination as? ChatViewController, let selectedIndex = self.tableView.indexPathForSelectedRow?.row else {
                return
            }
            let roomTitle = rooms[selectedIndex]
            destination.title = roomTitle
        }
    }
}
