//
//  RedViewController.swift
//  appDelegatePractice
//
//  Created by Varalakshmi Kacherla on 11/26/19.
//  Copyright © 2019 Varalakshmi Kacherla. All rights reserved.
//

import UIKit

class RedViewController: UIViewController {
    
    @IBOutlet weak var redLbl: UILabel!
    
    @IBOutlet weak var redTF: UITextField!
    
    var appDelRef:AppDelegate!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        appDelRef = UIApplication.shared.delegate as! AppDelegate
        
        redLbl.text = appDelRef.dataDict["yellowMsg"]!
        
        
        
        
        // Do any additional setup after loading the view.
    }
    

    
    
    @IBAction func redBtntap(_ sender: Any) {
        
        appDelRef.dataDict["redMsg"] = redTF.text!
        
        dismiss(animated: true, completion: nil)
        
        
    }
    
    
    
    
    
}
