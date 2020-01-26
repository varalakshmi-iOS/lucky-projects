//
//  ResultViewController.swift
//  dataTranferThroghPresent
//
//  Created by Varalakshmi Kacherla on 11/18/19.
//  Copyright © 2019 Varalakshmi Kacherla. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    
    @IBOutlet weak var firstNameLbl: UILabel!
    @IBOutlet weak var lastNameLbl: UILabel!
    @IBOutlet weak var ageLbl: UILabel!
    @IBOutlet weak var qualificationLbl: UILabel!
    
    @IBOutlet weak var inter1YrResult: UILabel!
    @IBOutlet weak var inter1YrTotal: UILabel!
    @IBOutlet weak var inter1YrPerc: UILabel!
    @IBOutlet weak var inter1YrGrade: UILabel!
    
    @IBOutlet weak var inter2YrResult: UILabel!
    @IBOutlet weak var inter2YrTotal: UILabel!
    @IBOutlet weak var inter2YrPerc: UILabel!
    @IBOutlet weak var inter2YrGrade: UILabel!
    
    @IBOutlet weak var btech1YrResult: UILabel!
    @IBOutlet weak var btech1YrTotal: UILabel!
    @IBOutlet weak var btech1YrPerc: UILabel!
    @IBOutlet weak var btech1YrGrade: UILabel!
    
    @IBOutlet weak var btech2_1Result: UILabel!
    @IBOutlet weak var btech2_1Total: UILabel!
    @IBOutlet weak var btech2_1Perc: UILabel!
    @IBOutlet weak var btech2_1Grade: UILabel!
    
    @IBOutlet weak var btech2_2Result: UILabel!
    @IBOutlet weak var btech2_2Total: UILabel!
    @IBOutlet weak var btech2_2Perc: UILabel!
    @IBOutlet weak var btech2_2Grade: UILabel!
    
    @IBOutlet weak var btech3_1Result: UILabel!
    @IBOutlet weak var btech3_1Total: UILabel!
    @IBOutlet weak var btech3_1Perc: UILabel!
    @IBOutlet weak var btech3_1Grade: UILabel!
    
    @IBOutlet weak var btech3_2Result: UILabel!
    @IBOutlet weak var btech3_2Total: UILabel!
    @IBOutlet weak var btech3_2Perc: UILabel!
    @IBOutlet weak var btech3_2Grade: UILabel!
    
    
    @IBOutlet weak var btech4_1Result: UILabel!
    @IBOutlet weak var btech4_1Total: UILabel!
    @IBOutlet weak var btech4_1Perc: UILabel!
    @IBOutlet weak var btech4_1Grade: UILabel!
    
    @IBOutlet weak var btech4_2Result: UILabel!
    @IBOutlet weak var btech4_2Total: UILabel!
    @IBOutlet weak var btech4_2Perc: UILabel!
    @IBOutlet weak var btech4_2Grade: UILabel!
    
    
    
    
    
    
    
   
    
    
    
    
    

    override func viewDidLoad()
    {
        super.viewDidLoad()

        
    }
    

    // function for inter First Year
    func calcInterFirstYear(englishMarks:Int,sanskriMarks:Int,maths1aMarks:Int,maths1bMarks:Int,physicsMarks:Int,chemistryMarks:Int){
        
        let interFirstYearTotal:Int = englishMarks + sanskriMarks + maths1aMarks + maths1bMarks + physicsMarks + chemistryMarks
        
        // calculating total marks
        
        inter1YrTotal.text = "\(interFirstYearTotal)"
        
        // calculating percentage
        
        let interFirstYearPercentage:Float = Float((interFirstYearTotal/600)*100)
        
        inter1YrPerc.text = "\(interFirstYearPercentage)"
        
        let passMarks = 35
        var english:Bool = false
        var sanskrit:Bool = false
        var maths1a:Bool = false
        var maths1b:Bool = false
        var physics:Bool = false
        var chemistry:Bool = false
        
        if(englishMarks >= passMarks){
            english = true
        }else{
            english = false
        }
        if(sanskriMarks >= passMarks){
            sanskrit = true
        }else{
            sanskrit = false
        }
        if(maths1aMarks >= passMarks){
            maths1a = true
        }else{
            maths1a = false
        }
        if(maths1bMarks >= passMarks){
            maths1b = true
        }else{
            maths1b = false
        }
        if(physicsMarks >= passMarks){
            physics = true
        }else{
            physics = false
        }
        if(chemistryMarks >= passMarks){
            chemistry = true
        }else{
            chemistry = false
        }
        
        if(english == true && sanskrit == true && maths1a == true && maths1b == true && physics == true && chemistry == true){
            
            switch interFirstYearPercentage {
            case 75...100:
                inter1YrGrade.text = "A"
            case 60..<75:
                inter1YrGrade.text = "B"
            case 50..<60:
                inter1YrGrade.text = "C"
            default:
                inter1YrGrade.text = "D"
            }
            inter1YrResult.text = "PASSED"
        
    }else
        {
            inter1YrResult.text = "FAILED"
        }
    

}
    
     // function for inter Second Year
    func calcInterSecondYear(englishMarks:Int,sanskriMarks:Int,maths1aMarks:Int,maths1bMarks:Int,physicsMarks:Int,chemistryMarks:Int){
        
        let interSecondYearTotal:Int = englishMarks + sanskriMarks + maths1aMarks + maths1bMarks + physicsMarks + chemistryMarks
        
        // calculating total marks
        
        inter2YrTotal.text = "\(interSecondYearTotal)"
        
        // calculating percentage
        
        let interSecondYearPercentage:Float = Float((interSecondYearTotal/600)*100)
        
        inter2YrPerc.text = "\(interSecondYearPercentage)"
        
        let passMarks = 35
        var english:Bool = false
        var sanskrit:Bool = false
        var maths1a:Bool = false
        var maths1b:Bool = false
        var physics:Bool = false
        var chemistry:Bool = false
        
        if(englishMarks >= passMarks){
            english = true
        }else{
            english = false
        }
        if(sanskriMarks >= passMarks){
            sanskrit = true
        }else{
            sanskrit = false
        }
        if(maths1aMarks >= passMarks){
            maths1a = true
        }else{
            maths1a = false
        }
        if(maths1bMarks >= passMarks){
            maths1b = true
        }else{
            maths1b = false
        }
        if(physicsMarks >= passMarks){
            physics = true
        }else{
            physics = false
        }
        if(chemistryMarks >= passMarks){
            chemistry = true
        }else{
            chemistry = false
        }
        
        if(english == true && sanskrit == true && maths1a == true && maths1b == true && physics == true && chemistry == true){
            
            switch interSecondYearPercentage {
            case 75...100:
                inter2YrGrade.text = "A"
            case 60..<75:
                inter2YrGrade.text = "B"
            case 50..<60:
                inter2YrGrade.text = "C"
            default:
                inter2YrGrade.text = "D"
            }
            inter2YrResult.text = "PASSED"
            
        }else
        {
            inter2YrResult.text = "FAILED"
        }
        
        
    }
    
    // function for B.Tech First Year
    
    func calcBtechFirstYear(englishMarks:Int,physicsMarks:Int,chemistryMarks:Int,maths1Marks:Int,maths2Marks:Int,CPDSMarks:Int,drawingMarks:Int){
        
        let btechFirstYearTotal:Int = englishMarks + physicsMarks + chemistryMarks + maths1Marks + maths2Marks + CPDSMarks + drawingMarks
        
        // calculating total marks
        
        btech1YrTotal.text = "\(btechFirstYearTotal)"
        
        // calculating percentage
        
        let btechFirstYearPercentage:Float = Float((btechFirstYearTotal/600)*100)
        
        btech1YrPerc.text = "\(btechFirstYearPercentage)"
        
        let passMarks = 35
        var english:Bool = false
        var physics:Bool = false
        var chemistry:Bool = false
        var maths1:Bool = false
        var maths2:Bool = false
        var CPDS:Bool = false
        var drawing:Bool = false

        
        if(englishMarks >= passMarks){
            english = true
        }else{
            english = false
        }
        if(physicsMarks >= passMarks){
            physics = true
        }else{
            physics = false
        }
        if(chemistryMarks >= passMarks){
            chemistry = true
        }else{
            chemistry = false
        }
        if(maths1Marks >= passMarks){
            maths1 = true
        }else{
            maths1 = false
        }
        if(maths2Marks >= passMarks){
            maths2 = true
        }else{
            maths2 = false
        }
        if(CPDSMarks >= passMarks){
            CPDS = true
        }else{
            CPDS = false
        }
        if(drawingMarks >= passMarks){
            drawing = true
        }else{
            drawing = false
        }
        
        
        if(english == true && physics == true && chemistry == true && maths1 == true && maths2 == true && CPDS == true && drawing == true){
            
            switch btechFirstYearPercentage {
            case 75...100:
                btech1YrGrade.text = "A"
            case 60..<75:
                btech1YrGrade.text = "B"
            case 50..<60:
                btech1YrGrade.text = "C"
            default:
                btech1YrGrade.text = "D"
            }
            btech1YrResult.text = "PASSED"
            
        }else
        {
            btech1YrResult.text = "FAILED"
        }
}
    
     // function for B.Tech Second Year Sem-1
    func calcBtech2sem1Year(maths3Marks:Int,EDCMarks:Int,PTSPMarks:Int,ECMarks:Int,SSMarks:Int,STLDMarks:Int){
        
        let btech2sem1Total:Int = maths3Marks + EDCMarks + PTSPMarks + ECMarks + SSMarks + STLDMarks
        
        // calculating total marks
        
        btech2_1Total.text = "\(btech2sem1Total)"
        
        // calculating percentage
        
        let btech2sem1Percentage:Float = Float((btech2sem1Total/600)*100)
        
        btech2_1Perc.text = "\(btech2sem1Percentage)"
        
        let passMarks = 35
        var maths3:Bool = false
        var EDC:Bool = false
        var PTSP:Bool = false
        var EC:Bool = false
        var SS:Bool = false
        var STLD:Bool = false
        
        
        if(maths3Marks >= passMarks){
            maths3 = true
        }else{
            maths3 = false
        }
        if(EDCMarks >= passMarks){
            EDC = true
        }else{
            EDC = false
        }
        if(PTSPMarks >= passMarks){
            PTSP = true
        }else{
            PTSP = false
        }
        if(ECMarks >= passMarks){
            EC = true
        }else{
            EC = false
        }
        if(SSMarks >= passMarks){
            SS = true
        }else{
            SS = false
        }
        if(STLDMarks >= passMarks){
            STLD = true
        }else{
            STLD = false
        }
        
        
        
        if(maths3 == true && EDC == true && PTSP == true && EC == true && SS == true && STLD == true){
            
            switch btech2sem1Percentage {
            case 75...100:
                btech2_1Grade.text = "A"
            case 60..<75:
                btech2_1Grade.text = "B"
            case 50..<60:
                btech2_1Grade.text = "C"
            default:
                btech2_1Grade.text = "D"
            }
            btech2_1Result.text = "PASSED"
            
        }else
        {
            btech2_1Result.text = "FAILED"
        }
    }
    
    
    // function for B.Tech Second Year Sem-2
    func calcBtech2sem2Year(PEEMarks:Int,ECAMarks:Int,PDCMarks:Int,ESMarks:Int,EMTLMarks:Int,DDVHDLMarks:Int){
        
        let btech2sem2Total:Int = PEEMarks + ECAMarks + PDCMarks + ESMarks + EMTLMarks + DDVHDLMarks
        
        // calculating total marks
        
        btech2_2Total.text = "\(btech2sem2Total)"
        
        // calculating percentage
        
        let btech2sem2Percentage:Float = Float((btech2sem2Total/600)*100)
        
        btech2_2Perc.text = "\(btech2sem2Percentage)"
        
        let passMarks = 35
        var PEE:Bool = false
        var ECA:Bool = false
        var PDC:Bool = false
        var ES:Bool = false
        var EMTL:Bool = false
        var DDVHDL:Bool = false
        
        
        if(PEEMarks >= passMarks){
            PEE = true
        }else{
            PEE = false
        }
        if(ECAMarks >= passMarks){
            ECA = true
        }else{
            ECA = false
        }
        if(PDCMarks >= passMarks){
            PDC = true
        }else{
            PDC = false
        }
        if(ESMarks >= passMarks){
            ES = true
        }else{
            ES = false
        }
        if(EMTLMarks >= passMarks){
            EMTL = true
        }else{
            EMTL = false
        }
        if(DDVHDLMarks >= passMarks){
            DDVHDL = true
        }else{
            DDVHDL = false
        }
        
        
        
        if(PEE == true && ECA == true && PDC == true && ES == true && EMTL == true && DDVHDL == true){
            
            switch btech2sem2Percentage {
            case 75...100:
                btech2_2Grade.text = "A"
            case 60..<75:
                btech2_2Grade.text = "B"
            case 50..<60:
                btech2_2Grade.text = "C"
            default:
                btech2_2Grade.text = "D"
            }
            btech2_2Result.text = "PASSED"
            
        }else
        {
            btech2_2Result.text = "FAILED"
        }
    }
    
    
    // function for B.Tech 3rd Year Sem-1
    func calcBtech3sem1Year(CSMarks:Int,COOSMarks:Int,AWSMarks:Int,EMIMarks:Int,ACMarks:Int,ICMarks:Int){
        
        let btech3sem1Total:Int = CSMarks + COOSMarks + AWSMarks + EMIMarks + ACMarks + ICMarks
        
        // calculating total marks
        
        btech3_1Total.text = "\(btech3sem1Total)"
        
        // calculating percentage
        
        let btech3sem1Percentage:Float = Float((btech3sem1Total/600)*100)
        
        btech3_1Perc.text = "\(btech3sem1Percentage)"
        
        let passMarks = 35
        var CS:Bool = false
        var COOS:Bool = false
        var AWS:Bool = false
        var EMI:Bool = false
        var AC:Bool = false
        var IC:Bool = false
        
        
        if(CSMarks >= passMarks){
            CS = true
        }else{
            CS = false
        }
        if(COOSMarks >= passMarks){
            COOS = true
        }else{
            COOS = false
        }
        if(AWSMarks >= passMarks){
            AWS = true
        }else{
            AWS = false
        }
        if(EMIMarks >= passMarks){
            EMI = true
        }else{
            EMI = false
        }
        if(ACMarks >= passMarks){
            AC = true
        }else{
            AC = false
        }
        if(ICMarks >= passMarks){
            IC = true
        }else{
            IC = false
        }
        
        
        
        if(CS == true && COOS == true && AWS == true && EMI == true && AC == true && IC == true){
            
            switch btech3sem1Percentage {
            case 75...100:
                btech3_1Grade.text = "A"
            case 60..<75:
                btech3_1Grade.text = "B"
            case 50..<60:
                btech3_1Grade.text = "C"
            default:
                btech3_1Grade.text = "D"
            }
            btech3_1Result.text = "PASSED"
            
        }else
        {
            btech3_1Result.text = "FAILED"
        }
    }
    
    // function for B.Tech 3rd Year Sem-2
    func calcBtech3sem2Year(MEFAMarks:Int,DMMarks:Int,DCMarks:Int,VLSIMarks:Int,MPMCMarks:Int,DSPMarks:Int){
        
        let btech3sem2Total:Int = MEFAMarks + DMMarks + DCMarks + VLSIMarks + MPMCMarks + DSPMarks
        
        // calculating total marks
        
        btech3_2Total.text = "\(btech3sem2Total)"
        
        // calculating percentage
        
        let btech3sem2Percentage:Float = Float((btech3sem2Total/600)*100)
        
        btech3_2Perc.text = "\(btech3sem2Percentage)"
        
        let passMarks = 35
        var MEFA:Bool = false
        var DM:Bool = false
        var DC:Bool = false
        var VLSI:Bool = false
        var MPMC:Bool = false
        var DSP:Bool = false
        
        
        if(MEFAMarks >= passMarks){
            MEFA = true
        }else{
            MEFA = false
        }
        if(DMMarks >= passMarks){
            DM = true
        }else{
            DM = false
        }
        if(DCMarks >= passMarks){
            DC = true
        }else{
            DC = false
        }
        if(VLSIMarks >= passMarks){
            VLSI = true
        }else{
            VLSI = false
        }
        if(MPMCMarks >= passMarks){
            MPMC = true
        }else{
            MPMC = false
        }
        if(DSPMarks >= passMarks){
            DSP = true
        }else{
            DSP = false
        }
        
        
        
        if(MEFA == true && DM == true && DC == true && VLSI == true && MPMC == true && DSP == true){
            
            switch btech3sem2Percentage {
            case 75...100:
                btech3_2Grade.text = "A"
            case 60..<75:
                btech3_2Grade.text = "B"
            case 50..<60:
                btech3_2Grade.text = "C"
            default:
                btech3_2Grade.text = "D"
            }
            btech3_2Result.text = "PASSED"
            
        }else
        {
            btech3_2Result.text = "FAILED"
        }
    }
    
    
    // function for B.Tech 4th Year Sem-1
    func calcBtech4sem1Year(MSMarks:Int,MEMarks:Int,CNMarks:Int,CMCMarks:Int,OOPSMarks:Int,ESDMarks:Int){
        
        let btech4sem1Total:Int = MSMarks + MEMarks + CNMarks + CMCMarks + OOPSMarks + ESDMarks
        
        // calculating total marks
        
        btech4_1Total.text = "\(btech4sem1Total)"
        
        // calculating percentage
        
        let btech4sem1Percentage:Float = Float((btech4sem1Total/600)*100)
        
        btech4_1Perc.text = "\(btech4sem1Percentage)"
        
        let passMarks = 35
        var MS:Bool = false
        var ME:Bool = false
        var CN:Bool = false
        var CMC:Bool = false
        var OOPS:Bool = false
        var ESD:Bool = false
        
        
        if(MSMarks >= passMarks){
            MS = true
        }else{
            MS = false
        }
        if(MEMarks >= passMarks){
            ME = true
        }else{
            ME = false
        }
        if(CNMarks >= passMarks){
            CN = true
        }else{
            CN = false
        }
        if(CMCMarks >= passMarks){
            CMC = true
        }else{
            CMC = false
        }
        if(OOPSMarks >= passMarks){
            OOPS = true
        }else{
            OOPS = false
        }
        if(ESDMarks >= passMarks){
            ESD = true
        }else{
            ESD = false
        }
        
        
        
        if(MS == true && ME == true && CN == true && CMC == true && OOPS == true && ESD == true){
            
            switch btech4sem1Percentage {
            case 75...100:
                btech4_1Grade.text = "A"
            case 60..<75:
                btech4_1Grade.text = "B"
            case 50..<60:
                btech4_1Grade.text = "C"
            default:
                btech4_1Grade.text = "D"
            }
            btech4_1Result.text = "PASSED"
            
        }else
        {
            btech4_1Result.text = "FAILED"
        }
    }
    
    // function for B.Tech 4th Year Sem-2
    func calcBtech4sem2Year(SCMarks:Int,WCMarks:Int,RSMarks:Int,miniProjectMarks:Int,VIVAMarks:Int,ProjectMarks:Int){
        
        let btech4sem2Total:Int = SCMarks + WCMarks + RSMarks + miniProjectMarks + VIVAMarks + ProjectMarks
        
        // calculating total marks
        
        btech4_2Total.text = "\(btech4sem2Total)"
        
        // calculating percentage
        
        let btech4sem2Percentage:Float = Float((btech4sem2Total/600)*100)
        
        btech4_2Perc.text = "\(btech4sem2Percentage)"
        
        let passMarks = 35
        
        var SC:Bool = false
        var WC:Bool = false
        var RS:Bool = false
        var miniProject:Bool = false
        var VIVA:Bool = false
        var project:Bool = false
        
        
        if(SCMarks >= passMarks){
            SC = true
        }else{
            SC = false
        }
        if(WCMarks >= passMarks){
            WC = true
        }else{
            WC = false
        }
        if(RSMarks >= passMarks){
            RS = true
        }else{
            RS = false
        }
        if(miniProjectMarks >= passMarks){
            miniProject = true
        }else{
            miniProject = false
        }
        if(VIVAMarks >= passMarks){
            VIVA = true
        }else{
            VIVA = false
        }
        if(ProjectMarks >= passMarks){
            project = true
        }else{
            project = false
        }
        
        
        
        if(SC == true && WC == true && RS == true && miniProject == true && VIVA == true && project == true){
            
            switch btech4sem2Percentage {
            case 75...100:
                btech4_2Grade.text = "A"
            case 60..<75:
                btech4_2Grade.text = "B"
            case 50..<60:
                btech4_2Grade.text = "C"
            default:
                btech4_2Grade.text = "D"
            }
            btech4_2Result.text = "PASSED"
            
        }else
        {
            btech4_2Result.text = "FAILED"
        }
    }
    
}
