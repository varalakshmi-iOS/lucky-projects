//
//  ViewController.swift
//  AppDelegate
//
//  Created by Varalakshmi Kacherla on 11/26/19.
//  Copyright © 2019 Varalakshmi Kacherla. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var appDelRef:AppDelegate!
    
    @IBOutlet weak var fullNameLbl: UILabel!
        @IBOutlet weak var ageLbl: UILabel!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var mobileLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        appDelRef = UIApplication.shared.delegate as! AppDelegate
    }
    
    @IBAction func onNextBtnTap(_ sender: Any) {
        let secondVC = storyboard?.instantiateViewController(withIdentifier: "svc") as! SecondViewController
        present(secondVC, animated: true, completion: nil)
    }
    override func viewDidAppear(_ animated: Bool) {
        fullNameLbl.text = appDelRef.dataDict["Name"]
        ageLbl.text = appDelRef.dataDict["Age"]
        emailLbl.text = appDelRef.dataDict["Email"]
        mobileLbl.text = appDelRef.dataDict["mobile"]
    }
}

