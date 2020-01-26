//
//  BtechFirstYear.swift
//  dataTranferMethod
//
//  Created by Varalakshmi Kacherla on 11/12/19.
//  Copyright © 2019 Varalakshmi Kacherla. All rights reserved.
//

import UIKit

class BtechFirstYear: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var English: UITextField!
    
    @IBOutlet weak var Physics: UITextField!
    
    @IBOutlet weak var Chemistry: UITextField!
    
    @IBOutlet weak var Maths1: UITextField!
    
    @IBOutlet weak var Drawing: UITextField!
    @IBOutlet weak var CPDS: UITextField!
    @IBOutlet weak var Maths2: UITextField!
    
    var btechDetails = BtechMarksDetails()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        English.delegate = self
        Physics.delegate = self
        Chemistry.delegate = self
        Maths1.delegate = self
        Drawing.delegate = self
        CPDS.delegate = self
        Maths2.delegate = self
        
        
        

        // Do any additional setup after loading the view.
    }
    

    func isValidMarks(marks:String) -> Bool {
        let marksRegEx = "[0-9]{1,3}"
        
        let marksPred = NSPredicate(format:"SELF MATCHES %@", marksRegEx)
        return marksPred.evaluate(with: marksPred)
    }
    
    var returnValue = true
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        if(textField == English){
            returnValue = true
        }
        if(textField == Physics){
            if(Int(English.text!)! <= 100){
                returnValue = true
            }else
            {
                returnValue = false
            }
        }
        if(textField == Chemistry){
            if(Int(Physics.text!)! <= 100){
                returnValue = true
            }else
            {
                returnValue = false
            }
        }
        if(textField == Maths1){
            if(Int(Chemistry.text!)! <= 100){
                returnValue = true
            }else
            {
                returnValue = false
            }
        }
        if(textField == Maths2){
            if(Int(Maths1.text!)! <= 100){
                returnValue = true
            }else
            {
                returnValue = false
            }
        }
        if(textField == CPDS){
            if(Int(Maths2.text!)! <= 100){
                returnValue = true
            }else
            {
                returnValue = false
            }
        }
        if(textField == Drawing){
            if(Int(CPDS.text!)! <= 100){
                returnValue = true
            }else
            {
                returnValue = false
            }
        }
        return returnValue
        
    }
    
    
    
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        
        
        if(textField == English || textField == Physics || textField == Chemistry || textField == Maths1 || textField == Maths2 || textField == CPDS || textField == Drawing)
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
            self.btechDetails.btechFirstYearMarks.append(self.English.text!)
            self.btechDetails.btechFirstYearMarks.append(self.Physics.text!)
            self.btechDetails.btechFirstYearMarks.append(self.Chemistry.text!)
            self.btechDetails.btechFirstYearMarks.append(self.Maths1.text!)
            self.btechDetails.btechFirstYearMarks.append(self.Maths2.text!)
            self.btechDetails.btechFirstYearMarks.append(self.CPDS.text!)
            self.btechDetails.btechFirstYearMarks.append(self.Drawing.text!)
            
            
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
