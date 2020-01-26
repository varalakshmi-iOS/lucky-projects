//
//  InterViewController.swift
//  dataTranferThroghPresent
//
//  Created by Varalakshmi Kacherla on 11/18/19.
//  Copyright © 2019 Varalakshmi Kacherla. All rights reserved.
//

import UIKit

class InterViewController: UIViewController {
    
    @IBOutlet weak var englishTF: UITextField!
    
    @IBOutlet weak var sanskritTF: UITextField!
    
    @IBOutlet weak var maths1aTF: UITextField!
    @IBOutlet weak var maths1bTF: UITextField!
    
    @IBOutlet weak var physicsTF: UITextField!
    
    @IBOutlet weak var chemistryTF: UITextField!
    
    @IBOutlet weak var english2TF: UITextField!
    
    @IBOutlet weak var sanskrit2TF: UITextField!
    
    @IBOutlet weak var maths2aTF: UITextField!
    
    @IBOutlet weak var maths2bTF: UITextField!
    
    @IBOutlet weak var physics2TF: UITextField!
    
    @IBOutlet weak var chemistry2TF: UITextField!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    var alertController:UIAlertController!
    var alertAction:UIAlertAction!
    
    var personalDetails:[String] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      

        
        
    }
    

    
    
    
    @IBAction func nextBtn(_ sender: Any) {
//
//        if((englishTF.text?.isEmpty)! || (sanskritTF.text?.isEmpty)! || (maths1aTF.text?.isEmpty)! || (maths1bTF.text?.isEmpty)! || (physicsTF.text?.isEmpty)! || (chemistryTF.text?.isEmpty)! || (english2TF.text?.isEmpty)! || (sanskrit2TF.text?.isEmpty)! || (maths2aTF.text?.isEmpty)! || (maths2bTF.text?.isEmpty)! || (physics2TF.text?.isEmpty)! || (chemistry2TF.text?.isEmpty)!){
//
//            getAlert(titleName: "OK", messageDetails: "Enter ")
//        } else
//        {
        
       let btechVC = storyboard?.instantiateViewController(withIdentifier: "btechVC") as! BtechViewController
            
            present(btechVC, animated: true) {
                btechVC.personalDetailsArray = self.personalDetails
                
                btechVC.interMarksArray.append(self.englishTF.text!)
                btechVC.interMarksArray.append(self.sanskritTF.text!)
                btechVC.interMarksArray.append(self.maths1aTF.text!)
                btechVC.interMarksArray.append(self.maths1bTF.text!)
                btechVC.interMarksArray.append(self.physicsTF.text!)
                btechVC.interMarksArray.append(self.chemistryTF.text!)
                btechVC.interMarksArray.append(self.english2TF.text!)
                btechVC.interMarksArray.append(self.sanskrit2TF.text!)
                btechVC.interMarksArray.append(self.maths2aTF.text!)
                btechVC.interMarksArray.append(self.maths2bTF.text!)
                btechVC.interMarksArray.append(self.physics2TF.text!)
                btechVC.interMarksArray.append(self.chemistry2TF.text!)
                
//            }
        
            
       
        }
    }
    
   
    @IBAction func segmentedControl(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
        case 1:
            scrollView.setContentOffset(CGPoint(x: 0, y: 700), animated: true)
        default:
            print("---------")
        }
        
       
        
    }
    
    
    func isValidMarks(marks:String) -> Bool {
        let marksRegEx = "[0-9]{2}"
        
        let marksPred = NSPredicate(format:"SELF MATCHES %@", marksRegEx)
        return marksPred.evaluate(with: marks)
    }
    
    func getAlert(titleName:String,messageDetails:String){
        
        alertController = UIAlertController(title: titleName, message: messageDetails, preferredStyle: UIAlertController.Style.alert)
        alertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
        alertController.addAction(alertAction)
        self.present(alertController, animated: true, completion: nil)
        
    }
    

  
    
    
}
