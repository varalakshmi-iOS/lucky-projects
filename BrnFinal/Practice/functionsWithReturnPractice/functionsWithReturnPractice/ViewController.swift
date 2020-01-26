//
//  ViewController.swift
//  functionsWithReturnPractice
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


    override func viewDidLoad() {
        super.viewDidLoad()
        
        let btechFirstYear = calcBtech1Marks(englishMarks:57,phyMarks:75,cheMarks:65,maths1Marks:70,maths2Marks:85,drawingMarks:75,CPDSMarks:65,englishLabMarks:55,phyLabMarks:50,CPDSLabMarks:65,ITLabMarks:60,studentName:"vikas")
        
        let btechSecondYear1 = calcBtechSecondYear1Marks(maths3Marks:15,EDCMarks:46,PTSPMarks:45,SSMarks:53,ECMarks:65,STLDMarks:62,EDCLabMarks:64,SSLabMarks:42,studentName:"vikas")
        let btechSecondYear2 = calcBtechSecondYear2Marks(PEEMarks:54,ECAMarks:56,PDCMarks:45,ESMarks:36,EMTLMarks:56,DDVHDLMarks:46,ETLabMarks:59,ECLabMarks:58,studentName:"vikas")
        
        if(secondYear1Result == true && secondYear2Result == true)
        {
            print("passed in Second Btech")
        }else
        {
            print("Failed in Second Btech")
        }
        
        let btechthirdYear1 = calcBtechThirdYear1Marks(CSMarks:65,COOSMarks:69,AWSMarks:49,EMIMarks:59,ACMarks:69,ICMarks:55,ACLabMarks:65,ICLabMarks:65,studentName:"vikas")
        
        let btechThirdYear2 = calcBtechThirdYear2Marks(MEFAMarks:57,DMMarks:65,DCMarks:56,VLSIMarks:53,MPMCMarks:68,DSPMarks:58,MPMCLabMarks:63,DSPLabMarks:47,studentName:"vikas")
        
        if( thirdYear1Result == true && thirdYear2Result == true)
        {
            print("Passed in Third Btech")
        }else
        {
            print("Failed in Third Btech")
        }
        
        let btechFourthYear1 = calcBtechFourthYear1Marks(MSMarks:46,MEMarks:68,CNMarks:47,CMCMarks:45,OOPSMarks:46,ESDMarks:58,ACSLabMarks:69,MEDCLabMarks:58,studentName:"vikas")
        let btechFourthYear2 = calcBtechFourthYear2Marks(SCMarks:72,WCMarks:46,RSMarks:55,miniProjectMarks:40,seminarMarks:55,majorProjectMarks:170,vivaMarks:55,studentName:"vikas")
        
        if(fourthYear1Result == true && fourthYear2Result == true)
        {
            print("Passed in Fourth Btech")
        }else
        {
            print("Failed in FourthBtech")
        }
        
        if(firstYearResult == true && secondYear1Result == true && secondYear2Result == true && thirdYear1Result == true && thirdYear2Result == true && fourthYear1Result == true && fourthYear2Result == true)
        {
            print("Passed in B.Tech")
        }else
        {
            print("Failed in B.Tech")
            
        }
        
        
        
        
        
        // Do any additional setup after loading the view.
    }
    
    
   func calcBtech1Marks(englishMarks:UInt8,phyMarks:UInt8,cheMarks:UInt8,maths1Marks:UInt8,maths2Marks:UInt8,drawingMarks:UInt8,CPDSMarks:UInt8,englishLabMarks:UInt8,phyLabMarks:UInt8,CPDSLabMarks:UInt8,ITLabMarks:UInt8,studentName:String)->Bool
    {
        let totalMarks1:UInt16 = UInt16(englishMarks)+UInt16(phyMarks)+UInt16(cheMarks)+UInt16(maths1Marks)+UInt16(maths2Marks)+UInt16(drawingMarks)+UInt16(CPDSMarks)+UInt16(englishLabMarks)+UInt16(phyLabMarks)+UInt16(CPDSLabMarks)+UInt16(ITLabMarks)
        
        print(studentName,"scored \(totalMarks1) in FirstBtech")
        
        if(englishMarks>=passMarks && phyMarks>=passMarks && cheMarks>=passMarks && maths1Marks>=passMarks && maths2Marks>=passMarks && drawingMarks>=passMarks && CPDSMarks>=passMarks && englishLabMarks>=labPassMarks && phyLabMarks>=labPassMarks && CPDSLabMarks>=labPassMarks && ITLabMarks>=labPassMarks)
        {
            firstYearResult = true
            print(studentName,"Passed FirstBtech")
            
        }else
        {
            firstYearResult = false
            print(studentName,"Failed FirstBtech")
            
        }
        
        return firstYearResult
        
    }
    
    
    func calcBtechSecondYear1Marks(maths3Marks:UInt8,EDCMarks:UInt8,PTSPMarks:UInt8,SSMarks:UInt8,ECMarks:UInt8,STLDMarks:UInt8,EDCLabMarks:UInt8,SSLabMarks:UInt8,studentName:String)->Bool
    {
        
        let secondYear1totalMarks:UInt16 = UInt16(maths3Marks)+UInt16(EDCMarks)+UInt16(PTSPMarks)+UInt16(SSMarks)+UInt16(STLDMarks)+UInt16(ECMarks)+UInt16(EDCLabMarks)+UInt16(SSLabMarks)
        
        
        print(studentName,"scored \( secondYear1totalMarks) Marks Second Btech1")
        
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
        
        return secondYear1Result
        
    }
    
    
    func calcBtechSecondYear2Marks(PEEMarks:UInt8,ECAMarks:UInt8,PDCMarks:UInt8,ESMarks:UInt8,EMTLMarks:UInt8,DDVHDLMarks:UInt8,ETLabMarks:UInt8,ECLabMarks:UInt8,studentName:String)->Bool
    {
        let secondYear2totalMarks:UInt16 = UInt16(PEEMarks)+UInt16(ECAMarks)+UInt16(PDCMarks)+UInt16(ESMarks)+UInt16(EMTLMarks)+UInt16(DDVHDLMarks)+UInt16(ETLabMarks)+UInt16(ECLabMarks)
        
        print(studentName,"scored \(secondYear2totalMarks) Marks SeconBtech2")
        
        if(PEEMarks>=passMarks && ECAMarks>=passMarks && PDCMarks>=passMarks && ESMarks>=passMarks && EMTLMarks>=passMarks && DDVHDLMarks>=passMarks && ETLabMarks>=labPassMarks && ECLabMarks>=labPassMarks)
        {
            secondYear2Result = true
            print(studentName,"Passed in SceondBtech2")
            
        }else
        {
            secondYear2Result = false
            print(studentName,"Failed in SceondBtech2")
            
        }
        
        return secondYear2Result
        
    }
    
    
    func calcBtechThirdYear1Marks(CSMarks:UInt8,COOSMarks:UInt8,AWSMarks:UInt8,EMIMarks:UInt8,ACMarks:UInt8,ICMarks:UInt8,ACLabMarks:UInt8,ICLabMarks:UInt8,studentName:String)->Bool
    {
        let thirdYear1totalMarks:UInt16 = UInt16(CSMarks)+UInt16(COOSMarks)+UInt16(AWSMarks)+UInt16(EMIMarks)+UInt16(ACMarks)+UInt16(ICMarks)+UInt16(ACLabMarks)+UInt16(ICLabMarks)
        
        print(studentName,"scored \(thirdYear1totalMarks) Marks Third Btech2")
        
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
        
        return thirdYear1Result
    }
    
    func calcBtechThirdYear2Marks(MEFAMarks:UInt8,DMMarks:UInt8,DCMarks:UInt8,VLSIMarks:UInt8,MPMCMarks:UInt8,DSPMarks:UInt8,MPMCLabMarks:UInt8,DSPLabMarks:UInt8,studentName:String)->Bool
    {
        let thirdYear2totalMarks:UInt16 = UInt16(MEFAMarks)+UInt16(DMMarks)+UInt16(DCMarks)+UInt16(VLSIMarks)+UInt16(MPMCMarks)+UInt16(DSPMarks)+UInt16(MPMCLabMarks)+UInt16(DSPLabMarks)
        
        print(studentName,"scored \(thirdYear2totalMarks) Marks ThirdBtech2")
        
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
        
        return thirdYear2Result
        
    }
    
    
    func calcBtechFourthYear1Marks(MSMarks:UInt8,MEMarks:UInt8,CNMarks:UInt8,CMCMarks:UInt8,OOPSMarks:UInt8,ESDMarks:UInt8,ACSLabMarks:UInt8,MEDCLabMarks:UInt8,studentName:String)->Bool
    {
        let fourthYear1totalMarks:UInt16 = UInt16(MSMarks)+UInt16(MEMarks)+UInt16(CNMarks)+UInt16(CMCMarks)+UInt16(OOPSMarks)+UInt16(ESDMarks)+UInt16(ACSLabMarks)+UInt16(MEDCLabMarks)
        
        print(studentName,"scored \(fourthYear1totalMarks) Marks Fourth Btech1")
        
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
        
        return fourthYear1Result
    }
    
    
    func calcBtechFourthYear2Marks(SCMarks:UInt8,WCMarks:UInt8,RSMarks:UInt8,miniProjectMarks:UInt8,seminarMarks:UInt8,majorProjectMarks:UInt8,vivaMarks:UInt8,studentName:String)->Bool
    {
        let fourthYear2totalMarks:UInt16 = UInt16(SCMarks)+UInt16(WCMarks)+UInt16(RSMarks)+UInt16(miniProjectMarks)+UInt16(seminarMarks)+UInt16(majorProjectMarks)+UInt16(vivaMarks)
        
        print(studentName,"scored \(fourthYear2totalMarks) Marks Fourth Btech2")
        
        if(SCMarks>=passMarks && WCMarks>=passMarks && RSMarks>=passMarks && miniProjectMarks>=passMarks && seminarMarks>=passMarks && majorProjectMarks>=projectPassMarks && vivaMarks>=vivaPassMarks)
        {
            fourthYear2Result = true
            print(studentName,"Passed in Fourth Btech2")
            
        }else
        {
            fourthYear2Result = false
            print(studentName,"Failed in Fourth Btech2")
            
        }
        
        return fourthYear2Result
    }
    
    
    
    
    
    
    


}

