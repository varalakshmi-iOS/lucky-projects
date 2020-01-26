//
//  ViewController.swift
//  DataPassingUsingSegue
//
//  Created by Varalakshmi Kacherla on 11/19/19.
//  Copyright © 2019 Varalakshmi Kacherla. All rights reserved.
//

import UIKit
class ViewController: UIViewController
{
    @IBOutlet weak var msg1TF: UITextField!
    @IBOutlet weak var msg2TF: UITextField!
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        return true
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "YB"){
            
            let destination1VC = segue.destination as! Destination1
            
            destination1VC.msgString1 = [msg1TF.text!]
    }else
        {
            let destination2VC = segue.destination as! Destination2
            destination2VC.msgString2 = msg2TF.text!
        }
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
}

