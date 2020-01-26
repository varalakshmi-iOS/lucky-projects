//
//  InterMarksDetails.swift
//  dataTranferMethod
//
//  Created by Varalakshmi Kacherla on 11/13/19.
//  Copyright © 2019 Varalakshmi Kacherla. All rights reserved.
//

import UIKit

class InterMarksDetails: UIViewController {
    
    
    @IBOutlet weak var InterSegement: UISegmentedControl!
    
  
   
    @IBOutlet weak var firstYear: UIView!
    
    @IBOutlet weak var secondYear: UIView!
    
    var personalDetails:[String] = []
    var interFirstYearMarks:[String] = []
    var interSecondYearMarks:[String] = []
   
    
    


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
   
    @IBAction func segmentedControl(_ sender: Any) {
        
        if(InterSegement.selectedSegmentIndex == 0){
            var inter1stView = storyboard?.instantiateViewController(withIdentifier: "inter1st") as! InterFirstYear
            
            present(inter1stView, animated: true, completion: nil)
        }else{
            var inter2ndView = storyboard?.instantiateViewController(withIdentifier: "inter2nd") as! InterSecondYear
            
            present(inter2ndView, animated: true, completion: nil)
        }

        
        
    }
    
    
    
    @IBAction func onBtnTap(_ sender: Any) {
        
        var btechVC = storyboard?.instantiateViewController(withIdentifier: "BtechMarks") as! BtechMarksDetails
        
                present(btechVC, animated: true, completion: nil)
        
                btechVC.personalDetails = personalDetails
        btechVC.interFirstYearMarks = interFirstYearMarks
        btechVC.interSecondYearMarks = interSecondYearMarks
        
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

