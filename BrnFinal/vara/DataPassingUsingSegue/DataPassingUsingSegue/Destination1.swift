//
//  Destination1.swift
//  DataPassingUsingSegue
//
//  Created by Varalakshmi Kacherla on 11/19/19.
//  Copyright © 2019 Varalakshmi Kacherla. All rights reserved.
//

import UIKit

class Destination1: UIViewController
{

    @IBOutlet weak var msg1Lbl: UILabel!
    
    var msgString1 = [String]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        msg1Lbl.text = msgString1[0]
    }
    
}
