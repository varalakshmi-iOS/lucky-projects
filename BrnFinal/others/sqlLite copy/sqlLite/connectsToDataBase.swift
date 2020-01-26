//
//  connectsToDataBase.swift
//  sqlLite
//
//  Created by Puligilla Rakesh Gupta on 12/20/19.
//  Copyright © 2019 Puligilla Rakesh Gupta. All rights reserved.
//

import UIKit
import SQLite

class connectsToDataBase: NSObject {
    
    var dbConnection:Connection!
    var alertController:UIAlertController!
   static var shared:connectsToDataBase = connectsToDataBase()
    
    // by do this only one instance can be created
    private override init() {
           super.init()
       }
    
    func dataBase() {
        
    let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        
        print(path)
    
        do {
            dbConnection = try Connection("\(path)/UserDetails.sqlite3")
        }
        
        catch {
            
            print("unable to connect")
        }
    }

    func alert (message:String) {
        
        alertController = UIAlertController(title: "", message: "\(message)", preferredStyle: UIAlertController.Style.alert)
        let button = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alertController.addAction(button)
     
        
    }
    
   


}
