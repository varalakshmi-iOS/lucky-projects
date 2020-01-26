//
//  BtechViewController.swift
//  dataTranferThroghPresent
//
//  Created by Varalakshmi Kacherla on 11/18/19.
//  Copyright © 2019 Varalakshmi Kacherla. All rights reserved.
//

import UIKit

class BtechViewController: UIViewController {
    
    @IBOutlet weak var english: UITextField!
    
    @IBOutlet weak var physics: UITextField!
    @IBOutlet weak var chemistry: UITextField!
    
    @IBOutlet weak var maths1: UITextField!
    @IBOutlet weak var maths2: UITextField!
    @IBOutlet weak var CPDS: UITextField!
    @IBOutlet weak var drawing: UITextField!
    
    
    @IBOutlet weak var maths3: UITextField!
    @IBOutlet weak var EDC: UITextField!
    @IBOutlet weak var PTSP: UITextField!
    @IBOutlet weak var EC: UITextField!
    @IBOutlet weak var SS: UITextField!
    @IBOutlet weak var STLD: UITextField!
    
    
    @IBOutlet weak var PEE: UITextField!
    @IBOutlet weak var ECA: UITextField!
    @IBOutlet weak var PDC: UITextField!
    @IBOutlet weak var ES: UITextField!
    @IBOutlet weak var EMTL: UITextField!
    @IBOutlet weak var DDVHDL: UITextField!
    
    @IBOutlet weak var CS: UITextField!
    @IBOutlet weak var COOS: UITextField!
    @IBOutlet weak var AWS: UITextField!
    @IBOutlet weak var EMI: UITextField!
    @IBOutlet weak var AC: UITextField!
    @IBOutlet weak var IC: UITextField!
    
    @IBOutlet weak var MEFA: UITextField!
    @IBOutlet weak var DM: UITextField!
    @IBOutlet weak var DC: UITextField!
    @IBOutlet weak var VLSI: UITextField!
    @IBOutlet weak var MPMC: UITextField!
    @IBOutlet weak var DSP: UITextField!
    
    @IBOutlet weak var MS: UITextField!
    @IBOutlet weak var ME: UITextField!
    @IBOutlet weak var CN: UITextField!
    @IBOutlet weak var CMC: UITextField!
    @IBOutlet weak var OOPS: UITextField!
    @IBOutlet weak var ESD: UITextField!
    
    
    @IBOutlet weak var SC: UITextField!
    @IBOutlet weak var WC: UITextField!
    @IBOutlet weak var RS: UITextField!
    @IBOutlet weak var miniProject: UITextField!
    @IBOutlet weak var VIVA: UITextField!
    @IBOutlet weak var Project: UITextField!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    var alertController:UIAlertController!
    var alertAction:UIAlertAction!
    
    var personalDetailsArray:[String] = []
    var interMarksArray:[String] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()

        print(personalDetailsArray)
        
