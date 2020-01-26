//
//  Btech3-2.swift
//  dataTranferMethod
//
//  Created by Varalakshmi Kacherla on 11/12/19.
//  Copyright © 2019 Varalakshmi Kacherla. All rights reserved.
//

import UIKit

class Btech3_2: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var MEFA: UITextField!
    
    @IBOutlet weak var DM: UITextField!
    
    @IBOutlet weak var DC: UITextField!
    
    @IBOutlet weak var DSP: UITextField!
    
    @IBOutlet weak var MPMC: UITextField!
    @IBOutlet weak var VLSI: UITextField!
    
    var btechDetails = BtechMarksDetails()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        MEFA.delegate = self
        DM.delegate = self
        DC.delegate = self
        DSP.delegate = self
        MPMC.delegate = self
        VLSI.delegate = self

        // Do any additional setup after loading the view.
    }
    

    
    
    func isValidMarks(marks:String) -> Bool {
        let marksRegEx = "[0-9]{1,3}"
        
        let marksPred = NSPredicate(format:"SELF MATCHES %@", marksRegEx)
        return marksPred.evaluate(with: marksPred)
    }
    
    var returnValue = true
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        if(textField == MEFA){
            returnValue = true
        }
        if(textField == DM){
            if(Int(MEFA.text!)! <= 100){
                returnValue = true
            }else
            {
                returnValue = false
            }
        }
        if(textField == DC){
            if(Int(DM.text!)! <= 100){
                returnValue = true
            }else
            {
                returnValue = false
            }
        }
        if(textField == VLSI){
            if(Int(DC.text!)! <= 100){
                returnValue = true
            }else
            {
                returnValue = false
            }
        }
        if(textField == MPMC){
            if(Int(VLSI.text!)! <= 100){
                returnValue = true
            }else
            {
                returnValue = false
            }
        }
        if(textField == DSP){
            if(Int(MPMC.text!)! <= 100){
                returnValue = true
            }else
            {
                returnValue = false
            }
        }
        
        return returnValue
        
    }
    
    
    
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        
        
        if(textField == MEFA || textField == DM || textField == DC || textField == VLSI || textField == MPMC || textField == DSP)
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
            self.btechDetails.btechThirdYear1Marks.append(self.MEFA.text!)
            self.btechDetails.btechThirdYear1Marks.append(self.DM.text!)
            self.btechDetails.btechThirdYear1Marks.append(self.DC.text!)
            self.btechDetails.btechThirdYear1Marks.append(self.VLSI.text!)
            self.btechDetails.btechThirdYear1Marks.append(self.MPMC.text!)
            self.btechDetails.btechThirdYear1Marks.append(self.DSP.text!)

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
