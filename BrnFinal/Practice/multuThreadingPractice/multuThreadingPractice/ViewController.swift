//
//  ViewController.swift
//  multuThreadingPractice
//
//  Created by Varalakshmi Kacherla on 1/20/20.
//  Copyright © 2020 Varalakshmi Kacherla. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        multiThread()
        // Do any additional setup after loading the view.
    }


    
    func multiThread(){
        
        
        var thread1 = DispatchQueue(label: "Thread1")
        var thread2 = DispatchQueue(label: "Thread2")
        var thread3 = DispatchQueue(label: "Thread3")
        
        thread1.sync {
            
            
            for i in 0...100 {
                print("*********\(i)")
            }
        }
        
        thread2.async {
            
            for i in 0...100 {
                
                print("@@@@@@@\(i)")
            }
        }
        
        thread3.async {
            
            
            for i in 0...100 {
                print("$$$$$$\(i)")
            }
        }
        
        
    }
}

