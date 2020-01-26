//
//  Btech2-1.swift
//  dataTranferMethod
//
//  Created by Varalakshmi Kacherla on 11/12/19.
//  Copyright © 2019 Varalakshmi Kacherla. All rights reserved.
//

import UIKit

class Btech2_1: UIViewController,UITextFieldDelegate{
    
    @IBOutlet weak var maths3: UITextField!
    
    @IBOutlet weak var EDC: UITextField!
    
    @IBOutlet weak var EC: UITextField!
    
    @IBOutlet weak var STLD: UITextField!
    @IBOutlet weak var SS: UITextField!
    @IBOutlet weak var PTSP: UITextField!
    
    var btechDetails = BtechMarksDetails()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        maths3.delegate = self
        EDC.delegate = self
        EC.delegate = self
        STLD.delegate = self
        SS.delegate = self
        PTSP.delegate = self
        
        
        
        
        // Do any additional setup after loading the view.
    }
    
    func isValidMarks(marks:String) -> Bool {
        let marksRegEx = "[0-9]{1,3}"
        
        let marksPred = NSPredicate(format:"SELF MATCHES %@", marksRegEx)
        return marksPred.evaluate(with: marksPred)
    }
    
    var returnValue = true
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        if(textField == maths3){
            returnValue = true
        }
        if(textField == EDC){
            if(Int(maths3.text!)! <= 100){
                returnValue = true
            }else
            {
                returnValue = false
            }
        }
        if(textField == PTSP){
            if(Int(EDC.text!)! <= 100){
                returnValue = true
            }else
            {
                returnValue = false
            }
        }
        if(textField == EC){
            if(Int(PTSP.text!)! <= 100){
                returnValue = true
            }else
            {
                returnValue = false
            }
        }
        if(textField == SS){
            if(Int(EC.text!)! <= 100){
                returnValue = true
            }else
            {
                returnValue = false
            }
        }
        if(textField == STLD){
            if(Int(SS.text!)! <= 100){
                returnValue = true
            }else
            {
                returnValue = false
            }
        }
        
        return returnValue
        
    }
    
    
    
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        
        
        if(textField == maths3 || textField == EDC || textField == PTSP || textField == EC || textField == SS || textField == STLD)
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
            self.btechDetails.btechSecondYear1Marks.append(self.maths3.text!)
            self.btechDetails.btechSecondYear1Marks.append(self.EDC.text!)
            self.btechDetails.btechSecondYear1Marks.append(self.PTSP.text!)
            self.btechDetails.btechSecondYear1Marks.append(self.EC.text!)
            self.btechDetails.btechSecondYear1Marks.append(self.SS.text!)
            self.btechDetails.btechSecondYear1Marks.append(self.STLD.text!)

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
