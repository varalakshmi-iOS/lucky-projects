//
//  ViewController.swift
//  imageViewPractice
//
//  Created by Varalakshmi Kacherla on 11/28/19.
//  Copyright © 2019 Varalakshmi Kacherla. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    
    
   

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
     
        
        
    }


    @IBAction func onBtnTap(_ sender: Any) {
        if(imageView.isHighlighted == true){
            imageView.isHighlighted = false
        }
        else
        {
            imageView.isHighlighted = true
            
        }
        
        
    }
}

