//
//  ViewController.swift
//  sqlite practice
//
//  Created by Varalakshmi Kacherla on 12/17/19.
//  Copyright © 2019 Varalakshmi Kacherla. All rights reserved.
//

import UIKit
import SQLite

class ViewController: UIViewController {
    
    @IBOutlet weak var firstNameTF: UITextField!
    @IBOutlet weak var lastNameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    
    var path:String!
    var dbConnection:Connection?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        
        do {
    
            dbConnection = try Connection("\(path)/db.sqlite3")
            print(path)

            try self.dbConnection!.run("Create Table if not Exists Friends(ID Integer Primary Key AutoIncrement, FirstName Text,LastName Text, Email ID Text)")

        }catch {
            print("Unable to Connect/Open database")
            
        }
    }
    
    @IBAction func onSaveBtntap(_ sender: Any) {
    
        do{
       
            
//            print("@@@@@@@@@@@@@",dbConnection!)
            
            try dbConnection!.run("INSERT INTO Friends(FirstName,LastName,Email) VALUES (?,?,?)", firstNameTF.text!,lastNameTF.text!,emailTF.text!)
    }
   catch
   {
    print("unable to catch")
    }
      
        firstNameTF.text = ""
        lastNameTF.text = ""
        emailTF.text = ""
    }
    
    @IBAction func onFetchBtnTap(_ sender: Any) {
    
    
        let stmt = try! dbConnection!.run("SELECT firstName,lastName,email FROM Friends")

        for row in stmt {
            for (index, name) in stmt.columnNames.enumerated() {
               
                print("\(name):\(row[index]!)")
            }
        }
        
    }
    
    
    
    
}

