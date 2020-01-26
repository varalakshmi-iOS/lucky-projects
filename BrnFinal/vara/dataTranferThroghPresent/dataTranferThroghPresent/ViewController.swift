//
//  ViewController.swift
//  dataTranferThroghPresent
//
//  Created by Varalakshmi Kacherla on 11/18/19.
//  Copyright © 2019 Varalakshmi Kacherla. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {
    

    @IBOutlet weak var firstNameTF: UITextField!
    
    @IBOutlet weak var lastNameTF: UITextField!
    
    @IBOutlet weak var ageTF: UITextField!
    
    @IBOutlet weak var qualificationTF: UITextField!
    
    var alertController:UIAlertController!
    var alertAction:UIAlertAction!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
       
        firstNameTF.delegate = self
        lastNameTF.delegate = self
        ageTF.delegate = self
        qualificationTF.delegate = self
        
        
        firstNameTF.keyboardType = UIKeyboardType.namePhonePad
        lastNameTF.keyboardType = UIKeyboardType.namePhonePad
        ageTF.keyboardType = UIKeyboardType.numberPad
        qualificationTF.keyboardType = UIKeyboardType.alphabet
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func nextBtn(_ sender: UIButton) {

        if((firstNameTF.text?.isEmpty)! || (lastNameTF.text?.isEmpty)! || (ageTF.text?.isEmpty)! || (qualificationTF.text?.isEmpty)!)
        {
            getAlert(titleName: "OK", messageDetails: "Enter All Details")
        } else
        {
       
        let interVC = storyboard?.instantiateViewController(withIdentifier: "InterVC") as! InterViewController
        
            present(interVC, animated: true) {
                interVC.personalDetails.append(self.firstNameTF.text!)
                interVC.personalDetails.append(self.lastNameTF.text!)
                interVC.personalDetails.append(self.ageTF.text!)
                interVC.personalDetails.append(self.qualificationTF.text!)
            }
    
    }
    }
    var returnValue = false
    
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
        if(textField == ageTF){
            if(lastNameTF.text!.count > 0){
                returnValue = true
            }else
            {
                returnValue = false
            }
        }
        if(textField == qualificationTF){
            if(Int(ageTF.text!)!) < 120 {
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
    
    func isValidName(nameStr:String) -> Bool {
        let nameRegEx = "[A-Za-z ]{1,20}"
        
        let namePred = NSPredicate(format:"SELF MATCHES %@", nameRegEx)
        return namePred.evaluate(with: nameStr)
        
    }
    func isValidAge(age:String) -> Bool {
        let ageRegEx = "[0-9]{2}"
        
        let agePred = NSPredicate(format:"SELF MATCHES %@", ageRegEx)
        return agePred.evaluate(with: age)
    }
    func isValidQualification(Str:String) -> Bool {
        let RegEx = "[A-Za-z.,/ ]{1,20}"
        
        let Pred = NSPredicate(format:"SELF MATCHES %@", RegEx)
        return Pred.evaluate(with: Str)
        
    }
    
    
    func getAlert(titleName:String,messageDetails:String){
        
        alertController = UIAlertController(title: titleName, message: messageDetails, preferredStyle: UIAlertController.Style.alert)
        alertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
        alertController.addAction(alertAction)
        self.present(alertController, animated: true, completion: nil)
        
        
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if(textField == firstNameTF){
            if(isValidName(nameStr: textField.text!)){
                
                textField.textColor = UIColor.black
            }else
            {
                textField.textColor = UIColor.red
                getAlert(titleName: "OK", messageDetails: "Please Enter Alphabets Only")
            }
        }
        if(textField == lastNameTF){
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
        if(textField == qualificationTF){
            if(isValidQualification(Str: textField.text!)){
                textField.textColor = UIColor.black
            }else
            {
                textField.textColor = UIColor.red
                getAlert(titleName: "OK", messageDetails: "Please Enter Qualification")
            }
        }
        return returnValue
            }

    
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.backgroundColor = UIColor.white
    }
    
    
    
        

}
    
    


