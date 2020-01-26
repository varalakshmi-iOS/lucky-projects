//
//  RedViewController.swift
//  NotificationCenterPractice
//
//  Created by Varalakshmi Kacherla on 11/22/19.
//  Copyright © 2019 Varalakshmi Kacherla. All rights reserved.
//

import UIKit

class RedViewController: UIViewController {
    
    
    
   
    @IBOutlet weak var redMagLbl: UILabel!
    
    @IBOutlet weak var redMsgTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func onRedBtnTap(_ sender: Any) {
        
        var dataDict = ["swift":redMsgTF.text!]
        
      NotificationCenter.default.post(name: NSNotification.Name("vara"), object: self, userInfo: dataDict)
        
        dismiss(animated: true) {
          
        }
    }
    
    
    
    
    
    
}
