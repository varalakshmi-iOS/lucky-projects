//
//  ViewController.swift
//  dataTranferMethod
//
//  Created by Varalakshmi Kacherla on 11/11/19.
//  Copyright © 2019 Varalakshmi Kacherla. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate{
    
    var alertController:UIAlertController!
    var alertAction:UIAlertAction!
    
    @IBOutlet weak var firstNameTF: UITextField!
    
    @IBOutlet weak var lastNameTF: UITextField!
    
    @IBOutlet weak var qualificationTF: UITextField!
    
    
    @IBOutlet weak var ageTF: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstNameTF.delegate = self
        lastNameTF.delegate = self
        qualificationTF.delegate = self
        ageTF.delegate = self
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
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
        if(textField == qualificationTF){
            if(lastNameTF.text!.count > 0){
                returnValue = true
            }else
            {
                returnValue = false
            }
        }
        if(textField == ageTF){
            if(qualificationTF.text!.count > 0){
                returnValue = true
            }else
            {
                returnValue = false
            }
    }
    return returnValue
}
    
    
    func isValidName(nameStr:String) -> Bool {
        let nameRegEx = "[A-Za-z ]{1,20}"
        
        let namePred = NSPredicate(format:"SELF MATCHES %@", nameRegEx)
        return namePred.evaluate(with: nameStr)
        
    }
        func isValidAge(age:String) -> Bool {
            let ageRegEx = "[0-9]{1,3}"
            
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
//
//    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
//        if(textField == firstNameTF){
//            if(isValidName(nameStr: textField.text!))
//            {
//                textField.textColor = .black
//            }
//            else
//            {
//                textField.textColor = .red
//                getAlert(titleName: "WARNING", messageDetails: "Enter name in alphabetical letters")
//            }
//            
//        }
//        if(textField == lastNameTF){
//            if(isValidName(nameStr: textField.text!))
//            {
//                textField.textColor = .black
//            }
//            else
//            {
//                textField.textColor = .red
//                getAlert(titleName: "WARNING", messageDetails: "Enter name in alphabetical letters")
//            }
//        }
//        
//        if(textField == qualificationTF){
//            if(isValidQualification(Str: textField.text!)){
//                textField.textColor = UIColor.black
//            }else {
//                textField.textColor = .red
//                getAlert(titleName: "WARNING", messageDetails: "Enter Correct Qualification")
//            }
//            }
//        if(textField == ageTF){
//             if(isValidAge(age: textField.text!))
//                {
//                textField.textColor = .black
//                }
//                else
//                {
//                getAlert(titleName: "WARNING", messageDetails: "Enter age in numarics")
//                textField.textColor = .red
//                }
//        }
//        return returnValue
//        }
        
        
    @IBAction func onBtnTap(_ sender: Any) {
        
//        if((firstNameTF.text?.isEmpty)! || (lastNameTF.text?.isEmpty)! || (qualificationTF.text?.isEmpty)! || (ageTF.text?.isEmpty)!)
//            {
//                getAlert(titleName: "WARNING", messageDetails: "Please enter Valid Details")
//            }
//            else
//            {
//                getAlert(titleName: "Congrats", messageDetails: "Account Created Successfully")
//            }
        
        var interVC = storyboard?.instantiateViewController(withIdentifier: "InterMarks") as! InterMarksDetails
         interVC.modalTransitionStyle = .crossDissolve
        
            present(interVC, animated: true, completion: nil)
        
        interVC.personalDetails.append(firstNameTF.text!)
        interVC.personalDetails.append(lastNameTF.text!)
        interVC.personalDetails.append(qualificationTF.text!)
        interVC.personalDetails.append(qualificationTF.text!)
        
            
        }
        
        
        
    }
    
        
        


    
    
    
    
    
    

