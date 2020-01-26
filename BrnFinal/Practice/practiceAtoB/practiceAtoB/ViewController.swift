//
//  ViewController.swift
//  practiceAtoB
//
//  Created by Varalakshmi Kacherla on 11/11/19.
//  Copyright © 2019 Varalakshmi Kacherla. All rights reserved.
//

import UIKit
class ViewController: UIViewController {

    @IBOutlet weak var fLbl: UILabel!
    @IBOutlet weak var fTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func onBtnTap(_ sender: UIButton)
    {
        var VC2 = storyboard?.instantiateViewController(withIdentifier: "012") as! sc
                
        present(VC2, animated: true, completion: nil)
        
        VC2.fvc = self
        
         VC2.sLbl.text = fTF.text!
    }
    
}

