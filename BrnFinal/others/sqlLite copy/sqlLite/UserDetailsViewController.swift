//
//  UserDetailsViewController.swift
//  sqlLite
//
//  Created by Puligilla Rakesh Gupta on 12/18/19.
//  Copyright © 2019 Puligilla Rakesh Gupta. All rights reserved.
//

import UIKit
import SQLite


class UserDetailsViewController: UIViewController {

    @IBOutlet weak var saveBtn: UIButton!
    
    @IBOutlet weak var updateBtn: UIButton!
    
    var fName:String = " "
    var lName:String = " "
    var mNumber:String = " "
    var update = [String]()
    var tag:Int!
    
    @IBOutlet weak var firstName: UITextField!
    
    @IBOutlet weak var lastName: UITextField!
    
    @IBOutlet weak var mobileNumber: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
          firstName.text = fName
          lastName.text = lName
          mobileNumber.text = mNumber
    
        do {
           
            connectsToDataBase.shared.dataBase()
            
            
            try connectsToDataBase.shared.dbConnection.run("Create table if not exists UserDetails(ID INTEGER PRIMARY KEY  AUTOINCREMENT, FirstName TEXT, LastName TEXT, MobileNumber  TEXT)")
          }
        
        catch {
            
            print("unable to create table")
        }
    }
    
    @IBAction func saveBTN(_ sender: Any) {
       
        do  {
            
                 try connectsToDataBase.shared.dbConnection.run("INSERT INTO UserDetails(FirstName,LastName,MobileNumber) values (?,?,?)", firstName.text! ,lastName.text! , mobileNumber.text!)
                
                          firstName.text = ""
                          lastName.text = ""
                          mobileNumber.text = ""
                      
            connectsToDataBase.shared.alert(message: "saved sucessfully")
            present(connectsToDataBase.shared.alertController, animated: true, completion: nil)
            }
        
        catch {
            
            print("unable to insert Data")
        }
    }

    @IBAction func fetchBTN(_ sender: Any) {
        
        do {
                try connectsToDataBase.shared.dbConnection.run("UPDATE UserDetails SET FirstName = '\(firstName.text!)', LastName ='\(lastName.text!)' , MobileNumber = '\(mobileNumber.text!)' where Firstname = '\(update[tag])'")
       
                 firstName.text = ""
                 lastName.text = ""
                 mobileNumber.text = ""
       
                   connectsToDataBase.shared.alert(message: "updated sucessfully")
                   present(connectsToDataBase.shared.alertController, animated: true, completion: nil)
                   }
       
        catch {
            
            print("unable to update data")
        }
    }
}
