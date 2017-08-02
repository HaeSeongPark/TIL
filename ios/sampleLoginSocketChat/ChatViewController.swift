//
//  ChatViewController.swift
//  
//
//  Created by cord7894 on 2017. 7. 13..
//
// 채팅 클라이어튼쪽 유아이 로직 과 서버쪽 로직 다 수정해서 완성하기 채팅 되게끔
//

import UIKit

class ChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextViewDelegate, UIGestureRecognizerDelegate {
    var mainStroyboard:UIStoryboard? = nil
    
    var users = [[String: AnyObject]]()
    
    var roomTitle:String?
    
    var nickname: String!
    
    var chatMessages = [[String: AnyObject]]()
    
    @IBOutlet weak var conBottomEditor: NSLayoutConstraint!
    
    @IBOutlet weak var tblChat: UITableView!
    
    @IBOutlet weak var lblOtherUserActivityStatus: UILabel!
    
    @IBOutlet weak var lblNewsBanner: UILabel!
    
    @IBOutlet weak var tvMessageEditor: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainStroyboard = self.storyboard!
        // Do any additional setup after loading the view.
        if roomTitle != nil {
            self.title = roomTitle!
        }
        NotificationCenter.default.addObserver(self, selector: #selector(ChatViewController.handleKeyboardDidShowNotification(_:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ChatViewController.handleKeyboardDidHideNotification(_:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
}
    
    override func viewWillAppear(_ animated: Bool) {
        configureTableView()
        configureNewsBannerLabel()
        configureOtherUserActivityLabel()
        
        tvMessageEditor.delegate = self
    }
    
    // MARK: Custom Methods
    
    func configureTableView() {
        tblChat.delegate = self
        tblChat.dataSource = self
//        tblChat.register(UINib(nibName: "ChatCell", bundle: nil), forCellReuseIdentifier: "idCellChat")
        tblChat.estimatedRowHeight = 90.0
        tblChat.rowHeight = UITableViewAutomaticDimension
        tblChat.tableFooterView = UIView(frame: CGRect.zero)
    }
    
    
    func configureNewsBannerLabel() {
        lblNewsBanner.layer.cornerRadius = 15.0
        lblNewsBanner.clipsToBounds = true
        lblNewsBanner.alpha = 0.0
    }
    
    
    func configureOtherUserActivityLabel() {
        lblOtherUserActivityStatus.isHidden = true
        lblOtherUserActivityStatus.text = ""
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if nickname == nil {
            askForNickname()
        }
    }
    
    func handleKeyboardDidShowNotification(_ notification: Notification) {
        if let userInfo = notification.userInfo {
            if let keyboardFrame = (userInfo[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
                UIView.animate(withDuration: 0.8) {
                    self.conBottomEditor.constant = keyboardFrame.size.height + 20
                    self.view.layoutIfNeeded()
                }
            }
        }
    }
    
    func handleKeyboardDidHideNotification(_ notification: Notification) {
        conBottomEditor.constant = 0
        view.layoutIfNeeded()
    }
    
    @IBAction func goTologinView(_ sender: UIBarButtonItem) {
        let LoginView = mainStroyboard?.instantiateViewController(withIdentifier: "LoginView")
        present(LoginView!, animated: true, completion: nil)
    }
    
    func askForNickname(){
        let alertController = UIAlertController(title: "SocketChat", message: "Enter your nickname", preferredStyle: .alert)
        
        alertController.addTextField(configurationHandler: nil)
        
        let OKAction = UIAlertAction(title: "OK", style: .default){(action) -> Void in
            let textfield = alertController.textFields![0]
            if textfield.text?.characters.count == 0 {
                self.askForNickname()
            }
            else {
                self.nickname = textfield.text
                
                SocketIoManager.sharedInstance.connectToServerWithNickname(self.nickname, self.title!, completionHandler: {(userList) -> Void in
                    DispatchQueue.main.async(execute:
                        {  () -> Void in
                            if userList != nil
                            {
                                self.users = userList!
//                                self.tblUserList.reloadData()
//                                self.tblUserList.isHidden = false
                            }
                    })
                })//SocketIOMa~
            } // else
        } // end
        
        alertController.addAction(OKAction)
        present(alertController, animated: true, completion: nil)
    }
    // MARK: UITableView Delegate and Datasource Methods
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatMessages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChatCell", for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}
