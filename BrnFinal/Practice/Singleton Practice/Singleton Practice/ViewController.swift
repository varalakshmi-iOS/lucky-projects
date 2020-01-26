//
//  ViewController.swift
//  Singleton Practice
//
//  Created by Varalakshmi Kacherla on 11/20/19.
//  Copyright © 2019 Varalakshmi Kacherla. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var firstNameTF: UITextField!
    
    @IBOutlet weak var lastNameTF: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        var fd1 = FormData()
//        var fd2 = FormData()

        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func submitBtn(_ sender: Any) {
        
        FormData.shared.firstName = firstNameTF.text!
        FormData.shared.lastName = lastNameTF.text!
        
        var svc = storyboard?.instantiateViewController(withIdentifier: "svc") as! SecondViewController
        
        present(svc, animated: true, completion: nil)
        
    }
    
}

