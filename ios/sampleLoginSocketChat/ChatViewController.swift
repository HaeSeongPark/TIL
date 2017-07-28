//
//  ChatViewController.swift
//  
//
//  Created by cord7894 on 2017. 7. 13..
//
// 일단 방에 들어오고 닉네임 요청
// 방 조인하고 그 방에 클라이언트아이디(닉네임?) 넣고 흠...

import UIKit

class ChatViewController: UIViewController {
    var mainStroyboard:UIStoryboard? = nil
    
    var roomTitle:String?

    override func viewDidLoad() {
        super.viewDidLoad()
        mainStroyboard = self.storyboard!
        // Do any additional setup after loading the view.
        if roomTitle != nil {
            self.title = roomTitle!
        }
    }

//    override func viewDidAppear(_ animated: Bool) {
//        <#code#>
//    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func goTologinView(_ sender: UIBarButtonItem) {
        let LoginView = mainStroyboard?.instantiateViewController(withIdentifier: "LoginView")
        present(LoginView!, animated: true, completion: nil)
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
