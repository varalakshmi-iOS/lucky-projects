//
//  ViewController.swift
//  SeguePractice
//
//  Created by Varalakshmi Kacherla on 11/19/19.
//  Copyright © 2019 Varalakshmi Kacherla. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var msgTF: UITextField!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func submitBtn(_ sender: Any) {
        
        
    }
   
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SecondVC" {
            var rvc = segue.destination as! SecondViewController
        }else
        {
            print("don't pass Data")
        }
        
    }
    
    
      
}

