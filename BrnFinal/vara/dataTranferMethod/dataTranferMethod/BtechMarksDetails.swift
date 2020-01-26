//
//  BtechMarksDetails.swift
//  dataTranferMethod
//
//  Created by Varalakshmi Kacherla on 11/13/19.
//  Copyright © 2019 Varalakshmi Kacherla. All rights reserved.
//

import UIKit

class BtechMarksDetails: UIViewController {
    
    
    @IBOutlet weak var BtechSC: UISegmentedControl!
    
    
    
    @IBOutlet weak var btech4sem1: UIView!
    
    
    @IBOutlet weak var btech4sem2: UIView!
    
    
    
    @IBOutlet weak var btech3sem2: UIView!
    
    
    @IBOutlet weak var btech3sem1: UIView!
    
    @IBOutlet weak var btech2sem2: UIView!
    
    
    @IBOutlet weak var btech2sem1: UIView!
    
    
    @IBOutlet weak var btechFirstYear: UIView!
    
    var personalDetails:[String] = []
    var interFirstYearMarks:[String] = []
    var interSecondYearMarks:[String] = []
//    var interMarks:[String] = []
    var btechFirstYearMarks:[String] = []
    var btechSecondYear1Marks:[String] = []
     var btechSecondYear2Marks:[String] = []
    var btechThirdYear1Marks:[String] = []
    var btechThirdYear2Marks:[String] = []
    var btechFourthYear1Marks:[String] = []
    var btechFourthYear2Marks:[String] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        // Do any additional setup after loading the view.
    }
    
    
    
    
    
    
    
    @IBAction func segments(_ sender: UISegmentedControl) {
        if(BtechSC.selectedSegmentIndex == 0){
            
            var btech1stView = storyboard?.instantiateViewController(withIdentifier: "btech1st") as! BtechFirstYear
            present(btech1stView, animated: true, completion: nil)
            
            
//        btechFirstYear.isHidden = false
//            btech2sem1.isHidden = true
//            btech2sem2.isHidden = true
//            btech3sem1.isHidden = true
//            btech3sem2.isHidden = true
//            btech4sem1.isHidden = true
//            btech4sem2.isHidden = true
            
        }
        if(BtechSC.selectedSegmentIndex == 1){
            
            var btech2ndView1 = storyboard?.instantiateViewController(withIdentifier: "btech2nd1") as! Btech2_1
            present(btech2ndView1, animated: true, completion: nil)
            
//            btech2sem1.isHidden = false
//            btechFirstYear.isHidden = true
//            btech2sem2.isHidden = true
//            btech3sem1.isHidden = true
//            btech3sem2.isHidden = true
//            btech4sem1.isHidden = true
//            btech4sem2.isHidden = true
        }
        if(BtechSC.selectedSegmentIndex == 2){
            
            var btech2ndView2 = storyboard?.instantiateViewController(withIdentifier: "btech2nd2") as! Btech2_2
            present(btech2ndView2, animated: true, completion: nil)
            
//            btech2sem2.isHidden = false
//            btech2sem1.isHidden = true
//            btechFirstYear.isHidden = true
//            btech3sem1.isHidden = true
//            btech3sem2.isHidden = true
//            btech4sem1.isHidden = true
//            btech4sem2.isHidden = true
//
        }
        if(BtechSC.selectedSegmentIndex == 3){
            
            var btech3rdView1 = storyboard?.instantiateViewController(withIdentifier: "btech3rd1") as! Btech3_1
            present(btech3rdView1, animated: true, completion: nil)
            
            
//            btech3sem1.isHidden = false
//            btech2sem2.isHidden = true
//            btech2sem1.isHidden = true
//            btechFirstYear.isHidden = true
//            btech3sem2.isHidden = true
//            btech4sem1.isHidden = true
//            btech4sem2.isHidden = true
        
        }
        if(BtechSC.selectedSegmentIndex == 4){
            
            var btech3rdView2 = storyboard?.instantiateViewController(withIdentifier: "btech3rd2") as! Btech3_2
            present(btech3rdView2, animated: true, completion: nil)
            
            
            
            
            
            
//            btech3sem2.isHidden = false
//            btech2sem2.isHidden = true
//            btech2sem1.isHidden = true
//            btechFirstYear.isHidden = true
//            btech3sem1.isHidden = true
//            btech4sem1.isHidden = true
//            btech4sem2.isHidden = true
        }
        if(BtechSC.selectedSegmentIndex == 5){
            
            var btech4thView1 = storyboard?.instantiateViewController(withIdentifier: "btech4th1") as! Btech4_1
            present(btech4thView1, animated: true, completion: nil)
            
            
            
            
            
//            btech4sem1.isHidden = false
//            btechFirstYear.isHidden = true
//            btech2sem1.isHidden = true
//            btech2sem2.isHidden = true
//            btech3sem1.isHidden = true
//            btech3sem2.isHidden = true
//            btech4sem2.isHidden = true
        }
        if(BtechSC.selectedSegmentIndex == 6){
            
            var btech4thView2 = storyboard?.instantiateViewController(withIdentifier: "btech4th2") as! Btech4_2
            present(btech4thView2, animated: true, completion: nil)
            
//            btech4sem2.isHidden = false
//            btechFirstYear.isHidden = true
//            btech2sem1.isHidden = true
//            btech2sem2.isHidden = true
//            btech3sem1.isHidden = true
//            btech3sem2.isHidden = true
//            btech4sem1.isHidden = true
        }
        
    }
    
    
    
    
    
    @IBAction func onBtnTap(_ sender: Any) {
        
        let resultVC = storyboard?.instantiateViewController(withIdentifier: "result") as! ResultViewController
        present(resultVC, animated: true, completion: nil)
        
        resultVC.interfirstYear(english: UInt8(interFirstYearMarks[0])!, sanskrit: UInt8(interFirstYearMarks[1])!, maths1A: UInt8(interFirstYearMarks[2])!, maths1B: UInt8(interFirstYearMarks[3])!, physics: UInt8(interFirstYearMarks[4])!, chemistry: UInt8(interFirstYearMarks[5])!)
        
        resultVC.InterSecondYear(english2: UInt8(interSecondYearMarks[0])!, sanskrit2: UInt8(interSecondYearMarks[1])!, maths2A: UInt8(interSecondYearMarks[2])!, maths2B: UInt8(interSecondYearMarks[3])!, physics2: UInt8(interSecondYearMarks[4])!, chemistry2: UInt8(interSecondYearMarks[5])!)
        
        resultVC.btechFirstYear(English: UInt8(btechFirstYearMarks[0])!, Physics: UInt8(btechFirstYearMarks[1])!, Chemistry: UInt8(btechFirstYearMarks[2])!, Maths1: UInt8(btechFirstYearMarks[3])!, Maths2: UInt8(btechFirstYearMarks[4])!, CPDS: UInt8(btechFirstYearMarks[5])!, Drawing: UInt8(btechFirstYearMarks[6])!)
        
        resultVC.btechSecondYearSem1(Maths3: UInt8(btechSecondYear1Marks[0])!, EDC: UInt8(btechSecondYear1Marks[1])!, PTSP: UInt8(btechSecondYear1Marks[2])!, EC: UInt8(btechSecondYear1Marks[3])!, SS: UInt8(btechSecondYear1Marks[4])!, STLD: UInt8(btechSecondYear1Marks[5])!)
        
        resultVC.btechSecondYearSem2(PEE: UInt8(btechSecondYear2Marks[0])!, ECA: UInt8(btechSecondYear2Marks[1])!, PDC: UInt8(btechSecondYear2Marks[2])!, ES: UInt8(btechSecondYear2Marks[3])!, EMTL: UInt8(btechSecondYear2Marks[4])!, DDVHDL: UInt8(btechSecondYear2Marks[5])!)
        
        resultVC.btechThirdYearSem1(CS: UInt8(btechThirdYear1Marks[0])!, COOS: UInt8(btechThirdYear1Marks[1])!, AWS: UInt8(btechThirdYear1Marks[2])!, EMI: UInt8(btechThirdYear1Marks[3])!, AC: UInt8(btechThirdYear1Marks[4])!, IC: UInt8(btechThirdYear1Marks[5])!)
        
        resultVC.btechThirdYearSem2(MEFA: UInt8(btechThirdYear2Marks[0])!, DM: UInt8(btechThirdYear2Marks[1])!, DC: UInt8(btechThirdYear2Marks[2])!, VLSI: UInt8(btechThirdYear2Marks[3])!, MPMC: UInt8(btechThirdYear2Marks[4])!, DSP: UInt8(btechThirdYear2Marks[5])!)
        
        resultVC.btechFourthYearSem1(MS: UInt8(btechFourthYear1Marks[0])!, ME: UInt8(btechFourthYear1Marks[1])!, CN: UInt8(btechFourthYear1Marks[2])!, CMC: UInt8(btechFourthYear1Marks[3])!, OOPS: UInt8(btechFourthYear1Marks[4])!, ESD: UInt8(btechFourthYear1Marks[5])!)
        
        resultVC.btechThirdYearSem2(MEFA: UInt8(btechFourthYear2Marks[0])!, DM: UInt8(btechFourthYear2Marks[1])!, DC: UInt8(btechFourthYear2Marks[2])!, VLSI: UInt8(btechFourthYear2Marks[3])!, MPMC: UInt8(btechFourthYear2Marks[4])!, DSP: UInt8(btechFourthYear2Marks[5])!)
        
        
        
        
        
        
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
