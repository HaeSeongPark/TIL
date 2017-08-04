//
//  ChatViewController.swift
//  
//
//  Created by cord7894 on 2017. 7. 13..
// 기본에 닉네임 있었으면 묻지 않기도...
// 채팅 클라이어튼쪽 유아이 로직 과 서버쪽 로직 다 수정해서 완성하기 채팅 되게끔


// 방나가기 만들기
// db...채팅방에 유저목록을 어떻게 하죵?
// 채팅방 갱신되는 것 뭔가 이상한데...?
//-------
// 수정한 것 
// 조인배너 나를 제외한 방사람들에게만
// 챗 커스텀으로
// 타이핑 나오는 것과 없어지는 것 확인
// 서버 방에 있는 사람에게만 채팅보내도록 변경

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
    
    var bannerLabelTimer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainStroyboard = self.storyboard!
        // Do any additional setup after loading the view.
        if roomTitle != nil {
            self.title = roomTitle!
        }
        NotificationCenter.default.addObserver(self, selector: #selector(ChatViewController.handleKeyboardDidShowNotification(_:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ChatViewController.handleKeyboardDidHideNotification(_:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        let swipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(ChatViewController.dismissKeyboard))
        swipeGestureRecognizer.direction = UISwipeGestureRecognizerDirection.down
        swipeGestureRecognizer.delegate = self
        view.addGestureRecognizer(swipeGestureRecognizer)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.handleConnectedUserUpdateNotification), name: Notification.Name("userWasConnectedNotification"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.handleDisconnectedUserUpdateNotification), name: Notification.Name("userWasDisconnectedNotification"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.handleUserTypingNotification), name: Notification.Name("userTypingNotification"), object: nil)
}
    
    func handleUserTypingNotification(notification: NSNotification) {
        if let typingUsersDictionary = notification.object as? [String: AnyObject] {
            var names = ""
            var totalTypingUsers = 0
            for (typingUser, _) in typingUsersDictionary {
                if typingUser != nickname {
                    names = (names == "") ? typingUser : "\(names), \(typingUser)"
                    totalTypingUsers += 1
                }
            }
            
            if totalTypingUsers > 0 {
                let verb = (totalTypingUsers == 1) ? "is" : "are"
                
                lblOtherUserActivityStatus.text = "\(names) \(verb) now typing a message..."
                lblOtherUserActivityStatus.isHidden = false
            }
            else {
                lblOtherUserActivityStatus.isHidden = true
            }
        }
        
    }
    
    func handleDisconnectedUserUpdateNotification(notification: NSNotification) {
        let disconnectedUserNickname = notification.object as! String
        lblNewsBanner.text = "User \(disconnectedUserNickname.uppercased()) has left."
        showBannerLabelAnimated()
    }
    
    func handleConnectedUserUpdateNotification(notification: Notification) {
        let connectedUserInfo = notification.object as! [String: AnyObject]
        let connectedUserNickname = connectedUserInfo["nickname"] as? String
        lblNewsBanner.text = "User \(connectedUserNickname!.uppercased()) was just connected."
        showBannerLabelAnimated()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        configureTableView()
        configureNewsBannerLabel()
        configureOtherUserActivityLabel()
        
        tvMessageEditor.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if nickname == nil {
            askForNickname()
        }
        
        SocketIoManager.sharedInstance.getChatMessage { (messageInfo) -> Void in
            DispatchQueue.main.async(execute: { () -> Void in
                self.chatMessages.append(messageInfo)
                self.tblChat.reloadData()
                //self.scrollToBottom()
            })
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    
    // MARK: IBAction Methods
    
    @IBAction func sendMessage(_ sender: AnyObject) {
        if tvMessageEditor.text.characters.count > 0 {
            SocketIoManager.sharedInstance.sendMessage(message: tvMessageEditor.text, withNickName: nickname, withRoomTitle: self.title!)
            tvMessageEditor.text = ""
            tvMessageEditor.resignFirstResponder()
            SocketIoManager.sharedInstance.sendStopTypingMessage(nickname: nickname, roomName: self.title!)
        }
    }
    
    @IBAction func goTologinView(_ sender: UIBarButtonItem) {
        let LoginView = mainStroyboard?.instantiateViewController(withIdentifier: "LoginView")
        present(LoginView!, animated: true, completion: nil)
    }
    
    // MARK: Custom Methods
    
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
    
    func configureTableView() {
        tblChat.delegate = self
        tblChat.dataSource = self
        tblChat.register(UINib(nibName: "ChatCell", bundle: nil), forCellReuseIdentifier: "idCellChat")
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
    
    func scrollToBottom() {
        let delay = 0.1 * Double(NSEC_PER_SEC)
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(Int64(delay)) / Double(NSEC_PER_SEC)) { () -> Void in
            if self.chatMessages.count > 0 {
                let lastRowIndexPath = IndexPath(row: self.chatMessages.count - 1, section: 0)
                self.tblChat.scrollToRow(at: lastRowIndexPath, at: UITableViewScrollPosition.bottom, animated: true)
            }
        }
    }
    
    
    func showBannerLabelAnimated() {
        UIView.animate(withDuration: 0.75, animations: { () -> Void in
            self.lblNewsBanner.alpha = 1.0
            
        }, completion: { (finished) -> Void in
            self.bannerLabelTimer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(ChatViewController.hideBannerLabel), userInfo: nil, repeats: false)
        })
    }
    
    
    func hideBannerLabel() {
        if bannerLabelTimer != nil {
            bannerLabelTimer.invalidate()
            bannerLabelTimer = nil
        }
        
        UIView.animate(withDuration: 0.75, animations: { () -> Void in
            self.lblNewsBanner.alpha = 0.0
            
        }, completion: { (finished) -> Void in
        })
    }
    
    
    
    func dismissKeyboard() {
        if tvMessageEditor.isFirstResponder {
            tvMessageEditor.resignFirstResponder()
//            SocketIoManager.sharedInstance.sendStopTypingMessage(nickname: nickname, roomName: self.title!)
        }
    }
    
    
    // MARK: UITableView Delegate and Datasource Methods
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatMessages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "idCellChat", for: indexPath) as! ChatCell
        let currentChatMessage = chatMessages[indexPath.row]
        let senderNickname = currentChatMessage["nickname"] as! String
        let message = currentChatMessage["message"] as! String
        let messageDate = currentChatMessage["date"] as! String
        
        if senderNickname == nickname {
            cell.lblChatMessage.textAlignment = .right
            cell.lblMessageDetails.textAlignment = .right
            
            cell.lblChatMessage.textColor = lblNewsBanner.backgroundColor
        }
        
        cell.lblChatMessage.text = message
        cell.lblMessageDetails.text = "by \(senderNickname.uppercased()) @ \(messageDate)"
        
        cell.lblChatMessage.textColor = UIColor.darkGray
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
    
    // MARK: UITextViewDelegate Methods
    
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        SocketIoManager.sharedInstance.sendStartTypingMessage(nickname: nickname, roomName: self.title!)
        return true
    }
    
    
    // MARK: UIGestureRecognizerDelegate Methods
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
