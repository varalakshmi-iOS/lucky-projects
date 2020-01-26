//
//  SingletonData.swift
//  SQLiteDB
//
//  Created by Ankam Ajay Kumar on 17/12/19.
//  Copyright © 2019 Ankam Ajay Kumar. All rights reserved.
//

import UIKit
import SQLite

class SingletonData: NSObject {

    
    static var shared:SingletonData = SingletonData()
    
    var dbConnection:Connection!
    var deleteButtonTapped:Int!
    var buttonTapped:Int!
    var nameArray = [String]()
    var mobileArray = [String]()
    var emailArray = [String]()
    var isCreateBtnTab = false
    var idArray = [Int64]()
    
    private override init() {
        
    }

}
