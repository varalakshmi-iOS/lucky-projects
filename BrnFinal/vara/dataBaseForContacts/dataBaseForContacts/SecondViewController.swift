//
//  SecondViewController.swift
//  dataBaseForContacts
//
//  Created by Varalakshmi Kacherla on 12/21/19.
//  Copyright © 2019 Varalakshmi Kacherla. All rights reserved.
//

import UIKit
import SQLite

class SecondViewController: UIViewController {

    @IBOutlet weak var nameTF: UITextField!
    
    @IBOutlet weak var emailTF: UITextField!
    
    @IBOutlet weak var mobileNoTF: UITextField!
    
    var dbConn:Connection!
    var alert:UIAlertController!
    var action:UIAlertAction!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dbConn = Data.shared.dbConnection
        

        // Do any additional setup after loading the view.
    }
    
  
    
    
    
   
    
    override func viewWillAppear(_ animated: Bool) {
        
        if(Data.shared.createBtn == false){
            print("nameArray:",Data.shared.nameArray)
            print("buttonArray:",Data.shared.button)
            nameTF.text = Data.shared.nameArray[Data.shared.button]
            emailTF.text = Data.shared.nameArray[Data.shared.button]
            mobileNoTF.text = Data.shared.mobileArray[Data.shared.button]
        }
    }
    
    @IBAction func onSaveBtnTap(_ sender: Any) {
        
        saveData()
        
        
    }
    
    
    
    @IBAction func onDeleteBtnTap(_ sender: Any) {
        
       updateData()
        
    }
    
    func saveData(){

        alert = UIAlertController(title: "OK", message: "Contact Saved", preferredStyle: UIAlertController.Style.alert)
        action = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (save) in
            do {
                try self.dbConn.run("INSERT INTO Contacts (Name, EmailID, MobileNo) VALUES (?,?,?)",self.nameTF.text!,self.emailTF.text!,self.mobileNoTF.text!)

                self.navigationController?.popViewController(animated: true)
            }

            catch {
                print("Unable to insert Data")
            }
        })
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    func updateData(){
        
        alert = UIAlertController(title: "OK", message: "Contact Updated", preferredStyle: UIAlertController.Style.alert)
        action = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (update) in
            
            do {
                try self.dbConn.run("UPDATE Contacts SET NAME = '\(self.nameTF.text!)',EMAILID = '\(self.emailTF.text!)',MOBILENO = '\(self.mobileNoTF.text!)' WHERE ID = \(Data.shared.idArray[Data.shared.button])")
                self.navigationController?.popViewController(animated: true)
            }
            catch
            {
                print("Unable to Update data")
            }
        })
        
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
        
    }
}
    

