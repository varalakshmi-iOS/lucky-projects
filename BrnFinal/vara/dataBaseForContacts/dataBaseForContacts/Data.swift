//
//  data.swift
//  dataBaseForContacts
//
//  Created by Varalakshmi Kacherla on 12/21/19.
//  Copyright © 2019 Varalakshmi Kacherla. All rights reserved.
//

import UIKit
import SQLite

class Data: NSObject {
    
    static var shared:Data = Data()
    
    var dbConnection:Connection!
    var deleteBtn:Int!
    var button:Int!
    var nameArray = [String]()
    var mobileArray = [String]()
    var emailArray = [String]()
    var createBtn = false
    var idArray = [Int]()

    
    
    private override init() {
    
    }
    
    }
    
    


