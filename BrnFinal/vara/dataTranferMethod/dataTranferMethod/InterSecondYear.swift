//
//  InterSecondYear.swift
//  dataTranferMethod
//
//  Created by Varalakshmi Kacherla on 11/12/19.
//  Copyright © 2019 Varalakshmi Kacherla. All rights reserved.
//

import UIKit

class InterSecondYear: UIViewController,UITextFieldDelegate {
    
    
   
    @IBOutlet weak var english: UITextField!
    
    @IBOutlet weak var sanskrit: UITextField!
    
    
    @IBOutlet weak var maths2A: UITextField!
    
    
    @IBOutlet weak var maths2B: UITextField!
    
    
    @IBOutlet weak var physics: UITextField!
    
    @IBOutlet weak var chemistry: UITextField!
    
    var interDetails = InterMarksDetails()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        english.delegate = self
        sanskrit.delegate = self
        maths2A.delegate = self
        maths2B.delegate = self
        physics.delegate = self
        chemistry.delegate = self
        

        // Do any additional setup after loading the view.
    }
    
    func isValidMarks(marks:String) -> Bool {
        let marksRegEx = "[0-9]{1,3}"
        
        let marksPred = NSPredicate(format:"SELF MATCHES %@", marksRegEx)
        return marksPred.evaluate(with: marksPred)
    }
    var returnValue = true
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        if(textField == english){
            returnValue = true
        }
        if(textField == sanskrit){
            if(Int(english.text!)! < 100){
                returnValue = true
            }else
            {
                returnValue = false
            }
        }
        if(textField == maths2A){
            if(Int(sanskrit.text!)! < 100){
                returnValue = true
            }else
            {
                returnValue = false
            }
        }
        if(textField == maths2B){
            if(Int(maths2A.text!)! < 100){
                returnValue = true
            }else
            {
                returnValue = false
            }
        }
        if(textField == physics){
            if(Int(maths2B.text!)! < 100){
                returnValue = true
            }else
            {
                returnValue = false
            }
        }
        if(textField == chemistry){
            if(Int(physics.text!)! < 100){
                returnValue = true
            }else
            {
                returnValue = false
            }
        }
        return returnValue
        
    }
    
    
    
    
func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
    
    
    if(textField == english || textField == sanskrit || textField == maths2A || textField == maths2B || textField == physics || textField == chemistry)
    {
        returnValue = isValidMarks(marks: textField.text!)
    }
    
    return returnValue
}

    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.backgroundColor = UIColor.yellow
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.backgroundColor = UIColor.white
    }
    @IBAction func submitBtnTapped(_ sender: UIButton) {
        
        
        dismiss(animated: true) {
            self.interDetails.interSecondYearMarks.append(self.english.text!)
            self.interDetails.interSecondYearMarks.append(self.sanskrit.text!)
            self.interDetails.interSecondYearMarks.append(self.maths2A.text!)
            self.interDetails.interSecondYearMarks.append(self.maths2B.text!)
            self.interDetails.interSecondYearMarks.append(self.physics.text!)
            self.interDetails.interSecondYearMarks.append(self.chemistry.text!)

        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
