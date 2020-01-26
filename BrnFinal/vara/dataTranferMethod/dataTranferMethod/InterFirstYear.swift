//
//  InterFirstYear.swift
//  dataTranferMethod
//
//  Created by Varalakshmi Kacherla on 11/12/19.
//  Copyright © 2019 Varalakshmi Kacherla. All rights reserved.
//

import UIKit

class InterFirstYear: UIViewController,UITextFieldDelegate{
    
    
    @IBOutlet weak var english1: UITextField!
    
    
    @IBOutlet weak var sanskrit1: UITextField!
    @IBOutlet weak var maths1A: UITextField!
    
    @IBOutlet weak var maths1B: UITextField!
    
    @IBOutlet weak var physics1: UITextField!
    
    
    @IBOutlet weak var chemistry1: UITextField!
    
    
    var interDetails = InterMarksDetails()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        english1.delegate = self
        sanskrit1.delegate = self
        maths1A.delegate = self
        maths1B.delegate = self
        physics1.delegate = self
        chemistry1.delegate = self

        
        // Do any additional setup after loading the view.
    }

    func isValidMarks(marks:String) -> Bool {
        let marksRegEx = "[0-9]{1,3}"

        let marksPred = NSPredicate(format:"SELF MATCHES %@", marksRegEx)
        return marksPred.evaluate(with: marksPred)
    }

    var returnValue = true
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {

    
        if(textField == english1){
            returnValue = true
        }
        if(textField == sanskrit1){
            if(Int(english1.text!)! <= 100){
                returnValue = true
            }else
            {
                returnValue = false
            }
        }
        if(textField == maths1A){
            if(Int(sanskrit1.text!)! <= 100){
                returnValue = true
            }else
            {
                returnValue = false
            }
        }
            if(textField == maths1B){
                if(Int(maths1A.text!)! <= 100){
                    returnValue = true
                }else
                {
                    returnValue = false
                }
            }
                if(textField == physics1){
                    if(Int(maths1B.text!)! <= 100){
                        returnValue = true
                    }else
                    {
                        returnValue = false
                    }
        }
                    if(textField == chemistry1){
                        if(Int(physics1.text!)! <= 100){
                            returnValue = true
                        }else
                        {
                            returnValue = false
                        }
                      }
    return returnValue
    
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {

//        if(Int(textField.text!)! <= 100){
//            return true
//            print("123")
//}
        if(textField == english1 || textField == sanskrit1 || textField == maths1A || textField == maths1B || textField == physics1 || textField == chemistry1)
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
            self.interDetails.interFirstYearMarks.append(self.english1.text!)
            self.interDetails.interFirstYearMarks.append(self.sanskrit1.text!)
            self.interDetails.interFirstYearMarks.append(self.maths1A.text!)
            self.interDetails.interFirstYearMarks.append(self.maths1B.text!)
            self.interDetails.interFirstYearMarks.append(self.physics1.text!)
            self.interDetails.interFirstYearMarks.append(self.chemistry1.text!)
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

