//
//  AllDetailsViewController.swift
//  Singleton
//
//  Created by Varalakshmi Kacherla on 11/20/19.
//  Copyright © 2019 Varalakshmi Kacherla. All rights reserved.
//

import UIKit

class AllDetailsViewController: UIViewController {
    
    // all labels
    
    @IBOutlet weak var firstNameLbl: UILabel!
    @IBOutlet weak var lastNameLbl: UILabel!
    @IBOutlet weak var ageLbl: UILabel!
    @IBOutlet weak var sscLbl: UILabel!
    @IBOutlet weak var interLbl: UILabel!
    @IBOutlet weak var btechLbl: UILabel!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var mobileLbl: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        firstNameLbl.text = FormData.shared.firstName
        lastNameLbl.text = FormData.shared.lastName
        ageLbl.text = String(FormData.shared.age)
        sscLbl.text = String(FormData.shared.sscPercentage)
        interLbl.text = String(FormData.shared.interPercentage)
        btechLbl.text = String(FormData.shared.btechPercentage)
        emailLbl.text = FormData.shared.email
        mobileLbl.text = String(FormData.shared.mobileNo)
        
         // Do any additional setup after loading the view.
    }
}
