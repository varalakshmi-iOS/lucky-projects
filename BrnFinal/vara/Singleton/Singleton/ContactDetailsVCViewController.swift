//
//  ContactDetailsVCViewController.swift
//  Singleton
//
//  Created by Varalakshmi Kacherla on 11/20/19.
//  Copyright © 2019 Varalakshmi Kacherla. All rights reserved.
//

import UIKit

class ContactDetailsVCViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var emailTF: UITextField!
    
    @IBOutlet weak var mobileTF: UITextField!
    
    var alertController:UIAlertController!
    var alertAction:UIAlertAction!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        emailTF.delegate = self
        mobileTF.delegate = self
        
        emailTF.keyboardType = UIKeyboardType.emailAddress
        mobileTF.keyboardType = UIKeyboardType.phonePad

        // Do any additional setup after loading the view.
    }
    

    
    @IBAction func nextBtn(_ sender: Any) {
        
        
        if((emailTF.text?.isEmpty)! || (mobileTF.text?.isEmpty)!)
        {
         getAlert(titleName: "OK", messageDetails: "Please Enter All Details")
        }
        
        FormData.shared.email = emailTF.text!
        FormData.shared.mobileNo = Int(mobileTF.text!) 
        
        let detailsVC = storyboard?.instantiateViewController(withIdentifier: "detailsvc") as! AllDetailsViewController
        
        present(detailsVC, animated: true, completion: nil)
        
        
    }
    
    // function for Alert
    
    func getAlert(titleName:String,messageDetails:String){
        
        alertController = UIAlertController(title: titleName, message: messageDetails, preferredStyle: UIAlertController.Style.alert)
        alertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
        alertController.addAction(alertAction)
        self.present(alertController, animated: true, completion: nil)
    }
    // function for email Validation
    
    func isValidEmail(emailStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: emailStr)
    }
    // function for number Validation
    
    func isValidNumber(numberStr:String) -> Bool {
        let numberRegEx = "[7-9][0-9]{9}"
        
        let numberPred = NSPredicate(format:"SELF MATCHES %@", numberRegEx)
        return numberPred.evaluate(with: numberStr)
    }
    

// functions for Delegates
    
    var returnValue = true
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if(textField == emailTF){
            returnValue = true
        }
        if(textField == mobileTF){
            if(emailTF.text!.count > 0){
                returnValue = true
            } else
            {
                returnValue = false
            }
        }
        return returnValue
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if(textField == emailTF){
            if(isValidEmail(emailStr: textField.text!)){
                textField.textColor = UIColor.black
            }
            else{
                getAlert(titleName: "OK", messageDetails: "Enter Valid Email like ssss@sss.sss")
            }
        }
        if(textField == mobileTF){
            if(isValidNumber(numberStr: textField.text!)){
                textField.textColor = UIColor.black
            } else
            {
                getAlert(titleName: "OK", messageDetails: "Enter Valid Mobile Number")
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
