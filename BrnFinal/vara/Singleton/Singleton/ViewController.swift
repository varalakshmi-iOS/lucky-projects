//
//  ViewController.swift
//  Singleton
//
//  Created by Varalakshmi Kacherla on 11/20/19.
//  Copyright © 2019 Varalakshmi Kacherla. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {
   
    @IBOutlet weak var firstNameTF: UITextField!
    @IBOutlet weak var lastNameTF: UITextField!
    @IBOutlet weak var ageTF: UITextField!
    
   var alertController:UIAlertController!
    var alertAction:UIAlertAction!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        firstNameTF.delegate = self
        lastNameTF.delegate = self
        ageTF.delegate = self
        
        firstNameTF.keyboardType = UIKeyboardType.namePhonePad
        lastNameTF.keyboardType = UIKeyboardType.namePhonePad
        ageTF.keyboardType = UIKeyboardType.numberPad
    }
   
    @IBAction func nextBtn(_ sender: Any) {
        
        if((firstNameTF.text?.isEmpty)! || (lastNameTF.text?.isEmpty)! || (ageTF.text?.isEmpty)!)
        {
            getAlert(titleName: "OK", messageDetails: "Enter All Details")
        }
        FormData.shared.firstName = firstNameTF.text!
        FormData.shared.lastName = lastNameTF.text!
        FormData.shared.age = Int(ageTF.text!)
        
        let svc = storyboard?.instantiateViewController(withIdentifier: "academicVC") as! AcademicDetailsViewController
        
        present(svc, animated: true, completion: nil)
    }
    
     // function for nae Validations
    
    func isValidName(nameStr:String) -> Bool {
        let nameRegEx = "[A-Za-z ]{1,20}"
        
        let namePred = NSPredicate(format:"SELF MATCHES %@", nameRegEx)
        return namePred.evaluate(with: nameStr)
    }
    
    // function for age Validations
    func isValidAge(age:String) -> Bool {
        let ageRegEx = "[0-9]{2}"

        let agePred = NSPredicate(format:"SELF MATCHES %@", ageRegEx)
        return agePred.evaluate(with: age)
    }
    // function for alert
    func getAlert(titleName:String,messageDetails:String){
        
        alertController = UIAlertController(title: titleName, message: messageDetails, preferredStyle: UIAlertController.Style.alert)
        alertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
        alertController.addAction(alertAction)
        self.present(alertController, animated: true, completion: nil)
    }
    // functions for Delegates
    
    var returnValue = true
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if(textField == firstNameTF){
            returnValue = true
        }
        if(textField == lastNameTF){
            if(firstNameTF.text!.count > 0){
                returnValue = true
            }else
            {
                returnValue = false
            }
        }
            if( textField == ageTF){
                if(lastNameTF.text!.count > 0){
                    returnValue = true
                }else
                {
                    returnValue = false
                }
            }
            return returnValue
        }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if(textField == firstNameTF || textField == lastNameTF){
            if(isValidName(nameStr: textField.text!)){
                textField.textColor = UIColor.black
            }else
            {
                textField.textColor = UIColor.red
                getAlert(titleName: "OK", messageDetails: "Please Enter Alphabets Only")
            }
        }
        if(textField == ageTF){
            if(isValidAge(age: textField.text!)){
                textField.textColor = UIColor.black
            }else
            {
                textField.textColor = UIColor.red
                getAlert(titleName: "OK", messageDetails: "Please Enter Valid Age")
            }
        }
        
        return returnValue
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.backgroundColor = UIColor.yellow
    }
    
    func textFieldDidEndEditing(_ textField: UITextField)
    {
      textField.backgroundColor = UIColor.white
    }
    

}


