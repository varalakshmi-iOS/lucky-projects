//
//  Data.swift
//  ContactsDataBase
//
//  Created by Varalakshmi Kacherla on 12/24/19.
//  Copyright © 2019 Varalakshmi Kacherla. All rights reserved.
//

import UIKit
import SQLite

class Data: NSObject {
    
    static var shared:Data = Data()
       
       var dbConnection:Connection!
       var alert:UIAlertController!

       
       private override init() {
           super.init()
       }
       
       func dataBase() {
           let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
           print(path)
           do {
               dbConnection = try Connection("\(path)/MyContacts.sqlite3")
           }
           catch {
               print("Unable to Connect")
           }
       }
       
       func alertControl(message:String) {
           alert = UIAlertController(title: "", message: "\(message)", preferredStyle: UIAlertController.Style.alert)
           let button = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
           alert.addAction(button)
       }

}
