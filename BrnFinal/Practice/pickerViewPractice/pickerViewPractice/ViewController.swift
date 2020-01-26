//
//  ViewController.swift
//  pickerViewPractice
//
//  Created by Varalakshmi Kacherla on 1/4/20.
//  Copyright © 2020 Varalakshmi Kacherla. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    
    var pv:UIPickerView!
    
    var actors = ["Amithab","Abhishek","Akhil","Nikhil","Mahesh","Surya","Vijay","Ajay","Kojol","Ranveer","Deepika","Varun","Ram"]
    
    var cricketers = ["Kohli","Dhoni","Rohith","Bhuvaneshwar","Sachin"]
    
    var kings = ["Ashoka","Shivaji","Akbar","ShahJahan","MaharanaPratap","Humayun","KrishnaDevaraya"]
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        createUI()
        // Do any additional setup after loading the view.
    }

    
    func createUI(){
        
        pv = UIPickerView(frame: CGRect(x: 0, y: 200, width: 300, height: 300))
        
        pv.delegate = self
        pv.dataSource = self
        
        view.addSubview(pv)
        
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
//        return actors.count
        
        if(component == 0) {
            return actors.count
        } else if(component == 1) {
            return cricketers.count
        }else {
            return kings.count
        }
    }

    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
//        return actors[row]
        
        if(component == 0) {
            return actors[row]
        }
        else if(component == 1) {
            return cricketers[row]
        }
        else {
            return kings[row]
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
//        print("selected component is \(component) and row is \(row)")
        
        if(component == 0) {
            print(actors[row])
        }
        else if(component == 1) {
            print(cricketers[row])
        }
        else
        {
            print(kings[row])
        }
    }
}

