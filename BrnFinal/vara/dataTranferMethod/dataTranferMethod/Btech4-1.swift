//
//  Btech4-1.swift
//  dataTranferMethod
//
//  Created by Varalakshmi Kacherla on 11/12/19.
//  Copyright © 2019 Varalakshmi Kacherla. All rights reserved.
//

import UIKit

class Btech4_1: UIViewController,UITextFieldDelegate {
    
    
    
    @IBOutlet weak var MS: UITextField!
    
    
    @IBOutlet weak var ME: UITextField!
    
    @IBOutlet weak var CN: UITextField!
    
    @IBOutlet weak var CMC: UITextField!
    
    @IBOutlet weak var OOPS: UITextField!
    
    
    @IBOutlet weak var ESD: UITextField!
    var btechDetails = BtechMarksDetails()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        MS.delegate = self
        ME.delegate = self 
        CN.delegate = self
        CMC.delegate = self
        OOPS.delegate = self
        ESD.delegate = self
        

        // Do any additional setup after loading the view.
    }
    

    
    
    func isValidMarks(marks:String) -> Bool {
        let marksRegEx = "[0-9]{1,3}"
        
        let marksPred = NSPredicate(format:"SELF MATCHES %@", marksRegEx)
        return marksPred.evaluate(with: marksPred)
    }
    
    var returnValue = true
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        if(textField == MS){
            returnValue = true
        }
        if(textField == ME){
            if(Int(MS.text!)! <= 100){
                returnValue = true
            }else
            {
                returnValue = false
            }
        }
        if(textField == CN){
            if(Int(ME.text!)! <= 100){
                returnValue = true
            }else
            {
                returnValue = false
            }
        }
        if(textField == CMC){
            if(Int(CN.text!)! <= 100){
                returnValue = true
            }else
            {
                returnValue = false
            }
        }
        if(textField == OOPS){
            if(Int(CMC.text!)! <= 100){
                returnValue = true
            }else
            {
                returnValue = false
            }
        }
        if(textField == ESD){
            if(Int(ESD.text!)! <= 100){
                returnValue = true
            }else
            {
                returnValue = false
            }
        }
        
        return returnValue
        
    }
    
    
    
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        
        
        if(textField == MS || textField == ME || textField == CN || textField == CMC || textField == OOPS || textField == ESD)
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
            self.btechDetails.btechThirdYear1Marks.append(self.MS.text!)
            self.btechDetails.btechThirdYear1Marks.append(self.ME.text!)
            self.btechDetails.btechThirdYear1Marks.append(self.CN.text!)
            self.btechDetails.btechThirdYear1Marks.append(self.CMC.text!)
            self.btechDetails.btechThirdYear1Marks.append(self.OOPS.text!)
            self.btechDetails.btechThirdYear1Marks.append(self.ESD.text!)

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
