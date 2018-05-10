//
//  ExtraInfoViewController.swift
//  SignUp
//
//  Created by rhino Q on 2018. 5. 10..
//  Copyright © 2018년 rhino Q. All rights reserved.
//

import UIKit

class ExtraInfoViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak var userNumberTf: UITextField!
    @IBOutlet weak var userBirthDayLbl: UILabel!
    @IBOutlet weak var datePickeer: UIDatePicker!
    @IBOutlet weak var joinBtn: UIButton!
    
    // MARK: - custom variables
    let dateFormatter: DateFormatter = {
        let formatter: DateFormatter = DateFormatter()
        formatter.dateFormat = "MMMM dd, YYYY"
        return formatter
    }()
    
    // MARK: - IBActions
    @IBAction func didDatePickerValueChanged(_ sender: UIDatePicker) {
        setBirthDay()
        checkinformationsFilled()
    }
    
    @IBAction func tapBeforeBtn(_ sender: UIButton) {
        saveInfo()
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tapView(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
        checkinformationsFilled()
    }
    
    @IBAction func joinBtn(_ sender: UIButton) {
        saveInfo()
    }
    
    @IBAction func cancleBtn(_ sender: UIButton) {
        UserInfomation.shared.birthday = nil
        UserInfomation.shared.id = nil
        UserInfomation.shared.password = nil
        UserInfomation.shared.phoneNumber = nil
    }
    
    // MARK: - LifeCycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setBirthDay()
    }
    
    // MARK: - custom funtions
    func saveInfo() {
        if userNumberTf.text != nil && userBirthDayLbl.text != nil {
            UserInfomation.shared.phoneNumber = userNumberTf.text
            UserInfomation.shared.birthday = userBirthDayLbl.text
        }
    }
    
    func setBirthDay() {
        let date = self.datePickeer.date
        let dateString = self.dateFormatter.string(from: date)
        self.userBirthDayLbl.text = dateString
    }
    
    func checkinformationsFilled(){
        let isPhoneNumberFilled = userNumberTf.text != nil
        let isBirtDayFilled = userBirthDayLbl.text != nil
        
        if isPhoneNumberFilled && isBirtDayFilled {
            joinBtn.isEnabled = true
        }
    }
}
