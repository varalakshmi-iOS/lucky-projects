//
//  ViewController.swift
//  gesturesPractice
//
//  Created by Varalakshmi Kacherla on 1/9/20.
//  Copyright © 2020 Varalakshmi Kacherla. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var gestureLbl: UILabel!
    var swipeRightGesture:UISwipeGestureRecognizer!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        createGestures()
        // Do any additional setup after loading the view.
    }


    
    func createGestures(){
        
        
        swipeRightGesture = UISwipeGestureRecognizer(target: self, action: #selector(onSwipeRight))
         swipeRightGesture = UISwipeGestureRecognizer(target: self, action: #selector(onSwipeLeft))
        
        
        swipeRightGesture.numberOfTouchesRequired = 1
        
        swipeRightGesture.direction = .right
        swipeRightGesture.direction = .left
        
        
    }
    
    @objc func onSwipeRight()
    {
        gestureLbl.text = "Swipe Right"
        
    }
    
    @objc func onSwipeLeft()
       {
           gestureLbl.text = "Swipe Left"
           
       }
}

