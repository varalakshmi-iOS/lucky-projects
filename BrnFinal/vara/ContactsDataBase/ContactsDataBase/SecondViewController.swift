//
//  SecondViewController.swift
//  ContactsDataBase
//
//  Created by Varalakshmi Kacherla on 12/24/19.
//  Copyright © 2019 Varalakshmi Kacherla. All rights reserved.
//

import UIKit
import SQLite

class SecondViewController: UIViewController {

    
    @IBOutlet weak var firstNameTF: UITextField!
    @IBOutlet weak var lastNameTF: UITextField!
    
    @IBOutlet weak var mobileNoTF: UITextField!
    
       var name1:String = " "
       var name2:String = " "
       var mobile:String = " "
       var update = [String]()
       var tag:Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        firstNameTF.text = name1
        lastNameTF.text = name2
        mobileNoTF.text = mobile
        
        do {
            Data.shared.dataBase()
            
            try Data.shared.dbConnection.run("CREATE TABLE IF NOT EXISTS MyContacts(ID INTEGER PRIMARY KEY AUTOINCREMENT, FirstName text, LastName Text, MobileNo text)")
        }
        catch {
            print("Unable to Create Table")
        }

        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onSaveBtnTap(_ sender: Any) {
        
        do {
            try Data.shared.dbConnection.run("INSERT INTO MyContacts(FirstName,LastName,MobileNo) VALUES (?,?,?)",firstNameTF.text!,lastNameTF.text!,mobileNoTF.text!)
            
            firstNameTF.text = ""
            lastNameTF.text = ""
            mobileNoTF.text = ""
            
            Data.shared.alertControl(message: "Contact Saved")
            present(Data.shared.alert, animated: true, completion: nil)
        } catch {
            print("Unable to Insert Data")
        }
    }
    
    
    @IBAction func onUpdateBtnTap(_ sender: Any) {
        
        do {
                   try Data.shared.dbConnection.run("UPDATE MyContacts SET FirstName = '\(firstNameTF.text!)',LastName = '\(lastNameTF.text!)',MobileNo = '\(mobileNoTF.text!)' WHERE FirstName = '\(update[tag])'")
                   
                   firstNameTF.text = ""
                   lastNameTF.text = ""
                   mobileNoTF.text = ""
                   
                   Data.shared.alertControl(message: "Contact Updated")
                   
                   present(Data.shared.alert, animated: true, completion: nil)
               }
               catch{
                   print("Unable to Update Data")
               }
    }
    
}
