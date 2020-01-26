//
//  ViewController.swift
//  coreData
//
//  Created by Varalakshmi Kacherla on 12/30/19.
//  Copyright © 2019 Varalakshmi Kacherla. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    
    
    
    var contacts:[UIButton] = [UIButton]()
    var images:[UIImageView] = [UIImageView]()
    var deleteBtn:[UIButton] = [UIButton]()
    var editBtn:[UIButton] = [UIButton]()
    var contactBtn = UIButton()
    
    
    var ad:AppDelegate!
    var moc:NSManagedObjectContext!
    var userDetails:NSEntityDescription!
    var details:String = " "
    
    
     
    


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

