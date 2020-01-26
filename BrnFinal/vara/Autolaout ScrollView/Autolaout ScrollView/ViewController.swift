//
//  ViewController.swift
//  Autolaout ScrollView
//
//  Created by Varalakshmi Kacherla on 11/7/19.
//  Copyright © 2019 Varalakshmi Kacherla. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate,UITextViewDelegate{
    
    var alertController:UIAlertController!
    var alertAction:UIAlertAction!
   
    @IBOutlet weak var firstNameTF: UITextField!
    
    @IBOutlet weak var lastNameTF: UITextField!
    
    @IBOutlet weak var genderSC: UISegmentedControl!
    
    @IBOutlet weak var ageTF: UITextField!
    
    
    @IBOutlet weak var emailTF: UITextField!
    
    
    @IBOutlet weak var mobileNoTF: UITextField!
    
    @IBOutlet weak var addressTV: UITextView!
    
    @IBOutlet weak var stateTF: UITextField!
    
    @IBOutlet weak var countryTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        firstNameTF.delegate = self
        lastNameTF.delegate = self
        ageTF.delegate = self
        emailTF.delegate = self
        mobileNoTF.delegate = self
        addressTV.delegate = self
        stateTF.delegate = self
        countryTF.delegate = self
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    var returnValue = true

    

    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if(textField == firstNameTF){
            
           returnValue = true        }
        
         if(textField == lastNameTF){
            if(firstNameTF.text!.count >= 2){
                 returnValue = true
            }else
            {
                returnValue = false
            }
        }

         if(textField == genderSC){
            if(lastNameTF.text!.count >= 2){
                 returnValue = true
            }else
            {
                 returnValue = false
            }
        }
        if(textField == ageTF){
            if(genderSC.selectedSegmentIndex == 0 || genderSC.selectedSegmentIndex == 1){
               returnValue = true
            }else
            {
               returnValue =  false
            }
        }
        if(textField == emailTF){
             if(Int(ageTF.text!)! <= 120){
              returnValue = true
            }else
            {
                 returnValue = false
            }
        }
        if(textField == mobileNoTF){
            if(emailTF.text!.count > 3){
                returnValue = true
            }else
            {
                
                returnValue = false
            }
        }
        if(textField == stateTF){
            if(addressTV.text!.count >= 5){
                returnValue = true
            }else
            {
                 returnValue =  false
            }
        }
        if(textField == countryTF){
            if(stateTF.text!.count > 2){
               returnValue = true
            }else
            {
                 returnValue = false
            }
        }
        return returnValue
    }
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        if(textView == addressTV){
            if(mobileNoTF.text!.count == 10){
                returnValue = true
            }else
            {
                returnValue = false
            }
        }
      return returnValue
    }
   
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.backgroundColor = UIColor.yellow
    }
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.backgroundColor = UIColor.yellow
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.backgroundColor = UIColor.white
    }

    func textViewDidEndEditing(_ textView: UITextView) {
        textView.backgroundColor = UIColor.white
    }

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

    func getAlert(titleName:String,messageDetails:String){

        alertController = UIAlertController(title: titleName, message: messageDetails, preferredStyle: UIAlertController.Style.alert)
        alertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
        alertController.addAction(alertAction)
        self.present(alertController, animated: true, completion: nil)
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if(textField == firstNameTF || textField == lastNameTF || textField == stateTF || textField == countryTF){
            if(isValidName(nameStr: textField.text!)){
                textField.backgroundColor = UIColor.black
            }else{
                textField.backgroundColor = UIColor.red
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



}
    
    
    
    
    
    
    
    
    
    
    
    
    
    


