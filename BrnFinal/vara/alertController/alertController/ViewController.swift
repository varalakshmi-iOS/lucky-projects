//
//  ViewController.swift
//  alertController
//
//  Created by Varalakshmi Kacherla on 10/23/19.
//  Copyright © 2019 Varalakshmi Kacherla. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {
    
    var firstNameTF:UITextField!
    var lastNameTF:UITextField!
    var ageTF:UITextField!
    var emailTF:UITextField!
    var mobileNoTF:UITextField!
    var addressTV:UITextView!
    var stateTF:UITextField!
    var countryTF:UITextField!
    var alertController:UIAlertController!
    var alertAction:UIAlertAction!

    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        creatingLabels(xPos: 10, yPos: 100, labelName: "FirstName")
        creatingLabels(xPos: 10, yPos: 170, labelName: "LastName")
        creatingLabels(xPos: 10, yPos: 240, labelName: "Age")
        creatingLabels(xPos: 10, yPos: 310, labelName: "Email ID")
        creatingLabels(xPos: 10, yPos: 380, labelName: "Mobile No")
        creatingLabels(xPos: 10, yPos: 450, labelName: "Address")
        creatingLabels(xPos: 10, yPos: 590, labelName: "State")
        creatingLabels(xPos: 10, yPos: 660, labelName: "Country")
        
        createTF()

        // Do any additional setup after loading the view, typically from a nib.
    }

    // creating function for labels creation
    
    func creatingLabels(xPos:Int,yPos:Int,labelName:String){

    let label = UILabel()
    label.frame = CGRect(x: xPos, y: yPos, width: 100, height: 40)
    label.text = labelName
    label.font = UIFont.systemFont(ofSize: 20)
    label.textColor = UIColor.black
    view.addSubview(label)
    
    }
    
    // creating function for textfields and button creation
    
    func createTF(){
        
        firstNameTF = UITextField()
        firstNameTF.delegate = self
        firstNameTF.frame = CGRect(x: 130, y: 100, width: 270, height: 40)
        firstNameTF.backgroundColor = UIColor.white
        firstNameTF.keyboardType = UIKeyboardType.alphabet
        firstNameTF.placeholder = "FirstName"
        firstNameTF.borderStyle = .roundedRect
        firstNameTF.font = UIFont.systemFont(ofSize: 20)
        firstNameTF.textAlignment = .center
        firstNameTF.textColor = UIColor.black
        view.addSubview(firstNameTF)
        
        lastNameTF = UITextField()
        lastNameTF.delegate = self
        lastNameTF.frame = CGRect(x: 130, y: 170, width: 270, height: 40)
        lastNameTF.backgroundColor = UIColor.white
        lastNameTF.keyboardType = UIKeyboardType.alphabet
        lastNameTF.placeholder = "LastName"
        lastNameTF.borderStyle = .roundedRect
        lastNameTF.font = UIFont.systemFont(ofSize: 20)
        lastNameTF.textAlignment = .center
        lastNameTF.textColor = UIColor.black
        view.addSubview(lastNameTF)
        
        ageTF = UITextField()
        ageTF.delegate = self
        ageTF.frame = CGRect(x: 130, y: 240, width: 270, height: 40)
        ageTF.backgroundColor = UIColor.white
        ageTF.keyboardType = UIKeyboardType.numberPad
        ageTF.placeholder = "Age"
        ageTF.borderStyle = .roundedRect
        ageTF.font = UIFont.systemFont(ofSize: 20)
        ageTF.textAlignment = .center
        ageTF.textColor = UIColor.black
        ageTF.addTarget(self, action: #selector(ageFactor(obj:)), for: UIControl.Event.allEditingEvents)
        view.addSubview(ageTF)
        
        emailTF = UITextField()
        emailTF.delegate = self
        emailTF.frame = CGRect(x: 130, y: 310, width: 270, height: 40)
        emailTF.backgroundColor = UIColor.white
        emailTF.keyboardType = UIKeyboardType.emailAddress
        emailTF.placeholder = "Email ID"
        emailTF.borderStyle = .roundedRect
        emailTF.font = UIFont.systemFont(ofSize: 20)
        emailTF.textAlignment = .center
        emailTF.textColor = UIColor.black
        view.addSubview(emailTF)
        
        mobileNoTF = UITextField()
        mobileNoTF.delegate = self
        mobileNoTF.frame = CGRect(x: 130, y: 380, width: 270, height: 40)
        mobileNoTF.backgroundColor = UIColor.white
        mobileNoTF.keyboardType = UIKeyboardType.phonePad
        mobileNoTF.placeholder = "Mobile No"
        mobileNoTF.borderStyle = .roundedRect
        mobileNoTF.font = UIFont.systemFont(ofSize: 20)
        mobileNoTF.textAlignment = .center
        mobileNoTF.textColor = UIColor.black
        view.addSubview(mobileNoTF)
        
        addressTV = UITextView()
        addressTV.delegate = self
        addressTV.frame = CGRect(x: 130, y: 450, width: 270, height: 100)
        addressTV.backgroundColor = UIColor.white
        addressTV.font = UIFont.systemFont(ofSize: 20)
        addressTV.keyboardType = UIKeyboardType.asciiCapable
        view.addSubview(addressTV)
        
        stateTF = UITextField()
        stateTF.delegate = self
        stateTF.frame = CGRect(x: 130, y: 590, width: 270, height: 40)
        stateTF.backgroundColor = UIColor.white
        stateTF.keyboardType = UIKeyboardType.alphabet
        stateTF.placeholder = "State"
        stateTF.borderStyle = .roundedRect
        stateTF.font = UIFont.systemFont(ofSize: 20)
        stateTF.textAlignment = .center
        stateTF.textColor = UIColor.black
        view.addSubview(stateTF)
        
        countryTF = UITextField()
        countryTF.delegate = self
        countryTF.frame = CGRect(x: 130, y: 660, width: 270, height: 40)
        countryTF.backgroundColor = UIColor.white
        countryTF.keyboardType = UIKeyboardType.alphabet
        countryTF.placeholder = "Country"
        countryTF.borderStyle = .roundedRect
        countryTF.font = UIFont.systemFont(ofSize: 20)
        countryTF.textAlignment = .center
        countryTF.textColor = UIColor.black
        view.addSubview(countryTF)
    
        let submit = UIButton()
        submit.frame = CGRect(x: 140, y: 750, width: 100, height: 40)
        submit.backgroundColor = UIColor.white
        submit.setTitle("Submit", for: UIControl.State.normal)
        submit.setTitleColor(UIColor.black, for: UIControl.State.normal)
        view.addSubview(submit)
        submit.addTarget(self, action: #selector(onButtonClick), for: UIControl.Event.touchUpInside)

    }
   
    var returnValue = false
    
    // return NO to disallow editing
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        if(textField == firstNameTF){
            returnValue = true
        }else if(textField == lastNameTF){
            if(firstNameTF.text!.count >= 0){
                returnValue = true
            }else
            {
                returnValue = false
            }
        }
        else if(textField == ageTF){
            if(lastNameTF.text!.count >= 0){
                returnValue = true
            }else
            {
                returnValue = false
            }
        } else if(textField == emailTF){
            if(Int(ageTF.text!)! <= 120){
                returnValue = true
            }else
            {
                returnValue = false
            }
        }else if(textField == mobileNoTF){
            if(emailTF.text!.count >= 0){
                returnValue = true
            }else
            {
                returnValue = false
            }
        }else if(textField == stateTF){
            if(addressTV.text!.count >= 0){
                returnValue = true
            }else {
                returnValue = false
            }
        } else if(textField == countryTF){
            if(stateTF.text!.count >= 0){
                returnValue = true
            }else {
                returnValue = false
            }
        }
        
       return returnValue
        
    }
    
    // return NO to disallow editing.
    
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        if(textView == addressTV){
            if(mobileNoTF.text!.count >= 6){
                returnValue = true
            }else{
                returnValue = false
            }
        }
        return returnValue
    }
    
    // became first responder
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.backgroundColor = .gray
    }
    
    // became first responder
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.backgroundColor = .gray
    }
    
    // may be called if forced even if shouldEndEditing returns NO (e.g. view removed from window) or endEditing:YES called
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.backgroundColor = .white
    }
    
    // may be called if forced even if shouldEndEditing returns NO (e.g. view removed from window) or endEditing:YES called
    
    func textViewDidEndEditing(_ textView: UITextView) {
        textView.backgroundColor = .white
    }
    
    // function for email validation
    
    func isValidEmail(emailStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: emailStr)
    }
    
    // function for name validation
    
    func isValidName(nameStr:String) -> Bool {
        let nameRegEx = "[A-Za-z ]{1,20}"
        
        let namePred = NSPredicate(format:"SELF MATCHES %@", nameRegEx)
        return namePred.evaluate(with: nameStr)
    }
    // function for Number Validation
    
    func isValidNumber(numberStr:String) -> Bool {
        let numberRegEx = "^[7-9][0-9]{6,10}"
        
        let numberPred = NSPredicate(format:"SELF MATCHES %@", numberRegEx)
        return numberPred.evaluate(with: numberStr)
    }
    
    // function for Age Validation
    
    func isValidAge(age:String) -> Bool {
        let ageRegEx = "[0-9]{1,3}"
        
        let agePred = NSPredicate(format:"SELF MATCHES %@", ageRegEx)
        return agePred.evaluate(with: age)
    }
    
    // function for Address Validation
    
    func isValidAddress(address:String) -> Bool {
        let addressRegEx = "[A-Za-z0-9/., ]{1,250}"
        
        let addressPred = NSPredicate(format:"SELF MATCHES %@", addressRegEx)
        return addressPred.evaluate(with: address)
    }

    // return YES to allow editing to stop and to resign first responder status. NO to disallow the editing session to end
    
    
    
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        
            if(textField ==  firstNameTF || textField == lastNameTF || textField == stateTF || textField == countryTF) {
                
                if(isValidName(nameStr: textField.text!))
                {
                    textField.textColor = .black
                }
                else
                {
                    textField.textColor = .red
                    getAlert(titleName: "WARNING", messageDetails: "Enter name in alphabetical letters")
                }
                
            }
        
        
            if(textField == ageTF) {
                if(isValidAge(age: textField.text!))
                {
                    textField.textColor = .black
                }
                else
                {
                    getAlert(titleName: "WARNING", messageDetails: "Enter age in numarics and it must be below 120 Years")
                    textField.textColor = .red
                }
                

            }
            if(textField == emailTF) {
                if(isValidEmail(emailStr: textField.text!))
                {
                    textField.textColor = .black
                }
                else
                {
                    getAlert(titleName: "WARNING", messageDetails: "Enter email in valid format like ex:- xxxx@xxxx.xxx")
                    textField.textColor = .red
                }

            }
            if(textField == mobileNoTF){
                if(isValidNumber(numberStr: textField.text!))
                {
                    textField.textColor = .black
                }
                else
                {
                    getAlert(titleName: "WARNING", messageDetails: "Enter mobile numbers in numarics and it's format like +9xxxxxxxxx")
                    textField.textColor = .red
                }

            }
            return returnValue
        }
    
    // creating function for alerts msgs
    
    func getAlert(titleName:String,messageDetails:String){
        
        alertController = UIAlertController(title: titleName, message: messageDetails, preferredStyle: UIAlertController.Style.alert)
        alertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
        alertController.addAction(alertAction)
        self.present(alertController, animated: true, completion: nil)
        
        
    }
    
    // creating function for submit button
    
    @objc func onButtonClick()
    {
        if((firstNameTF.text?.isEmpty)! || (lastNameTF.text?.isEmpty)! || (ageTF.text?.isEmpty)! || (emailTF.text?.isEmpty)! || (addressTV.text?.isEmpty)! || (stateTF.text?.isEmpty)! || (countryTF.text?.isEmpty)!)
        {
            getAlert(titleName: "WARNING", messageDetails: "Please enter Valid Details")
        }
        else
        {
            getAlert(titleName: "Congrats", messageDetails: "Account Created Successfully")
        }
        
    }
    
    //event handler for age
    
    @objc func ageFactor(obj:UITextField)
    {
        if(obj.text != "")
        {
            if(Int(obj.text!)!>120)
            {
                obj.text = ""
            }
        }
    }
    
}
