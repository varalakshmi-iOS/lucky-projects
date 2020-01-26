//
//  FormData.swift
//  Singleton Practice
//
//  Created by Varalakshmi Kacherla on 11/20/19.
//  Copyright © 2019 Varalakshmi Kacherla. All rights reserved.
//

import UIKit

class FormData: NSObject {
    
    
    var firstName:String!
    var lastName:String!
    
     static var shared:FormData = FormData()
    
    
    private override init()
    {
        super.init()
    }
    

}
