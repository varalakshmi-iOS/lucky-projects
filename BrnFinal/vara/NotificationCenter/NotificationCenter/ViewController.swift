//
//  ViewController.swift
//  NotificationCenter
//
//  Created by Varalakshmi Kacherla on 11/23/19.
//  Copyright © 2019 Varalakshmi Kacherla. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
        @IBOutlet weak var firstNameLbl: UILabel!
    
    @IBOutlet weak var lastNameLbl: UILabel!
    @IBOutlet weak var ageLbl: UILabel!
    @IBOutlet weak var qualificationLbl: UILabel!
    
    var appDelRef = AppDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(receivedData(data:)), name: NSNotification.Name("swift"), object: nil)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    @objc func receivedData(data:Notification)
    {
        firstNameLbl.text = data.userInfo!["firstName"]! as! String
        lastNameLbl.text = data.userInfo!["lastName"]! as! String
        ageLbl.text = data.userInfo!["age"]! as! String
        qualificationLbl.text = data.userInfo!["qualification"]! as! String
    }
    
    @IBAction func nextBtn(_ sender: Any) {
        
        let greenVC = storyboard?.instantiateViewController(withIdentifier: "gvc") as! GreenViewController
        
        present(greenVC, animated: true, completion: nil)
       
    }
   
}

