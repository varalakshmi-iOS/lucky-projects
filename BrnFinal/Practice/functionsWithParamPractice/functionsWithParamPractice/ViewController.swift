//
//  ViewController.swift
//  functionsWithParamPractice
//
//  Created by Varalakshmi Kacherla on 1/10/20.
//  Copyright © 2020 Varalakshmi Kacherla. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var passMarks:UInt8 = 35
    var engPassMarks:UInt8 = 35
    var telPassMarks:UInt8 = 35
    var mathsaPassMarks:UInt8 = 28
    var mathsbPassMarks:UInt8 = 28
    var phyPassMarks:UInt8 = 28
    var chemPassMarks:UInt8 = 28

    override func viewDidLoad() {
        super.viewDidLoad()
        
        func calcTenthResult(engMarks:UInt8,telMarks:UInt8,hindiMarks:UInt8,mathsMarks:UInt8,sciMarks:UInt8,socMarks:UInt8,studentName:String)
               {
                   
    let tenthTotalMarks:UInt16 = UInt16(engMarks) + UInt16(telMarks) + UInt16(hindiMarks) + UInt16(mathsMarks)
                       + UInt16(sciMarks) + UInt16(socMarks)
                   
print(studentName, "got \(tenthTotalMarks) in Tenth")          //Displays Tenth Total Marks
                   
    let tenthPercentage:Float = (Float(tenthTotalMarks)/600)*100
                   print(studentName, "got \(tenthPercentage) in Tenth")        //Displays Tenth Percentage
                   
    if(engMarks>=passMarks && telMarks>=passMarks && hindiMarks>=passMarks && mathsMarks>=passMarks &&
                       sciMarks>=passMarks && socMarks>=passMarks)
                   {
        print(studentName, "Passed in Tenth")      //Displays passed in Tenth
                       
        switch tenthPercentage
                       {
        case 75...100:
        print("Distinction")
        case 60..<75:
        print("Grade A")
        case 50..<60:
                           print("Grade B")
                       default:
                           print( "Grade C")
                       }
                   }else
                   {
                       print(studentName, "Failed in Tenth")             //Displays Failed in Tenth
                   }
                   
               }
        
        
        calcTenthResult(engMarks: 80, telMarks: 65, hindiMarks: 60, mathsMarks: 85, sciMarks: 90, socMarks: 90, studentName:"Surya")
        
        calcTenthResult(engMarks: 50, telMarks: 55, hindiMarks: 30, mathsMarks: 75, sciMarks: 60, socMarks: 70, studentName:"Nithya")
        
        calcTenthResult(engMarks: 80, telMarks: 55, hindiMarks: 50, mathsMarks: 85, sciMarks: 90, socMarks: 60, studentName:"Vijay")
        
        calcTenthResult(engMarks: 80, telMarks: 25, hindiMarks: 60, mathsMarks: 85, sciMarks: 90, socMarks: 40, studentName:"Ajith")
        
        calcTenthResult(engMarks: 60, telMarks: 55, hindiMarks: 60, mathsMarks: 85, sciMarks: 80, socMarks: 70, studentName:"Rahul")
        // Do any additional setup after loading the view.
    }


}

