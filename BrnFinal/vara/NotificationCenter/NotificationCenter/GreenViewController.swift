//
//  GreenViewController.swift
//  NotificationCenter
//
//  Created by Varalakshmi Kacherla on 11/23/19.
//  Copyright © 2019 Varalakshmi Kacherla. All rights reserved.
//

import UIKit

class GreenViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var firstNameTF: UITextField!
    @IBOutlet weak var lastNameTF: UITextField!
    @IBOutlet weak var ageTF: UITextField!
    @IBOutlet weak var qualificationTF: UITextField!
    
    var alertController:UIAlertController!
    var alertAction:UIAlertAction!
    var appDelRef = AppDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstNameTF.keyboardType = UIKeyboardType.namePhonePad
        lastNameTF.keyboardType = UIKeyboardType.namePhonePad
        ageTF.keyboardType = UIKeyboardType.numberPad
        qualificationTF.keyboardType = UIKeyboardType.alphabet

        appDelRef = UIApplication.shared.delegate as! AppDelegate
        // Do any additional setup after loading the view.
    }

    @IBAction func submitBtn(_ sender: Any) {
        
        if((firstNameTF.text?.isEmpty)! || (lastNameTF.text?.isEmpty)! || (ageTF.text?.isEmpty)! || (qualificationTF.text?.isEmpty)!){
            getAlert(titleName: "OK", messageDetails: "Enter All Details")
        }else
        {
            let dataDict = ["firstName":firstNameTF.text!,"lastName":lastNameTF.text!,"age":ageTF.text!,"qualification":qualificationTF.text!]
            
            NotificationCenter.default.post(name: NSNotification.Name("swift"), object: self, userInfo: dataDict)
            
            dismiss(animated: true, completion: nil)
        }
    }
    func getAlert(titleName:String,messageDetails:String){
        
        alertController = UIAlertController(title: titleName, message: messageDetails, preferredStyle: UIAlertController.Style.alert)
        alertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
        alertController.addAction(alertAction)
        self.present(alertController, animated: true, completion: nil)
       
    }
}
