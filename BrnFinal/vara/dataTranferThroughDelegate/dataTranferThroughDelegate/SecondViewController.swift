//
//  SecondViewController.swift
//  dataTranferThroughDelegate
//
//  Created by Varalakshmi Kacherla on 11/18/19.
//  Copyright © 2019 Varalakshmi Kacherla. All rights reserved.
//

import UIKit

protocol DataTranfer {
    func passData(Values:[String])
}

class SecondViewController: UIViewController {
    
    var delegate:DataTranfer!
    
    @IBOutlet weak var firstNameTF: UITextField!
    
    @IBOutlet weak var lastNameTF: UITextField!
    
    var alertController:UIAlertController!
    var alertAction:UIAlertAction!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func getAlert(titleName:String,messageDetails:String){
        
        alertController = UIAlertController(title: titleName, message: messageDetails, preferredStyle: UIAlertController.Style.alert)
        alertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
        alertController.addAction(alertAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func onBtnTap(_ sender: Any) {
        
        if((firstNameTF.text?.isEmpty)! || (lastNameTF.text?.isEmpty)!) {
            getAlert(titleName: "WARNING", messageDetails: "Please Enter FirstName and LastName")
        }else{
        var name = [String]()
        name.append(firstNameTF.text!)
        name.append(lastNameTF.text!)
        
        delegate.passData(Values: name)
        
        dismiss(animated: true, completion: nil)
        }
        }
}
