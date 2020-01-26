//
//  ViewController.swift
//  cocoa
//
//  Created by Varalakshmi Kacherla on 10/14/19.
//  Copyright © 2019 Varalakshmi Kacherla. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        create()
        // Do any additional setup after loading the view, typically from a nib.
    }
    func create()
    {
        let firstNameLbl = UILabel()
        firstNameLbl.frame = CGRect(x: 10, y: 100, width: 100, height: 40)
        firstNameLbl.backgroundColor = UIColor.white
        firstNameLbl.text = "FirstName"
        firstNameLbl.textColor = UIColor.black
        view.addSubview(firstNameLbl)
        
        let lastNameLbl = UILabel()
        lastNameLbl.frame = CGRect(x: 10, y: 170, width: 100, height: 40)
        lastNameLbl.backgroundColor = UIColor.white
        lastNameLbl.text = "LastName"
        lastNameLbl.textColor = UIColor.black
        view.addSubview(lastNameLbl)
        
        let dateOfBirthLbl = UILabel()
        dateOfBirthLbl.frame = CGRect(x: 10, y: 240, width: 100, height: 40)
        dateOfBirthLbl.backgroundColor = UIColor.white
        dateOfBirthLbl.text = "DateOfBirth"
        dateOfBirthLbl.textColor = UIColor.black
        view.addSubview(dateOfBirthLbl)
        
        let emailIDLbl = UILabel()
        emailIDLbl.frame = CGRect(x: 10, y: 310, width: 100, height: 40)
        emailIDLbl.backgroundColor = UIColor.white
        emailIDLbl.text = "EmailID"
        emailIDLbl.textColor = UIColor.black
        view.addSubview(emailIDLbl)
        
        let mobileNoLbl = UILabel()
        mobileNoLbl.frame = CGRect(x: 10, y: 380, width: 100, height: 40)
        mobileNoLbl.backgroundColor = UIColor.white
        mobileNoLbl.text = "MobileNo"
        mobileNoLbl.textColor = UIColor.black
        view.addSubview(mobileNoLbl)
        
        let addressLbl = UILabel()
        addressLbl.frame = CGRect(x: 10, y: 450, width: 100, height: 40)
        addressLbl.backgroundColor = UIColor.white
        addressLbl.text = "Address"
        addressLbl.textColor = UIColor.black
        view.addSubview(addressLbl)
        
        let stateLbl = UILabel()
        stateLbl.frame = CGRect(x: 10, y: 590, width: 100, height: 40)
        stateLbl.backgroundColor = UIColor.white
        stateLbl.text = "State"
        stateLbl.textColor = UIColor.black
        view.addSubview(stateLbl)
        
        let countryLbl = UILabel()
        countryLbl.frame = CGRect(x: 10, y: 660, width: 100, height: 40)
        countryLbl.backgroundColor = UIColor.white
        countryLbl.text = "Country"
        countryLbl.textColor = UIColor.black
        view.addSubview(countryLbl)
        
        
        let firstNameTextField = UITextField()
        firstNameTextField.frame = CGRect(x: 130, y: 100, width: 270, height: 40)
        firstNameTextField.backgroundColor = UIColor.white
        firstNameTextField.keyboardType = UIKeyboardType.alphabet
        firstNameTextField.placeholder = "FirstName"
        firstNameTextField.borderStyle = .roundedRect
        firstNameTextField.font = UIFont.systemFont(ofSize: 20)
        firstNameTextField.textAlignment = .center
        firstNameTextField.textColor = UIColor.black
        view.addSubview(firstNameTextField)
        
        let lastNameTextField = UITextField()
        lastNameTextField.frame = CGRect(x: 130, y: 170, width: 270, height: 40)
        lastNameTextField.backgroundColor = UIColor.white
        lastNameTextField.keyboardType = UIKeyboardType.alphabet
        lastNameTextField.placeholder = "LastName"
        lastNameTextField.borderStyle = .roundedRect
        lastNameTextField.font = UIFont.systemFont(ofSize: 20)
        lastNameTextField.textAlignment = .center
        lastNameTextField.textColor = UIColor.black
        view.addSubview(lastNameTextField)
        
        let dateOfBirthTextField = UITextField()
        dateOfBirthTextField.frame = CGRect(x: 130, y: 240, width: 270, height: 40)
        dateOfBirthTextField.backgroundColor = UIColor.white
        dateOfBirthTextField.keyboardType = UIKeyboardType.namePhonePad
        dateOfBirthTextField.placeholder = "DateOfBirth"
        dateOfBirthTextField.borderStyle = .roundedRect
        dateOfBirthTextField.font = UIFont.systemFont(ofSize: 20)
        dateOfBirthTextField.textAlignment = .center
        dateOfBirthTextField.textColor = UIColor.black
        view.addSubview(dateOfBirthTextField)
        
        let emailTextField = UITextField()
        emailTextField.frame = CGRect(x: 130, y: 310, width: 270, height: 40)
        emailTextField.backgroundColor = UIColor.white
        emailTextField.keyboardType = UIKeyboardType.emailAddress
        emailTextField.placeholder = "Email ID"
        emailTextField.borderStyle = .roundedRect
        emailTextField.font = UIFont.systemFont(ofSize: 20)
        emailTextField.textAlignment = .center
        emailTextField.textColor = UIColor.black
        view.addSubview(emailTextField)
        
        let mobileNoTextField = UITextField()
        mobileNoTextField.frame = CGRect(x: 130, y: 380, width: 270, height: 40)
        mobileNoTextField.backgroundColor = UIColor.white
        mobileNoTextField.keyboardType = UIKeyboardType.numberPad
        mobileNoTextField.placeholder = "Mobile No"
        mobileNoTextField.borderStyle = .roundedRect
        mobileNoTextField.font = UIFont.systemFont(ofSize: 20)
        mobileNoTextField.textAlignment = .center
        mobileNoTextField.textColor = UIColor.black
        view.addSubview(mobileNoTextField)
        
        let addressTextField = UITextView()
        addressTextField.frame = CGRect(x: 130, y: 450, width: 270, height: 100)
        addressTextField.backgroundColor = UIColor.white
        addressTextField.keyboardType = UIKeyboardType.asciiCapable
        view.addSubview(addressTextField)
        
        let stateTextField = UITextField()
        stateTextField.frame = CGRect(x: 130, y: 590, width: 270, height: 40)
        stateTextField.backgroundColor = UIColor.white
        stateTextField.keyboardType = UIKeyboardType.alphabet
        stateTextField.placeholder = "State"
        stateTextField.borderStyle = .roundedRect
        stateTextField.font = UIFont.systemFont(ofSize: 20)
        stateTextField.textAlignment = .center
        stateTextField.textColor = UIColor.black
        view.addSubview(stateTextField)
        
        let countryTextField = UITextField()
        countryTextField.frame = CGRect(x: 130, y: 660, width: 270, height: 40)
        countryTextField.backgroundColor = UIColor.white
        countryTextField.keyboardType = UIKeyboardType.alphabet
        countryTextField.placeholder = "Country"
        countryTextField.borderStyle = .roundedRect
        countryTextField.font = UIFont.systemFont(ofSize: 20)
        countryTextField.textAlignment = .center
        countryTextField.textColor = UIColor.black
        view.addSubview(countryTextField)
        
        let submit = UIButton()
        submit.frame = CGRect(x: 140, y: 750, width: 100, height: 40)
        submit.backgroundColor = UIColor.white
        submit.setTitle("Submit", for: UIControl.State.normal)
        submit.setTitleColor(UIColor.black, for: UIControl.State.normal)
//        submit.addTarget(self, action: #selector(buttonClick), for: UIControl.Event.touchUpInside)
        view.addSubview(submit)
        
    }

}

