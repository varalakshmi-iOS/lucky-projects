//
//  ViewController.swift
//  dataTranferThroughDelegate
//
//  Created by Varalakshmi Kacherla on 11/18/19.
//  Copyright © 2019 Varalakshmi Kacherla. All rights reserved.
//

import UIKit

class ViewController: UIViewController,DataTranfer {
    
    var names = [[]]
    var xPos = 30
    var yPos = 100
    
    var allObjects = [UILabel]()
    
    @IBOutlet weak var addButton: UIButton!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }

    func passData(Values: [String]) {
        names.append(Values)
    }
    
    @IBAction func onBtnTap(_ sender: Any) {
        
       let secondVC = self.storyboard?.instantiateViewController(withIdentifier: "secondVC") as! SecondViewController
        
        secondVC.delegate = self
        present(secondVC, animated: true, completion: nil)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        xPos = 30
        yPos = 150
        for x in allObjects {
            x.removeFromSuperview()
        }
        createUI()
    }
    
    func createUI(){
        for x in names {
            var i = 0
            
            for m in x {
                
                 let label = UILabel()
                label.frame = CGRect(x: xPos, y: yPos, width: 150, height: 40)
                allObjects.append(label)
                
            
            if(i==0){
                
                label.backgroundColor = UIColor.cyan
                label.text = m as! String
                view.addSubview(label)
                
                i += 1
                xPos += 200
                
                } else
            {
                label.backgroundColor = UIColor.cyan
                label.text = m as! String
                view.addSubview(label)
                xPos = 30
                yPos += 50

                }
            }
        }
    }
    
}

