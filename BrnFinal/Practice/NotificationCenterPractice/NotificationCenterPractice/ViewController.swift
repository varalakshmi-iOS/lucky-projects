//
//  ViewController.swift
//  NotificationCenterPractice
//
//  Created by Varalakshmi Kacherla on 11/22/19.
//  Copyright © 2019 Varalakshmi Kacherla. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var msgLbl: UILabel!
    
    
    @IBOutlet weak var msgTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(receivedData(data:)), name: NSNotification.Name("vara"), object: nil)
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @objc func receivedData(data:Notification){
        
//        print("observer data")
//
//
//        print(data.userInfo!)
//       print(data.userInfo!["swift"]!)
        msgLbl.text = data.userInfo!["swift"]! as! String
    }
    
    
    
   
    @IBAction func onBtnTap(_ sender: Any) {
        
        let redVC = storyboard?.instantiateViewController(withIdentifier: "rvc") as! RedViewController
        
        present(redVC, animated: true) {
             redVC.redMagLbl.text = self.msgTF.text!
        }
        
        
        
    }
    


}

