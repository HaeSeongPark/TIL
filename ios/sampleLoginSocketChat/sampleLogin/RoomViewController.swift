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
    var Rooms = [[String: AnyObject]]()
    
    var mainStroyboard:UIStoryboard? = nil
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var roomTitleLable: UITextField!
    @IBOutlet weak var mainViewBottomConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainStroyboard = self.storyboard!
        
        NotificationCenter.default.addObserver(self, selector: #selector(RoomViewController.keyboardWillShow(notification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(RoomViewController.keyboardWillHide(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.handleSendRoomListNotification), name: Notification.Name("sendRoomListNotification"), object: nil)
        
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
        self.Rooms = notification.object as! [[String : AnyObject]]
        for room in Rooms{
            print(room)
        }
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
        
        for room in Rooms{
            if room["roomName"] as! String == roomName
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
                            self.Rooms = roomList!
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Rooms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RoomCell", for: indexPath)
        
        // Configure the cell...
        cell.textLabel?.text = Rooms[indexPath.row]["roomName"] as? String
        return cell
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "ChatSegue"{
            guard let destination = segue.destination as? ChatViewController, let selectedIndex = self.tableView.indexPathForSelectedRow?.row, let roomTitle = Rooms[selectedIndex]["roomName"] as? String else {
                return
            }
            destination.title = roomTitle
        }
    }
}
