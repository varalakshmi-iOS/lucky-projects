//
//  ViewController.swift
//  appDelegatePractice
//
//  Created by Varalakshmi Kacherla on 11/26/19.
//  Copyright © 2019 Varalakshmi Kacherla. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var yellowTF: UITextField!
    
    @IBOutlet weak var yellowLbl: UILabel!
    
    var appDelRef:AppDelegate!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        appDelRef = UIApplication.shared.delegate as! AppDelegate
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    override func viewDidAppear(_ animated: Bool) {
        
        yellowLbl.text = appDelRef.dataDict["redMsg"]
        
    }
    
    @IBAction func yellowBtnTap(_ sender: Any) {
        
       let redVC = storyboard?.instantiateViewController(withIdentifier: "rvc") as! RedViewController
        
        appDelRef.dataDict["yellowMsg"] = yellowTF.text!
        
        present(redVC, animated: true, completion: nil)
        
        
        
        
    }



}

