//
//  Btech2-2.swift
//  dataTranferMethod
//
//  Created by Varalakshmi Kacherla on 11/12/19.
//  Copyright © 2019 Varalakshmi Kacherla. All rights reserved.
//

import UIKit

class Btech2_2: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var PEE: UITextField!
    
    @IBOutlet weak var ECA: UITextField!
    
    @IBOutlet weak var ES: UITextField!
    
    @IBOutlet weak var EMTL: UITextField!
    @IBOutlet weak var PDC: UITextField!
    
    @IBOutlet weak var DDVHDL: UITextField!
    
    var btechDetails = BtechMarksDetails()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        PEE.delegate = self
        ECA.delegate = self
        ES.delegate = self
        EMTL.delegate = self
        PDC.delegate = self
        DDVHDL.delegate = self
        

        // Do any additional setup after loading the view.
    }
    
    
    
    
    func isValidMarks(marks:String) -> Bool {
        let marksRegEx = "[0-9]{1,3}"
        
        let marksPred = NSPredicate(format:"SELF MATCHES %@", marksRegEx)
        return marksPred.evaluate(with: marksPred)
    }
    
    var returnValue = true
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        if(textField == PEE){
            returnValue = true
        }
        if(textField == ECA){
            if(Int(PEE.text!)! <= 100){
                returnValue = true
            }else
            {
                returnValue = false
            }
        }
        if(textField == PDC){
            if(Int(ECA.text!)! <= 100){
                returnValue = true
            }else
            {
                returnValue = false
            }
        }
        if(textField == ES){
            if(Int(PDC.text!)! <= 100){
                returnValue = true
            }else
            {
                returnValue = false
            }
        }
        if(textField == EMTL){
            if(Int(ES.text!)! <= 100){
                returnValue = true
            }else
            {
                returnValue = false
            }
        }
        if(textField == DDVHDL){
            if(Int(EMTL.text!)! <= 100){
                returnValue = true
            }else
            {
                returnValue = false
            }
        }
        
        return returnValue
        
    }
    
    
    
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        
        
        if(textField == PEE || textField == ECA || textField == PDC || textField == ES || textField == EMTL || textField == DDVHDL)
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
    
    
    
    @IBAction func submitBtnTapped(_ sender: Any) {
        
        dismiss(animated: true) {
            self.btechDetails.btechSecondYear2Marks.append(self.PEE.text!)
            self.btechDetails.btechSecondYear2Marks.append(self.ECA.text!)
            self.btechDetails.btechSecondYear2Marks.append(self.PDC.text!)
            self.btechDetails.btechSecondYear2Marks.append(self.ES.text!)
            self.btechDetails.btechSecondYear2Marks.append(self.EMTL.text!)
            self.btechDetails.btechSecondYear2Marks.append(self.DDVHDL.text!)

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
