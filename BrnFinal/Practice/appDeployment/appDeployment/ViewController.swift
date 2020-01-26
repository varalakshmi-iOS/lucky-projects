//
//  ViewController.swift
//  appDeployment
//
//  Created by Varalakshmi Kacherla on 1/9/20.
//  Copyright © 2020 Varalakshmi Kacherla. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        
        let defaults = UserDefaults.standard
        
        
        // storing
        defaults.set(20, forKey: "number") // userdefaults
        defaults.set("rakesh", forKey: "name")
      
        
    
        let arr = ["hello","world"]
        defaults.set(arr, forKey: "arrayData")
        
        
        let dict = ["name":"mayuri","state":"nagpur"]
        defaults.set(dict, forKey: "dictData")
        
        
        
        print(defaults.integer(forKey: "number"))
        
        let mobile = defaults.integer(forKey: "number")
        let userName = defaults.string(forKey: "name")
        
        let savedArray = defaults.object(forKey: "arrayData") as? [String] ?? [String]()
        
        
        print(mobile)
        print(userName)
        print(savedArray.count)
    }


    
}


