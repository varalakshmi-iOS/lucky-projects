//
//  ViewController.swift
//  DatePicker
//
//  Created by Varalakshmi Kacherla on 10/24/19.
//  Copyright © 2019 Varalakshmi Kacherla. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate,UITextViewDelegate{
    
    var firstNameTF:UITextField!
    var lastNameTF:UITextField!
    var ageTF:UITextField!
    var gender:UISegmentedControl!
    var emailTF:UITextField!
    var mobileNoTF:UITextField!
    var addressTV:UITextView!
    var stateTF:UITextField!
    var countryTF:UITextField!
    
    var alertController:UIAlertController!
    var alertAction:UIAlertAction!

    var datePick:UIDatePicker!

    var calender = Calendar.current
    let todaysDate = Date()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        creatingLabels(xPos: 10, yPos: 60, labelName: "FirstName")
        creatingLabels(xPos: 10, yPos: 140, labelName: "LastName")
        creatingLabels(xPos: 10, yPos: 220, labelName: "Age")
        creatingLabels(xPos: 10, yPos: 310, labelName: "Gender")
        creatingLabels(xPos: 10, yPos: 390, labelName: "Email ID")
        creatingLabels(xPos: 10, yPos: 470, labelName: "Mobile No")
        creatingLabels(xPos: 10, yPos: 550, labelName: "Address")
        creatingLabels(xPos: 10, yPos: 650, labelName: "State")
        creatingLabels(xPos: 10, yPos: 730, labelName: "Country")
        
        createTF()
        displayDate()
    }

    func creatingLabels(xPos:Int,yPos:Int,labelName:String){
        
        let label = UILabel()
        label.frame = CGRect(x: xPos, y: yPos, width: 100, height: 40)
        label.text = labelName
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = UIColor.white
        view.addSubview(label)
    }

    func createTF(){
        
        firstNameTF = UITextField()
        firstNameTF.delegate = self
        firstNameTF.frame = CGRect(x: 10, y: 100, width: 390, height: 40)
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
        lastNameTF.frame = CGRect(x: 10, y: 180, width: 390, height: 40)
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
        ageTF.frame = CGRect(x: 10, y: 260, width: 390, height: 40)
        ageTF.backgroundColor = UIColor.white
        ageTF.keyboardType = UIKeyboardType.numberPad
        ageTF.placeholder = "Age"
        ageTF.borderStyle = .roundedRect
        ageTF.font = UIFont.systemFont(ofSize: 20)
        ageTF.textAlignment = .center
        ageTF.textColor = UIColor.black
        view.addSubview(ageTF)
        
        gender = UISegmentedControl()
        gender.frame = CGRect(x: 10, y: 350, width: 245, height: 37)
        gender.backgroundColor = UIColor.black
        gender.tintColor = UIColor.magenta
        gender.insertSegment(withTitle: "Male", at: 0, animated: true)
        gender.insertSegment(withTitle: "Female", at: 1, animated: true)
        view.addSubview(gender)
        
        emailTF = UITextField()
        emailTF.delegate = self
        emailTF.frame = CGRect(x: 10, y: 430, width: 390, height: 40)
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
        mobileNoTF.frame = CGRect(x: 10, y: 510, width: 390, height: 40)
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
        addressTV.frame = CGRect(x: 10, y: 590, width: 390, height: 60)
        addressTV.backgroundColor = UIColor.white
        addressTV.font = UIFont.systemFont(ofSize: 20)
        addressTV.keyboardType = UIKeyboardType.asciiCapable
        view.addSubview(addressTV)
        
        stateTF = UITextField()
        stateTF.delegate = self
        stateTF.frame = CGRect(x: 10, y: 690, width: 390, height: 40)
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
        countryTF.frame = CGRect(x: 10, y: 770, width: 390, height: 40)
        countryTF.backgroundColor = UIColor.white
        countryTF.keyboardType = UIKeyboardType.alphabet
        countryTF.placeholder = "Country"
        countryTF.borderStyle = .roundedRect
        countryTF.font = UIFont.systemFont(ofSize: 20)
        countryTF.textAlignment = .center
        countryTF.textColor = UIColor.black
        view.addSubview(countryTF)
        
        let submit = UIButton()
        submit.frame = CGRect(x: 140, y: 830, width: 100, height: 40)
        submit.backgroundColor = UIColor.white
        submit.setTitle("Submit", for: UIControl.State.normal)
        submit.setTitleColor(UIColor.black, for: UIControl.State.normal)
        submit.addTarget(self, action: #selector(onBtnTapped), for: UIControl.Event.touchUpInside)
        view.addSubview(submit)
       
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
           
        else if(textField == emailTF){
            if(gender.selectedSegmentIndex == 0 || gender.selectedSegmentIndex == 1){
                returnValue  = true
            }else
            {
                returnValue = false
            }
        }
        else if (textField == mobileNoTF){
            if (emailTF.text!.count >= 6){
              returnValue = true
            }else
            {
                
                returnValue = false
            }
        }
       else if (textField == stateTF){
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
            if(mobileNoTF.text!.count <= 15){
                returnValue = true
            }else{
                returnValue = false
            }
        }
        return returnValue
    }
    
// became first responder
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.backgroundColor = UIColor.yellow
    }
    
