//
//  UIVieweController+Alert.swift
//  KidsNoteHomework
//
//  Created by rhino Q on 2022/11/02.
//

import UIKit

extension UIViewController {
     func simpleAlert(message:String) {
        let alertController = UIAlertController(title: "에러", message: message, preferredStyle:.alert)
         let cancelAction = UIAlertAction(title: "확인 ", style: UIAlertAction.Style.cancel, handler: nil)
         alertController.addAction(cancelAction)
        self.present(alertController, animated: false)
    }
}
