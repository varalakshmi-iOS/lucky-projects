//
//  SecondViewController.swift
//  AppDelegate
//
//  Created by Varalakshmi Kacherla on 11/26/19.
//  Copyright © 2019 Varalakshmi Kacherla. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController,UITextFieldDelegate {
  
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var ageTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var mobileTF: UITextField!
    
    var appDelRef:AppDelegate!
    var alertController:UIAlertController!
    var alertAction:UIAlertAction!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        appDelRef = UIApplication.shared.delegate as! AppDelegate
        
        nameTF.keyboardType = UIKeyboardType.namePhonePad
        ageTF.keyboardType = UIKeyboardType.numberPad
        emailTF.keyboardType = UIKeyboardType.emailAddress
        mobileTF.keyboardType = UIKeyboardType.phonePad

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onBtnTap(_ sender: Any) {
    
        if((nameTF.text?.isEmpty)! || (ageTF.text?.isEmpty)! || (emailTF.text?.isEmpty)! || (mobileTF.text?.isEmpty)!)
        {
            getAlert(titleName: "OK", messageDetails: "Enter All Details")
        }else
        {
    
        appDelRef.dataDict["Name"] = nameTF.text!
        appDelRef.dataDict["Age"] = ageTF.text!
        appDelRef.dataDict["Email"] = emailTF.text!
        appDelRef.dataDict["mobile"] = mobileTF.text!
        
        dismiss(animated: true, completion: nil)
    }
    }
     // function for Alert
    func getAlert(titleName:String,messageDetails:String){
        
        alertController = UIAlertController(title: titleName, message: messageDetails, preferredStyle: UIAlertController.Style.alert)
        alertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
        alertController.addAction(alertAction)
        self.present(alertController, animated: true, completion: nil)
    }
}

