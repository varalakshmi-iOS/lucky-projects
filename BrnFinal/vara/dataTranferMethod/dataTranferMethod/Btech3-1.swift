//
//  Btech3-1.swift
//  dataTranferMethod
//
//  Created by Varalakshmi Kacherla on 11/12/19.
//  Copyright © 2019 Varalakshmi Kacherla. All rights reserved.
//

import UIKit

class Btech3_1: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var CS: UITextField!
    
    
    @IBOutlet weak var COOS: UITextField!
    
    @IBOutlet weak var AWS: UITextField!
    
    @IBOutlet weak var EMI: UITextField!
    
    
    @IBOutlet weak var IC: UITextField!
    @IBOutlet weak var AC: UITextField!
    
    var btechDetails = BtechMarksDetails()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        CS.delegate = self
        COOS.delegate = self
        AWS.delegate = self
        EMI.delegate = self
        IC.delegate = self
        AC.delegate = self
        

        
        
        
        
        // Do any additional setup after loading the view.
    }
    

    
    func isValidMarks(marks:String) -> Bool {
        let marksRegEx = "[0-9]{1,3}"
        
        let marksPred = NSPredicate(format:"SELF MATCHES %@", marksRegEx)
        return marksPred.evaluate(with: marksPred)
    }
    
    var returnValue = true
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        if(textField == CS){
            returnValue = true
        }
        if(textField == COOS){
            if(Int(CS.text!)! <= 100){
                returnValue = true
            }else
            {
                returnValue = false
            }
        }
        if(textField == AWS){
            if(Int(COOS.text!)! <= 100){
                returnValue = true
            }else
            {
                returnValue = false
            }
        }
        if(textField == EMI){
            if(Int(AWS.text!)! <= 100){
                returnValue = true
            }else
            {
                returnValue = false
            }
        }
        if(textField == AC){
            if(Int(EMI.text!)! <= 100){
                returnValue = true
            }else
            {
                returnValue = false
            }
        }
        if(textField == IC){
            if(Int(AC.text!)! <= 100){
                returnValue = true
            }else
            {
                returnValue = false
            }
        }
        
        return returnValue
        
    }
    
    
    
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        
        
        if(textField == CS || textField == COOS || textField == AWS || textField == EMI || textField == AC || textField == IC)
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
            self.btechDetails.btechThirdYear1Marks.append(self.CS.text!)
            self.btechDetails.btechThirdYear1Marks.append(self.COOS.text!)
            self.btechDetails.btechThirdYear1Marks.append(self.AWS.text!)
            self.btechDetails.btechThirdYear1Marks.append(self.EMI.text!)
            self.btechDetails.btechThirdYear1Marks.append(self.AC.text!)
            self.btechDetails.btechThirdYear1Marks.append(self.IC.text!)

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
