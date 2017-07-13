//
//  ViewController.swift
//  sampleLogin
//
//  Created by cord7894 on 2017. 7. 2..
//  Copyright © 2017년 rhino. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class ViewController: UIViewController, FBSDKLoginButtonDelegate {
    var mainStroyboard:UIStoryboard? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.loginViewControler = self

        let loginButton = FBSDKLoginButton()
        loginButton.center = view.center
        view.addSubview(loginButton)
        loginButton.delegate = self
        
        mainStroyboard = self.storyboard!
        print("ViewController viewDidLoad")
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("Did log out of facebook")
    }
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        if error != nil {
            print(error)
            return
        }
        print("Successfully logged in with facebook!!")
        
        ViewChange()
    }
    
    func ViewChange(){
        if (FBSDKAccessToken.current()) != nil{
            let NC = mainStroyboard?.instantiateViewController(withIdentifier: "NC")
            present(NC!, animated: true, completion: nil)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

