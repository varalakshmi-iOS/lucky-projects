//
//  FormData.swift
//  Singleton
//
//  Created by Varalakshmi Kacherla on 11/20/19.
//  Copyright © 2019 Varalakshmi Kacherla. All rights reserved.
//

import UIKit

class FormData: NSObject {
    
    static var shared:FormData = FormData()
    
    var firstName:String!
    var lastName:String!
    var age:Int!
    var sscPercentage:Float!
    var interPercentage:Float!
    var btechPercentage:Float!
    var email:String!
    var mobileNo:Int!
    
   private override init() {
        super.init()
    }
    
}