        // Do any additional setup after loading the view.
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
    
    
    @IBAction func nextBtn(_ sender: Any) {
        
//        if((english.text?.isEmpty)! || (physics.text?.isEmpty)! || (chemistry.text?.isEmpty)! || (maths1.text?.isEmpty)! || (maths2.text?.isEmpty)! || (CPDS.text?.isEmpty)! || (drawing.text?.isEmpty)! || (maths3.text?.isEmpty)! || (EDC.text?.isEmpty)! || (PTSP.text?.isEmpty)! || (EC.text?.isEmpty)! || (SS.text?.isEmpty)! || (STLD.text?.isEmpty)! || (PEE.text?.isEmpty)! || (ECA.text?.isEmpty)! || (PDC.text?.isEmpty)! || (ES.text?.isEmpty)! || (EMTL.text?.isEmpty)! || (DDVHDL.text?.isEmpty)! || (CS.text?.isEmpty)! || (COOS.text?.isEmpty)! || (AWS.text?.isEmpty)! || (EMI.text?.isEmpty)! || (AC.text?.isEmpty)! || (IC.text?.isEmpty)! || (MEFA.text?.isEmpty)! || (DM.text?.isEmpty)! || (DC.text?.isEmpty)! || (VLSI.text?.isEmpty)! || (MPMC.text?.isEmpty)! || (DSP.text?.isEmpty)! || (MS.text?.isEmpty)! || (ME.text?.isEmpty)! || (CN.text?.isEmpty)! || (CMC.text?.isEmpty)! || (OOPS.text?.isEmpty)! || (ESD.text?.isEmpty)! || (SC.text?.isEmpty)! || (WC.text?.isEmpty)! || (RS.text?.isEmpty)! || (miniProject.text?.isEmpty)! || (VIVA.text?.isEmpty)!)
//        {
//        getAlert(titleName: "OK", messageDetails: "Enter All Fields")
//        } else
//        {
        let resultVC = storyboard?.instantiateViewController(withIdentifier: "resultVC") as! ResultViewController
            present(resultVC, animated: true) {
                
                resultVC.firstNameLbl.text = self.personalDetailsArray[0]
                resultVC.lastNameLbl.text = self.personalDetailsArray[1]
                resultVC.ageLbl.text = self.personalDetailsArray[2]
                resultVC.qualificationLbl.text = self.personalDetailsArray[3]
//
                resultVC.calcInterFirstYear(englishMarks: Int(self.interMarksArray[0])!, sanskriMarks: Int(self.interMarksArray[1])!, maths1aMarks: Int(self.interMarksArray[2])!, maths1bMarks: Int(self.interMarksArray[3])!, physicsMarks: Int(self.interMarksArray[4])!, chemistryMarks: Int(self.interMarksArray[5])!)

                resultVC.calcInterSecondYear(englishMarks: Int(self.interMarksArray[6])!, sanskriMarks: Int(self.interMarksArray[7])!, maths1aMarks: Int(self.interMarksArray[8])!, maths1bMarks: Int(self.interMarksArray[9])!, physicsMarks: Int(self.interMarksArray[10])!, chemistryMarks: Int(self.interMarksArray[11])!)

                resultVC.calcBtechFirstYear(englishMarks: Int(self.english.text!)!, physicsMarks: Int(self.physics.text!)!, chemistryMarks: Int(self.chemistry.text!)!, maths1Marks: Int(self.maths1.text!)!, maths2Marks: Int(self.maths2.text!)!, CPDSMarks: Int(self.CPDS.text!)!, drawingMarks: Int(self.drawing.text!)!)

                resultVC.calcBtech2sem1Year(maths3Marks: Int(self.maths3.text!)!, EDCMarks: Int(self.EDC.text!)!, PTSPMarks: Int(self.PTSP.text!)!, ECMarks: Int(self.EC.text!)!, SSMarks: Int(self.SS.text!)!, STLDMarks: Int(self.STLD.text!)!)

                resultVC.calcBtech2sem2Year(PEEMarks: Int(self.PEE.text!)!, ECAMarks: Int(self.ECA.text!)!, PDCMarks: Int(self.PDC.text!)!, ESMarks: Int(self.ES.text!)!, EMTLMarks: Int(self.EMTL.text!)!, DDVHDLMarks: Int(self.DDVHDL.text!)!)

                resultVC.calcBtech3sem1Year(CSMarks: Int(self.CS.text!)!, COOSMarks: Int(self.COOS.text!)!, AWSMarks: Int(self.AWS.text!)!, EMIMarks: Int(self.EMI.text!)!, ACMarks: Int(self.AC.text!)!, ICMarks: Int(self.IC.text!)!)

                resultVC.calcBtech3sem2Year(MEFAMarks: Int(self.MEFA.text!)!, DMMarks: Int(self.DM.text!)!, DCMarks: Int(self.DC.text!)!, VLSIMarks: Int(self.VLSI.text!)!, MPMCMarks: Int(self.MPMC.text!)!, DSPMarks: Int(self.DSP.text!)!)

                resultVC.calcBtech4sem1Year(MSMarks: Int(self.MS.text!)!, MEMarks: Int(self.ME.text!)!, CNMarks: Int(self.CN.text!)!, CMCMarks: Int(self.CMC.text!)!, OOPSMarks: Int(self.OOPS.text!)!, ESDMarks: Int(self.ESD.text!)!)

                resultVC.calcBtech4sem2Year(SCMarks: Int(self.SC.text!)!, WCMarks: Int(self.WC.text!)!, RSMarks: Int(self.RS.text!)!, miniProjectMarks: Int(self.miniProject.text!)!, VIVAMarks: Int(self.VIVA.text!)!, ProjectMarks: Int(self.Project.text!)!)
                
                }
        
        }
        
    
    @IBAction func segmentedControl(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
        case 1:
            scrollView.setContentOffset(CGPoint(x: 0, y: 600), animated: true)
        case 2:
            scrollView.setContentOffset(CGPoint(x: 0, y: 1200), animated: true)
        case 3:
            scrollView.setContentOffset(CGPoint(x: 0, y: 1800), animated: true)
        case 4:
            scrollView.setContentOffset(CGPoint(x: 0, y: 2400), animated: true)
        case 5:
            scrollView.setContentOffset(CGPoint(x: 0, y: 3000), animated: true)
        case 6:
            scrollView.setContentOffset(CGPoint(x: 0, y: 3700), animated: true)
       
        default:
            print("-----")
        }
    }
    
   
    
    
    
    
}
    
    
    
    