// became first responder
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.backgroundColor = UIColor.yellow
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.backgroundColor = .white
    }
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
        let numberRegEx = "[7-9][0-9]{6,10}"
        
        let numberPred = NSPredicate(format:"SELF MATCHES %@", numberRegEx)
        return numberPred.evaluate(with: numberStr)
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
                getAlert(titleName: "WARNING", messageDetails: "Enter mobile numbers in numarics and it's format like 9876543210")
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
    
    @objc func  fixDatePicker(datepicker:UIDatePicker)
      {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/YYYY"
        ageTF.text = dateFormatter.string(from: datepicker.date)
        ageTF.resignFirstResponder()
  
        let birthDate = dateFormatter.date(from: ageTF.text!)
        let dateInCalender = Calendar.current
        let dateComp  = dateInCalender.dateComponents([.day,.month,.year], from: birthDate!,to:Date())
 
        let ageCalculation = UILabel()
        ageCalculation.frame = CGRect(x: 120, y: 290, width: 230, height: 35)
ageCalculation.text = "\(dateComp.year ?? 0 ) Year \(dateComp.month ?? 0) Month \(dateComp.day ?? 0) Days"
        ageCalculation.textColor = UIColor.white
        ageCalculation.font = UIFont.boldSystemFont(ofSize: 16)
        ageCalculation.textAlignment = .center
        view.addSubview(ageCalculation)
    }
    func displayDate()
    {
         datePick = UIDatePicker()
        let maxDate = Date()
        
        datePick.datePickerMode = UIDatePicker.Mode.date
        let minDateInCalender = Calendar.current
        let maxDateInCalender = Calendar.current
        
  var minDateInComp = minDateInCalender.dateComponents([.day,.month,.year], from: datePick.date)
        minDateInComp.day = 01
        minDateInComp.month = 01
        minDateInComp.year = 1975
        datePick.minimumDate = minDateInCalender.date(from: minDateInComp)
     
    var maxDateInComp = minDateInCalender.dateComponents([.day,.month,.year], from: datePick.date)
        maxDateInComp.day  = minDateInCalender.component(.day, from: maxDate)
        maxDateInComp.month = minDateInCalender.component(.month, from: maxDate)
        maxDateInComp.year = minDateInCalender.component(.year, from: maxDate)
        datePick.maximumDate = maxDateInCalender.date(from: maxDateInComp)
        datePick.addTarget(self, action: #selector( fixDatePicker(datepicker:)), for:UIControl.Event.valueChanged)
        ageTF.inputView = datePick
    }
    @objc func onBtnTapped()
    {
        
        if ((firstNameTF.text?.isEmpty)! ||
            (lastNameTF.text?.isEmpty)! ||
            (ageTF.text?.isEmpty)! ||
            (mobileNoTF.text?.isEmpty)! ||
            (emailTF.text?.isEmpty)! ||
            (addressTV.text?.isEmpty)! ||
            (stateTF.text?.isEmpty)! ||
            (countryTF.text?.isEmpty)!)
        {
            getAlert(titleName: "WARNING", messageDetails: "Please enter valid details")
        }
        else
        {
            getAlert(titleName: "CONGRATULATIONS", messageDetails:  "successfully Created Your Account")
        }
    }
}


