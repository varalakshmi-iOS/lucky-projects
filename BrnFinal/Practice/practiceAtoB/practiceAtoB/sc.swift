//
//  sc.swift
//  practiceAtoB
//
//  Created by Varalakshmi Kacherla on 11/11/19.
//  Copyright © 2019 Varalakshmi Kacherla. All rights reserved.
//

import UIKit
class sc: UIViewController {

    @IBOutlet weak var sLbl: UILabel!
    @IBOutlet weak var sTF: UITextField!
    
    var fvc = ViewController()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func onBtnTap(_ sender: UIButton) {
        
        dismiss(animated: true) {
            
            self.fvc.fLbl.text = self.sTF.text
        }
    }
}
