//
//  ChatViewController.swift
//  
//
//  Created by cord7894 on 2017. 7. 13..
//
// 일단 방에 들어오고 닉네임 요청
// 방 조인하고 그 방에 클라이언트아이디(닉네임?) 넣고 흠... 서버쪽...
// 대화기능 채팅컨트롤러에 사람 명수? 흠...
// 룸 이름 옆에 명수 출력

import UIKit

class ChatViewController: UIViewController {
    var mainStroyboard:UIStoryboard? = nil
    
    var users = [[String: AnyObject]]()
    
    var roomTitle:String?
    
    var nickname: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        mainStroyboard = self.storyboard!
        // Do any additional setup after loading the view.
        if roomTitle != nil {
            self.title = roomTitle!
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if nickname == nil {
            askForNickname()
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}
