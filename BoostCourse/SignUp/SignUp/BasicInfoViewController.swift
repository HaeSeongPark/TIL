//
//  BasicInfoViewController.swift
//  SignUp
//
//  Created by rhino Q on 2018. 5. 10..
//  Copyright © 2018년 rhino Q. All rights reserved.
//

import UIKit

class BasicInfoViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // MARK: - custom variables
    lazy var imagePicker: UIImagePickerController = {
        let picker: UIImagePickerController = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        return picker
    }()
    
    
    // MARK: - IBOutlets
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var idLbl: UITextField!
    @IBOutlet weak var pwLbl: UITextField!
    @IBOutlet weak var checkPwLbl: UITextField!
    @IBOutlet weak var introduceLbl: UITextView!
    
    // MARK: - IBActions
    @IBAction func tapImageVIew(_ sender: UITapGestureRecognizer) {
        self.present(self.imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func cancle(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tapView(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
        checkAllInformationFilled()
    }
    @IBAction func nextBtn(_ sender: UIButton) {
        // 다음 버튼을 눌렀다는 것은 이미 유효처리가 완료됐다는 뜻이므로 !
        UserInfomation.shared.id = idLbl.text!
        UserInfomation.shared.password = pwLbl.text!
    }
    
    
    // MARK: - UIImagePickerControllerDelegate
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            self.userImage.image = selectedImage
        }
        self.dismiss(animated: true, completion: nil)
        checkAllInformationFilled()
    }
    
    // MARK: - custom funtions
    func checkAllInformationFilled() {
        let isImageFilled = userImage != nil
        let isIdLblFilled = idLbl.text != nil
        let isIntroduceLblIsFilled = introduceLbl.text.count > 0
        var isSamePwAndCheckPw = false
        if let pwText = pwLbl.text, let checkPwText = checkPwLbl.text {
           isSamePwAndCheckPw = pwText == checkPwText
        }
        
        if isImageFilled && isIdLblFilled && isIntroduceLblIsFilled && isSamePwAndCheckPw {
            nextBtn.isEnabled = true
        } else {
            nextBtn.isEnabled = false
        }
    }
}
