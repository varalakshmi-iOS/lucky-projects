//
//  Destination2.swift
//  DataPassingUsingSegue
//
//  Created by Varalakshmi Kacherla on 11/19/19.
//  Copyright © 2019 Varalakshmi Kacherla. All rights reserved.
//

import UIKit

class Destination2: UIViewController
{

    @IBOutlet weak var msg2Lbl: UILabel!
    
    var msgString2 = ""
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        msg2Lbl.text = msgString2
    }
   
}
