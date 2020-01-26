//
//  ViewController.swift
//  functionsWithTuplePractice
//
//  Created by Varalakshmi Kacherla on 1/10/20.
//  Copyright © 2020 Varalakshmi Kacherla. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var passMarks:UInt8 = 35
    var labPassMarks:UInt8 = 28
    var projectPassMarks:UInt8 = 100
    var vivaPassMarks:UInt8 = 50
    var firstYearResult:Bool = true
    var secondYear1Result:Bool = true
    var secondYear2Result:Bool = true
    var thirdYear1Result:Bool = true
    var thirdYear2Result:Bool = true
    var fourthYear1Result:Bool = true
    var fourthYear2Result:Bool = true
    var vaniName:String = "Vani"
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        var firstYear = calcBtechFirstYearMarks(englishMarks:55,phyMarks:56,cheMarks:56,maths1Marks:56,maths2Marks:56,drawingMarks:56,CPDSMarks:45,englishLabMarks:56,phyLabMarks:56,CPDSLabMarks:65,ITLabMarks:70,studentName:vaniName)
            
            
        
            
            
            var btechSecondYear1 = calcBtechSecondYear1Marks(maths3Marks:55,EDCMarks:46,PTSPMarks:45,SSMarks:53,ECMarks:65,STLDMarks:42,EDCLabMarks:64,SSLabMarks:42,studentName:vaniName)
            
            var btechSecondYear2 = calcBtechSecondYear2Marks(PEEMarks:54,ECAMarks:56,PDCMarks:45,ESMarks:36,EMTLMarks:56,DDVHDLMarks:46,ETLabMarks:59,ECLabMarks:58,studentName:vaniName)
            
            
            
            if(secondYear1Result == true && secondYear2Result == true)    // Displays Student Second B.Tech Result
                
            {
                
                print(vaniName,"Passed in Second Btech")    // Displays Passed In Second Btech
                
            }else
                
            {
                print(vaniName,"Failed in Second Btech")        // Displays Passed In Second Btech
                
            }
            
            
            let btechThirdYear1 = calcBtechThirdYear1Marks(CSMarks:195,COOSMarks:69,AWSMarks:39,EMIMarks:59,ACMarks:49,ICMarks:45,ACLabMarks:45,ICLabMarks:55,studentName:vaniName)
            
            
            
            let btechThirdYear2 = calcBtechThirdYear2Marks(MEFAMarks:52,DMMarks:65,DCMarks:56,VLSIMarks:53,MPMCMarks:58,DSPMarks:68,MPMCLabMarks:63,DSPLabMarks:57,studentName:vaniName)
            
            
            
            if(thirdYear1Result  == true && thirdYear2Result  == true)  // Displays Student Third B.Tech Result
            {
                print(vaniName,"Passed in Third Btech")
            }else
            {
                print("Failed in Third Btech")
            }
            
            let btechFourthYear1 = calcBtechFourthYear1Marks(MSMarks:86,MEMarks:58,CNMarks:57,CMCMarks:75,OOPSMarks:56,ESDMarks:68,ACSLabMarks:69,MEDCLabMarks:68,studentName:vaniName)
            
            let btechFourthYear2 = calcBtechFourthYear2Marks(SCMarks:42,WCMarks:56,RSMarks:65,miniProjectMarks:50,seminarMarks:50,majorProjectMarks:180,vivaMarks:50,studentName:vaniName)
            
        
            if(fourthYear1Result == true && fourthYear2Result == true)  // Displays Student Fourth B.Tech Result
                
            {
                
                print(vaniName, "Passed in FourthBtech")        // Displays Passed In Fourth Btech
                
            }else
                
            {
                
                print(vaniName,"Failed in FourthBtech")        // Displays Failed In Fourth Btech
                
            }
        
            
            if(firstYearResult == true && secondYear1Result == true && secondYear2Result == true && thirdYear1Result  == true && thirdYear2Result  == true && fourthYear1Result == true && fourthYear2Result == true)
            {
                print("Passed in B.Tech")          // Displays Passed In Btech
            }else
            {
                print("Failed in B.Tech")        // Displays Failed In Btech
            }

            
        }

        // Do any additional setup after loading the view.
    func calcBtechFirstYearMarks(englishMarks:UInt8,phyMarks:UInt8,cheMarks:UInt8,maths1Marks:UInt8,maths2Marks:UInt8,drawingMarks:UInt8,CPDSMarks:UInt8,englishLabMarks:UInt8,phyLabMarks:UInt8,CPDSLabMarks:UInt8,ITLabMarks:UInt8,studentName:String)->(result:Bool,totalMarks:UInt16,Percentage:Float)
    {
        
        if(englishMarks>=passMarks && phyMarks>=passMarks && cheMarks>=passMarks && maths1Marks>=passMarks && maths2Marks>=passMarks && drawingMarks>=passMarks && CPDSMarks>=passMarks && englishLabMarks>=labPassMarks && phyLabMarks>=labPassMarks && CPDSLabMarks>=labPassMarks && ITLabMarks>=labPassMarks)
        {
            print("Passed in FirstYear")
            firstYearResult = true
        
        }else
        {
            print("Failed in FirstYear")
            firstYearResult = false
        }
        let firstYearTotal:UInt16 = UInt16(englishMarks)+UInt16(phyMarks)+UInt16(cheMarks)+UInt16(maths1Marks)+UInt16(maths2Marks)+UInt16(drawingMarks)+UInt16(CPDSMarks)+UInt16(englishLabMarks)+UInt16(phyLabMarks)+UInt16(CPDSLabMarks)+UInt16(ITLabMarks)
        
        print(studentName," Scored \(firstYearTotal) in First B.Tech")    // Displays Total Score
        
        let  percentage:Float = Float(firstYearTotal)/Float(1000)*Float(100)
        
        print(studentName," Percentage is \(percentage)")
        
        let firstYearSummary:(result:Bool,totalMarks:UInt16,Percentage:Float) = (firstYearResult,firstYearTotal,percentage)
        
        return firstYearSummary
        
    }
    // first Year Result
    
    
    func calcBtechSecondYear1Marks(maths3Marks:UInt8,EDCMarks:UInt8,PTSPMarks:UInt8,SSMarks:UInt8,ECMarks:UInt8,STLDMarks:UInt8,EDCLabMarks:UInt8,SSLabMarks:UInt8,studentName:String)->(result:Bool,totalMarks:UInt16,Percentage:Float)
        
    {
        
       
        
        if(maths3Marks>=passMarks && EDCMarks>=passMarks && PTSPMarks>=passMarks && SSMarks>=passMarks &&
            STLDMarks>=passMarks && EDCLabMarks>=labPassMarks && SSLabMarks>=labPassMarks)
        {
            secondYear1Result = true
            print(studentName,"Passed in SecondBtech1")
            
        }else
        {
            secondYear1Result = false
            print(studentName,"Failed in SecondBtech1")
            
        }
        let secondYear1Total:UInt16 = UInt16(maths3Marks)+UInt16(EDCMarks)+UInt16(PTSPMarks)+UInt16(SSMarks)+UInt16(STLDMarks)+UInt16(ECMarks)+UInt16(EDCLabMarks)+UInt16(SSLabMarks)
        
        
        print(studentName,"scored \( secondYear1Total) Marks Second Btech1")
        
        
        let  percentage:Float = Float(secondYear1Total)/Float(750)*Float(100)
        
        print(studentName," Percentage is \(percentage)")
        
        let secondYear1Summary:(result:Bool,totalMarks:UInt16,Percentage:Float) = (secondYear1Result,secondYear1Total,percentage)
        
        
        return secondYear1Summary
    }
    
    // second Year1 Result
    
    
    func calcBtechSecondYear2Marks(PEEMarks:UInt8,ECAMarks:UInt8,PDCMarks:UInt8,ESMarks:UInt8,EMTLMarks:UInt8,DDVHDLMarks:UInt8,ETLabMarks:UInt8,ECLabMarks:UInt8,studentName:String)->(result:Bool,totalMarks:UInt16,Percentage:Float)
    {
        
        if(PEEMarks>=passMarks && ECAMarks>=passMarks && PDCMarks>=passMarks && ESMarks>=passMarks && EMTLMarks>=passMarks && DDVHDLMarks>=passMarks && ETLabMarks>=labPassMarks && ECLabMarks>=labPassMarks)
        {
            secondYear2Result = true
            print(studentName,"Passed in SceondBtech2")
            
        }else
        {
            secondYear2Result = false
            print(studentName,"Failed in SceondBtech2")
        }
        
        let secondYear2Total:UInt16 = UInt16(PEEMarks)+UInt16(ECAMarks)+UInt16(PDCMarks)+UInt16(ESMarks)+UInt16(EMTLMarks)+UInt16(DDVHDLMarks)+UInt16(ETLabMarks)+UInt16(ECLabMarks)
        
        print(studentName,"scored \(secondYear2Total) Marks SeconBtech2")
        
        let  percentage:Float = Float(secondYear2Total)/Float(750)*Float(100)
        
        print(studentName," Percentage is \(percentage)")
        
        let secondYear2Summary:(result:Bool,totalMarks:UInt16,Percentage:Float) = (secondYear1Result,secondYear2Total,percentage)
        
        return secondYear2Summary
        
        
    }
    
    // second Year2 Result
    
    func calcBtechThirdYear1Marks(CSMarks:UInt8,COOSMarks:UInt8,AWSMarks:UInt8,EMIMarks:UInt8,ACMarks:UInt8,ICMarks:UInt8,ACLabMarks:UInt8,ICLabMarks:UInt8,studentName:String)->(result:Bool,totalMarks:UInt16,Percentage:Float)
    {
       
        
        if(CSMarks>=passMarks && COOSMarks>=passMarks && AWSMarks>=passMarks && EMIMarks>=passMarks && ACMarks>=passMarks && ICMarks>=passMarks && ACLabMarks>=labPassMarks && ICLabMarks>=labPassMarks)
        {
            thirdYear1Result = true
            print(studentName,"Passed in ThirdBtech1")
        }
        else
        {
            thirdYear1Result = false
            print(studentName,"Failed in ThirdBtech1")
            
        }
        
        let thirdYear1Total:UInt16 = UInt16(CSMarks)+UInt16(COOSMarks)+UInt16(AWSMarks)+UInt16(EMIMarks)+UInt16(ACMarks)+UInt16(ICMarks)+UInt16(ACLabMarks)+UInt16(ICLabMarks)
        
        print(studentName,"scored \(thirdYear1Total) Marks Third Btech2")
        
        let  percentage:Float = Float(thirdYear1Total)/Float(750)*Float(100)
        
        print(studentName," Percentage is \(percentage)")
        
        let thirdYear1Summary:(result:Bool,totalMarks:UInt16,Percentage:Float) = (thirdYear1Result,thirdYear1Total,percentage)
        
        return thirdYear1Summary
        
    }
    
    func calcBtechThirdYear2Marks(MEFAMarks:UInt8,DMMarks:UInt8,DCMarks:UInt8,VLSIMarks:UInt8,MPMCMarks:UInt8,DSPMarks:UInt8,MPMCLabMarks:UInt8,DSPLabMarks:UInt8,studentName:String)->(result:Bool,totalMarks:UInt16,Percentage:Float)
    {
    
        if(MEFAMarks>=passMarks && DMMarks>=passMarks && DCMarks>=passMarks && VLSIMarks>=passMarks && MPMCMarks>=passMarks && DSPMarks>=passMarks && MPMCLabMarks>=labPassMarks && DSPLabMarks>=labPassMarks)
            
        {
            thirdYear2Result = true
            print(studentName,"Passed in Third Btech2")
        }
        else
        {
            thirdYear2Result = false
            print(studentName,"Failed in ThirdBtech2")
        }
        let thirdYear2Total:UInt16 = UInt16(MEFAMarks)+UInt16(DMMarks)+UInt16(DCMarks)+UInt16(VLSIMarks)+UInt16(MPMCMarks)+UInt16(DSPMarks)+UInt16(MPMCLabMarks)+UInt16(DSPLabMarks)
        
        print(studentName,"scored \(thirdYear2Total) Marks ThirdBtech2")
        
        let  percentage:Float = Float(thirdYear2Total)/Float(750)*Float(100)
        
        print(studentName," Percentage is \(percentage)")
        
        let thirdYear2Summary:(result:Bool,totalMarks:UInt16,Percentage:Float) = (thirdYear2Result,thirdYear2Total,percentage)
        
        return thirdYear2Summary
    }
    
    func calcBtechFourthYear1Marks(MSMarks:UInt8,MEMarks:UInt8,CNMarks:UInt8,CMCMarks:UInt8,OOPSMarks:UInt8,ESDMarks:UInt8,ACSLabMarks:UInt8,MEDCLabMarks:UInt8,studentName:String)->(result:Bool,totalMarks:UInt16,Percentage:Float)
    {
        
        if(MSMarks>=passMarks && MEMarks>=passMarks && CNMarks>=passMarks && CMCMarks>=passMarks && OOPSMarks>=passMarks && ESDMarks>=passMarks && ACSLabMarks>=labPassMarks && MEDCLabMarks>=labPassMarks)
        {
            fourthYear1Result = true
            print(studentName,"Passed in Fourth Btech1")
        }
        else
        {
            fourthYear1Result = false
            print(studentName,"Failed in FourthBtech1")
        }
        
        let fourthYear1Total:UInt16 = UInt16(MSMarks)+UInt16(MEMarks)+UInt16(CNMarks)+UInt16(CMCMarks)+UInt16(OOPSMarks)+UInt16(ESDMarks)+UInt16(ACSLabMarks)+UInt16(MEDCLabMarks)
        
        print(studentName,"scored \(fourthYear1Total) Marks Fourth Btech1")
        
        let  percentage:Float = Float(fourthYear1Total)/Float(750)*Float(100)
        
        print(studentName," Percentage is \(percentage)")
        
        let fourthYear1Summary:(result:Bool,totalMarks:UInt16,Percentage:Float) = (fourthYear1Result,fourthYear1Total,percentage)
        
        return fourthYear1Summary
    }
    
    func calcBtechFourthYear2Marks(SCMarks:UInt8,WCMarks:UInt8,RSMarks:UInt8,miniProjectMarks:UInt8,seminarMarks:UInt8,majorProjectMarks:UInt8,vivaMarks:UInt8,studentName:String)-> (result:Bool,totalMarks:UInt16,Percentage:Float)
    {
        
        if(SCMarks>=passMarks && WCMarks>=passMarks && RSMarks>=passMarks && miniProjectMarks>=passMarks && seminarMarks>=passMarks && majorProjectMarks>=projectPassMarks && vivaMarks>=vivaPassMarks)
        {
            fourthYear2Result = true
            print(studentName,"Passed in Fourth Btech2")
        }else
        {
            fourthYear2Result = false
            print(studentName,"Failed in Fourth Btech2")
        }
        
        let fourthYear2Total:UInt16 = UInt16(SCMarks)+UInt16(WCMarks)+UInt16(RSMarks)+UInt16(miniProjectMarks)+UInt16(seminarMarks)+UInt16(majorProjectMarks)+UInt16(vivaMarks)
        
        print(studentName,"scored \(fourthYear2Total) Marks Fourth Btech2")
        
        let  percentage:Float = Float(fourthYear2Total)/Float(750)*Float(100)
        
        print(studentName," Percentage is \(percentage)")
        
        let fourthYear2Summary:(result:Bool,totalMarks:UInt16,Percentage:Float) = (fourthYear2Result,fourthYear2Total,percentage)
        
        return fourthYear2Summary
    }
    


}
