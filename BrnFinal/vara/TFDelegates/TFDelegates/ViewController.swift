//
//  ViewController.swift
//  TFDelegates
//
//  Created by Varalakshmi Kacherla on 10/16/19.
//  Copyright © 2019 Varalakshmi Kacherla. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate, UITextViewDelegate {
    var firstNameLbl:UILabel!
    var lastNameLbl:UILabel!
    var ageLbl:UILabel!
    var emailIDLbl:UILabel!
    var mobileNoLbl:UILabel!
    var addressLbl:UILabel!
    var stateLbl:UILabel!
    var countryLbl:UILabel!
    var firstNameTextField:UITextField!
    var lastNameTextField:UITextField!
    var ageTextField:UITextField!
    var emailTextField:UITextField!
    var mobileNoTextField:UITextField!
    var addressTextView:UITextView!
    var stateTextField:UITextField!
    var countryTextField:UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        create()
        // Do any additional setup after loading the view, typically from a nib.
    }
   
    func create()
    {
        firstNameLbl = UILabel()
        firstNameLbl.frame = CGRect(x: 10, y: 100, width: 100, height: 40)
        firstNameLbl.backgroundColor = UIColor.white
        firstNameLbl.text = "FirstName"
        firstNameLbl.textColor = UIColor.black
        view.addSubview(firstNameLbl)
        
        lastNameLbl = UILabel()
        lastNameLbl.frame = CGRect(x: 10, y: 170, width: 100, height: 40)
        lastNameLbl.backgroundColor = UIColor.white
        lastNameLbl.text = "LastName"
        lastNameLbl.textColor = UIColor.black
        view.addSubview(lastNameLbl)
        
        ageLbl = UILabel()
        ageLbl.frame = CGRect(x: 10, y: 240, width: 100, height: 40)
        ageLbl.backgroundColor = UIColor.white
        ageLbl.text = "Age"
        ageLbl.textColor = UIColor.black
        view.addSubview(ageLbl)
        
         emailIDLbl = UILabel()
        emailIDLbl.frame = CGRect(x: 10, y: 310, width: 100, height: 40)
        emailIDLbl.backgroundColor = UIColor.white
        emailIDLbl.text = "EmailID"
        emailIDLbl.textColor = UIColor.black
        view.addSubview(emailIDLbl)
        
         mobileNoLbl = UILabel()
        mobileNoLbl.frame = CGRect(x: 10, y: 380, width: 100, height: 40)
        mobileNoLbl.backgroundColor = UIColor.white
        mobileNoLbl.text = "MobileNo"
        mobileNoLbl.textColor = UIColor.black
        view.addSubview(mobileNoLbl)
        
         addressLbl = UILabel()
        addressLbl.frame = CGRect(x: 10, y: 450, width: 100, height: 40)
        addressLbl.backgroundColor = UIColor.white
        addressLbl.text = "Address"
        addressLbl.textColor = UIColor.black
        view.addSubview(addressLbl)
        
         stateLbl = UILabel()
        stateLbl.frame = CGRect(x: 10, y: 590, width: 100, height: 40)
        stateLbl.backgroundColor = UIColor.white
        stateLbl.text = "State"
        stateLbl.textColor = UIColor.black
        view.addSubview(stateLbl)
        
         countryLbl = UILabel()
        countryLbl.frame = CGRect(x: 10, y: 660, width: 100, height: 40)
        countryLbl.backgroundColor = UIColor.white
        countryLbl.text = "Country"
        countryLbl.textColor = UIColor.black
        view.addSubview(countryLbl)
        
    // Creating TextFields
        
         firstNameTextField = UITextField()
        firstNameTextField.delegate = self
        firstNameTextField.frame = CGRect(x: 130, y: 100, width: 270, height: 40)
        firstNameTextField.backgroundColor = UIColor.white
        firstNameTextField.keyboardType = UIKeyboardType.alphabet
        firstNameTextField.placeholder = "FirstName"
        firstNameTextField.borderStyle = .roundedRect
        firstNameTextField.font = UIFont.systemFont(ofSize: 20)
        firstNameTextField.textAlignment = .center
        firstNameTextField.textColor = UIColor.black
        let firstNameImage = UIImage(named: "Name")
        addImage(textField: firstNameTextField, image: firstNameImage!)
        view.addSubview(firstNameTextField)
        
         lastNameTextField = UITextField()
        lastNameTextField.delegate = self
        lastNameTextField.frame = CGRect(x: 130, y: 170, width: 270, height: 40)
        lastNameTextField.backgroundColor = UIColor.white
        lastNameTextField.keyboardType = UIKeyboardType.alphabet
        lastNameTextField.placeholder = "LastName"
        lastNameTextField.borderStyle = .roundedRect
        lastNameTextField.font = UIFont.systemFont(ofSize: 20)
        lastNameTextField.textAlignment = .center
        lastNameTextField.textColor = UIColor.black
        let lastNameImage = UIImage(named: "Name")
        addImage(textField: lastNameTextField, image: lastNameImage!)
        view.addSubview(lastNameTextField)
        
         ageTextField = UITextField()
        ageTextField.delegate = self
        ageTextField.frame = CGRect(x: 130, y: 240, width: 270, height: 40)
        ageTextField.backgroundColor = UIColor.white
        ageTextField.keyboardType = UIKeyboardType.numberPad
        ageTextField.placeholder = "Age"
        ageTextField.borderStyle = .roundedRect
        ageTextField.font = UIFont.systemFont(ofSize: 20)
        ageTextField.textAlignment = .center
        ageTextField.textColor = UIColor.black
        let ageImage = UIImage(named: "Calender")
        addImage(textField: ageTextField, image: ageImage!)
        view.addSubview(ageTextField)
        
         emailTextField = UITextField()
        emailTextField.delegate = self
        emailTextField.frame = CGRect(x: 130, y: 310, width: 270, height: 40)
        emailTextField.backgroundColor = UIColor.white
        emailTextField.keyboardType = UIKeyboardType.emailAddress
        emailTextField.placeholder = "Email ID"
        emailTextField.borderStyle = .roundedRect
        emailTextField.font = UIFont.systemFont(ofSize: 20)
        emailTextField.textAlignment = .center
        emailTextField.textColor = UIColor.black
        let emailImage = UIImage(named: "Email")
        addImage(textField: emailTextField, image: emailImage!)
        view.addSubview(emailTextField)
        
         mobileNoTextField = UITextField()
        mobileNoTextField.delegate = self
        mobileNoTextField.frame = CGRect(x: 130, y: 380, width: 270, height: 40)
        mobileNoTextField.backgroundColor = UIColor.white
        mobileNoTextField.keyboardType = UIKeyboardType.numberPad
        mobileNoTextField.placeholder = "Mobile No"
        mobileNoTextField.borderStyle = .roundedRect
        mobileNoTextField.font = UIFont.systemFont(ofSize: 20)
        mobileNoTextField.textAlignment = .center
        mobileNoTextField.textColor = UIColor.black
        let mobileImage = UIImage(named: "Mobile")
        addImage(textField: mobileNoTextField, image: mobileImage!)
        view.addSubview(mobileNoTextField)
        
         addressTextView = UITextView()
        addressTextView.delegate = self
        addressTextView.frame = CGRect(x: 130, y: 450, width: 270, height: 100)
        addressTextView.backgroundColor = UIColor.white
        addressTextView.font = UIFont.systemFont(ofSize: 20)
        addressTextView.keyboardType = UIKeyboardType.asciiCapable
        view.addSubview(addressTextView)
        
         stateTextField = UITextField()
        stateTextField.delegate = self
        stateTextField.frame = CGRect(x: 130, y: 590, width: 270, height: 40)
        stateTextField.backgroundColor = UIColor.white
        stateTextField.keyboardType = UIKeyboardType.alphabet
        stateTextField.placeholder = "State"
        stateTextField.borderStyle = .roundedRect
        stateTextField.font = UIFont.systemFont(ofSize: 20)
        stateTextField.textAlignment = .center
        stateTextField.textColor = UIColor.black
        let stateImage = UIImage(named: "State")
        addImage(textField: stateTextField, image: stateImage!)
        view.addSubview(stateTextField)
        
         countryTextField = UITextField()
        countryTextField.delegate = self
        countryTextField.frame = CGRect(x: 130, y: 660, width: 270, height: 40)
        countryTextField.backgroundColor = UIColor.white
        countryTextField.keyboardType = UIKeyboardType.alphabet
        countryTextField.placeholder = "Country"
        countryTextField.borderStyle = .roundedRect
        countryTextField.font = UIFont.systemFont(ofSize: 20)
        countryTextField.textAlignment = .center
        countryTextField.textColor = UIColor.black
        let countryImage = UIImage(named: "Country")
        addImage(textField: countryTextField, image: countryImage!)
        view.addSubview(countryTextField)
        
        let submit = UIButton()
        submit.frame = CGRect(x: 140, y: 750, width: 100, height: 40)
        submit.backgroundColor = UIColor.white
        submit.setTitle("Submit", for: UIControl.State.normal)
        submit.setTitleColor(UIColor.black, for: UIControl.State.normal)
        submit.addTarget(self, action: #selector(buttonClick), for: UIControl.Event.touchUpInside)
        view.addSubview(submit)
        
    }
    // creating function for images
    
    func addImage(textField:UITextField,image:UIImage)
    {
        let imageView = UIImageView(frame: CGRect(x: 10, y: 0, width: 30, height: 30))
        imageView.image = image
        textField.leftViewMode = .always
        textField.leftView = imageView
        

}
    @objc func buttonClick()
    {
        print("Submit")
    }
   
    var returnValue:Bool = false
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        if(textField == firstNameTextField){
            returnValue = true
        }
        
        else if(textField == lastNameTextField){
            if(firstNameTextField.text!.count > 2)
            {
                returnValue = true
            }else {
                returnValue = false
            }
        }
            else if(textField == ageTextField){
                if(firstNameTextField.text!.count > 2 && lastNameTextField.text!.count > 2){
                    returnValue = true
                }else {
                    returnValue = false
                }
            }
        else if(textField == emailTextField){
           if(firstNameTextField.text!.count > 2 && lastNameTextField.text!.count > 2 && Int(ageTextField.text!)! < 120) {
                returnValue = true
            }else {
                returnValue = false

                }
            }
        else if(textField == mobileNoTextField){
            if(firstNameTextField.text!.count > 2 && lastNameTextField.text!.count > 2 && Int(ageTextField.text!.count) < 120 && emailTextField.text!.count > 10){
                returnValue = true
            }else {
                returnValue = false
            }
        }
        else if(textField == stateTextField){
            if(firstNameTextField.text!.count > 2 && lastNameTextField.text!.count > 2 && Int(ageTextField.text!)! < 120 && emailTextField.text!.count > 10 && mobileNoTextField.text!.count == 10 && addressTextView.text!.count > 10){
                returnValue = true
            }else {
                returnValue = false
            }
        } else if(textField == countryTextField){
            if(firstNameTextField.text!.count > 2 && lastNameTextField.text!.count > 2 && Int(ageTextField.text!)! < 120 && emailTextField.text!.count > 10 && mobileNoTextField.text!.count == 10 && addressTextView.text.count > 10 && stateTextField.text!.count > 3){
                returnValue = true
            }else {
                returnValue = false
            }
        }
        return returnValue
        }
    
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool
    {
            if(firstNameTextField.text!.count > 2 && lastNameTextField.text!.count > 2 && Int(ageTextField.text!)! < 120 && emailTextField.text!.count > 10 && mobileNoTextField.text!.count == 10){
                returnValue = true
            }else {
                returnValue = false
            }
        return returnValue
        
        }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.backgroundColor = UIColor.yellow
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.backgroundColor = UIColor.white
    }
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.backgroundColor = UIColor.yellow
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        textView.backgroundColor = UIColor.white
    }
    }
        

    



        




