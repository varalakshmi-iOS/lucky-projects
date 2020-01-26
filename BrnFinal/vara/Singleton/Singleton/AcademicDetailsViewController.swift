//
//  AcademicDetailsViewController.swift
//  Singleton
//
//  Created by Varalakshmi Kacherla on 11/20/19.
//  Copyright © 2019 Varalakshmi Kacherla. All rights reserved.
//

import UIKit

class AcademicDetailsViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var sscTF: UITextField!
    
    @IBOutlet weak var interTF: UITextField!
    
    @IBOutlet weak var btechTF: UITextField!
    var alertController:UIAlertController!
    var alertAction:UIAlertAction!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        sscTF.delegate = self
        interTF.delegate = self
        btechTF.delegate = self
        
        sscTF.keyboardType = UIKeyboardType.decimalPad
        interTF.keyboardType = UIKeyboardType.decimalPad
        btechTF.keyboardType = UIKeyboardType.decimalPad

        // Do any additional setup after loading the view.
    }
    @IBAction func nextBtn(_ sender: Any) {
        
        if((sscTF.text?.isEmpty)! || (interTF.text?.isEmpty)! || (btechTF.text?.isEmpty)!)
        {
            getAlert(titleName: "OK", messageDetails: "Enter All Details")
        }
     
        FormData.shared.sscPercentage = Float(sscTF.text!)
        FormData.shared.interPercentage = Float(interTF.text!)
        FormData.shared.btechPercentage = Float(btechTF.text!)
        
        let thirdVC = storyboard?.instantiateViewController(withIdentifier: "contactvc") as! ContactDetailsVCViewController
        
        present(thirdVC, animated: true, completion: nil)  // creating navigation
    }
      // function for percentage Validation
    
    func isValidPerc(percStr:String) -> Bool {
        let percRegEx = "[0-9]{2}.[0-9]{1}"
        
        let percPred = NSPredicate(format:"SELF MATCHES %@", percRegEx)
        return percPred.evaluate(with: percStr)
    }
      // function for Alert
    func getAlert(titleName:String,messageDetails:String){
        
        alertController = UIAlertController(title: titleName, message: messageDetails, preferredStyle: UIAlertController.Style.alert)
        alertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
        alertController.addAction(alertAction)
        self.present(alertController, animated: true, completion: nil)
    }
    // functions for Delegates
    
    var returnValue = false
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if(textField == sscTF){
            returnValue = true
        }
        if(textField == interTF){
            if(sscTF.text!.count > 0){
                returnValue = true
            }else
            {
                returnValue = false
            }
        }
        if( textField == btechTF){
            if(interTF.text!.count > 0){
                returnValue = true
            } else
            {
                returnValue = false
            }
        }
        return returnValue
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if(textField == sscTF || textField == interTF || textField == btechTF){
            if(isValidPerc(percStr: textField.text!))
            {
                textField.textColor = UIColor.black
            } else
            {
                textField.textColor = UIColor.red
                getAlert(titleName: "OK", messageDetails: "Please Enter Percentage like (00.0)")
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
    
    
    
    

   
