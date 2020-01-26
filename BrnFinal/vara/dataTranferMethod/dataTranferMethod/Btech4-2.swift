//
//  Btech4-2.swift
//  dataTranferMethod
//
//  Created by Varalakshmi Kacherla on 11/12/19.
//  Copyright © 2019 Varalakshmi Kacherla. All rights reserved.
//

import UIKit

class Btech4_2: UIViewController,UITextFieldDelegate {
    
    
    @IBOutlet weak var SC: UITextField!
    
    
    @IBOutlet weak var WC: UITextField!
    
    
    @IBOutlet weak var RS: UITextField!
    
    @IBOutlet weak var miniProject: UITextField!
    
    @IBOutlet weak var VIVA: UITextField!
    
    @IBOutlet weak var project: UITextField!
    
    var btechDetail = BtechMarksDetails()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SC.delegate = self
        WC.delegate = self
        RS.delegate = self
        miniProject.delegate = self
        VIVA.delegate = self
        project.delegate = self

        // Do any additional setup after loading the view.
    }
    
    
    
    func isValidMarks(marks:String) -> Bool {
        let marksRegEx = "[0-9]{1,3}"
        
        let marksPred = NSPredicate(format:"SELF MATCHES %@", marksRegEx)
        return marksPred.evaluate(with: marksPred)
    }
    
    var returnValue = false
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        if(textField == SC){
            returnValue = true
        }
        if(textField == WC){
            if(Int(SC.text!)! <= 100){
                returnValue = true
            }else
            {
                returnValue = false
            }
        }
        if(textField == RS){
            if(Int(WC.text!)! <= 100){
                returnValue = true
            }else
            {
                returnValue = false
            }
        }
        if(textField == miniProject){
            if(Int(RS.text!)! <= 100){
                returnValue = true
            }else
            {
                returnValue = false
            }
        }
        if(textField == VIVA){
            if(Int(miniProject.text!)! <= 50){
                returnValue = true
            }else
            {
                returnValue = false
            }
        }
        if(textField == project){
            if(Int(VIVA.text!)! <= 100){
                returnValue = true
            }else
            {
                returnValue = false
            }
        }
        
        return returnValue
        
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.backgroundColor = UIColor.yellow
    }
    
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        
        
        if(textField == SC || textField == WC || textField == RS || textField == miniProject || textField == VIVA || textField == project)
        {
            returnValue = isValidMarks(marks: textField.text!)
        }
        
        return returnValue
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.backgroundColor = UIColor.white
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool
    {
    return true
    }
    
    
    @IBAction func submitBtnTapped(_ sender: Any) {
        dismiss(animated: true) {
            
        
        self.btechDetail.btechFourthYear2Marks.append(self.SC.text!)
        self.btechDetail.btechFourthYear2Marks.append(self.WC.text!)
        self.btechDetail.btechFourthYear2Marks.append(self.RS.text!)
        self.btechDetail.btechFourthYear2Marks.append(self.miniProject.text!)
        self.btechDetail.btechFourthYear2Marks.append(self.VIVA.text!)
        self.btechDetail.btechFourthYear2Marks.append(self.project.text!)
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
