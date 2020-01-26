//
//  ResultViewController.swift
//  dataTranferMethod
//
//  Created by Varalakshmi Kacherla on 11/14/19.
//  Copyright © 2019 Varalakshmi Kacherla. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
   
    @IBOutlet weak var firstNameLbl: UILabel!
    
    
    @IBOutlet weak var inter1stYearResult: UILabel!
    
    @IBOutlet weak var inter1stYearTotal: UILabel!
    
    
    @IBOutlet weak var inter1stYearPercentage: UILabel!
    
    
    @IBOutlet weak var inter2ndYearResult: UILabel!
    
    @IBOutlet weak var inter2ndYearTotal: UILabel!
    
    
    @IBOutlet weak var inter2ndYearPercentage: UILabel!
    
    
    
    @IBOutlet weak var interResult: UILabel!
    
    
    @IBOutlet weak var interPercentage: UILabel!
    @IBOutlet weak var interTotal: UILabel!
    
    
    @IBOutlet weak var btech1stYearResult: UILabel!
    
    @IBOutlet weak var btech1stYearTotal: UILabel!
    
    @IBOutlet weak var btech1stYearPercentage: UILabel!
    
    @IBOutlet weak var btech2ndYearResult: UILabel!
    
    
    @IBOutlet weak var btech2ndYearTotal: UILabel!
    
    
    @IBOutlet weak var btech2ndYearPercentage: UILabel!
    
    
    @IBOutlet weak var btech3rdYearResult: UILabel!
    
    @IBOutlet weak var btech3rdYearTotal: UILabel!
    
    @IBOutlet weak var btech3rdYearPercentage: UILabel!
    
    
    @IBOutlet weak var btech4thYearResult: UILabel!
    
    @IBOutlet weak var btech4thYearTotal: UILabel!
    
    
    @IBOutlet weak var btech4thYearPercentage: UILabel!
    
    
    @IBOutlet weak var btechResult: UILabel!
    
    @IBOutlet weak var btechTotal: UILabel!
    
    
    @IBOutlet weak var btechPercentage: UILabel!
    
    
    
//    var personalDetailsVC = ViewController()
    
    
    
    
    
    var passMarks = 35
    var sciencePassMarks = 28
    var interFirstYearResult:Bool = true
    var interSecondYearResult:Bool = true
    var btechFirstYearResult:Bool = true
    var btechSecondYearSem1Result:Bool = true
    var btechSecondYearSem2Result:Bool = true
    var btechThirdYearSem1Result:Bool = true
    var btechThirdYearSem2Result:Bool = true
    var btechFourthYearSem1Result:Bool = true
    var btechFourthYearSem2Result:Bool = true
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    
//        // Inter Result
//
//        if(interFirstYearResult == true && interSecondYearResult == true){
//            print("Passed")
//        }else
//        {
//            print("Failed")
//        }
//
////        let intertotal1 = interfirstYear(english: <#T##UInt8#>, sanskrit: <#T##UInt8#>, maths1A: <#T##UInt8#>, maths1B: <#T##UInt8#>, physics: <#T##UInt8#>, chemistry: <#T##UInt8#>)
////        let interTotal2 = InterSecondYear(english2: <#T##UInt8#>, sanskrit2: <#T##UInt8#>, maths2A: <#T##UInt8#>, maths2B: <#T##UInt8#>, physics2: <#T##UInt8#>, chemistry2: <#T##UInt8#>)
//
//
//        if(interFirstYearResult == true && interSecondYearResult == true){
//            print("Passed")
//        }else
//        {
//            print("Failed")
//        }
////
////        var interTotal = intertotal1.interFirstYearTotal+interTotal2.interSecondYearTotal
////        var interPercentage = Float((intertotal1.interFirstYearPercentage+interTotal2.interSecondYearPercentage)/2)
//
////        let btech1stYear = btechFirstYear(English: <#T##UInt8#>, Physics: <#T##UInt8#>, Chemistry: <#T##UInt8#>, Maths1: <#T##UInt8#>, Maths2: <#T##UInt8#>, CPDS: <#T##UInt8#>, Drawing: <#T##UInt8#>)
////
////
////        let btechSecondYear1 = btechSecondYearSem1(Maths3: <#T##UInt8#>, EDC: <#T##UInt8#>, PTSP: <#T##UInt8#>, EC: <#T##UInt8#>, SS: <#T##UInt8#>, STLD: <#T##UInt8#>)
////        let btechSecondTear2 = btechSecondYearSem2(PEE: <#T##UInt8#>, ECA: <#T##UInt8#>, PDC: <#T##UInt8#>, ES: <#T##UInt8#>, EMTL: <#T##UInt8#>, DDVHDL: <#T##UInt8#>)
//
//        let btechSecondYearTotal = (btechSecondYear1.btechSecondYearSem1Total)+(btechSecondTear2.btechSecondyearSem2Total)
//        let btechSecondYearPercentage = (btechSecondYear1.btechSecondYearSem1Total)+(btechSecondTear2.btechSecondyearSem2Total)
//
//
////        let btechThirdYear1 = btechThirdYearSem1(CS: <#T##UInt8#>, COOS: <#T##UInt8#>, AWS: <#T##UInt8#>, EMI: <#T##UInt8#>, AC: <#T##UInt8#>, IC: <#T##UInt8#>)
////        let btechThirdYear2 = btechThirdYearSem2(MEFA: <#T##UInt8#>, DM: <#T##UInt8#>, DC: <#T##UInt8#>, VLSI: <#T##UInt8#>, MPMC: <#T##UInt8#>, DSP: <#T##UInt8#>)
//
//        let btechThirdYearTotal = (btechThirdYear1.btechThirdyearSem1Total)+(btechThirdYear2.btechThirdyearSem2Total)
//        let btechThirdYearPercentage = ((btechThirdYear1.btechThirdyearSem1Percentage)+(btechThirdYear2.btechThirdyearSem2Percentage))/2
//
////        let btechFourthYear1 = btechFourthYearSem1(MS: <#T##UInt8#>, ME: <#T##UInt8#>, CN: <#T##UInt8#>, CMC: <#T##UInt8#>, OOPS: <#T##UInt8#>, ESD: <#T##UInt8#>)
////
////        let btechFourthYear2 = btechFourthYearSem2(SC: <#T##UInt8#>, WC: <#T##UInt8#>, RS: <#T##UInt8#>, miniProject: <#T##UInt8#>, VIVA: <#T##UInt8#>, Project: <#T##UInt8#>)
//
//        let btechFourthYearTotal = (btechFourthYear1.btechFourthYearSem1Total)+(btechFourthYear2.btechFourthYearSem2Total)
//        let btechFourthYearPercentage = ((btechFourthYear1.btechFourthYearSem1Percentage)+(btechFourthYear2.btechFourthYearSem2Percentage))/2
//
//
//        let btechTotal = btech1stYear.btechFirstyearTotal + btechSecondYearTotal + btechThirdYearTotal + btechFourthYearTotal
//
//        let btechPercentage = Float(btechTotal/4400)
//
//
//
//
//
//
//        // Do any additional setup after loading the view.
    }

    func interfirstYear(english:UInt8,sanskrit:UInt8,maths1A:UInt8,maths1B:UInt8,physics:UInt8,chemistry:UInt8) ->(interFirstYearResult:Bool,interFirstYearTotal:UInt16,interFirstYearPercentage:Float)
    {

        let interFirstYearTotal:UInt16 = UInt16(english+sanskrit+maths1A+maths1B+physics+chemistry)

        print(interFirstYearTotal)

        if(english>=passMarks && sanskrit>=passMarks && maths1A>=sciencePassMarks && maths1B>=sciencePassMarks && physics>=sciencePassMarks && chemistry>=sciencePassMarks)
        {
            interFirstYearResult = true
            print("passed")
        }else
        {
            interFirstYearResult = false
            print("Failed")
        }


        let interFirstYearPercentage:Float = Float(interFirstYearTotal)/Float(500)*Float(100)



        let interFirstYearSummary:(interFirstYearResult:Bool,interFirstYearTotal:UInt16,interFirstYearPercentage:Float) = (interFirstYearResult,interFirstYearTotal,interFirstYearPercentage)
        return interFirstYearSummary
    }

    func InterSecondYear(english2:UInt8,sanskrit2:UInt8,maths2A:UInt8,maths2B:UInt8,physics2:UInt8,chemistry2:UInt8) -> (interSecondYearResult:Bool,interSecondYearTotal:UInt16,interSecondYearPercentage:Float)
    {
        if(english2>=passMarks && sanskrit2>=passMarks && maths2A>=sciencePassMarks && maths2B>=sciencePassMarks && physics2>=sciencePassMarks && chemistry2>=sciencePassMarks)
        {
            print("passed")
        }else
        {
            print("Failed")
        }

        let interSecondYearTotal:UInt16 = UInt16(english2+sanskrit2+maths2A+maths2A+physics2+chemistry2)

        let interSecondYearPercentage:Float = Float(interSecondYearTotal)/Float(500)*Float(100)

        let interSecondYearSummary:(interSecondYearResult:Bool,interSecondYearTotal:UInt16,interSecondYearPercentage:Float) = (interSecondYearResult,interSecondYearTotal,interSecondYearPercentage)
        return interSecondYearSummary
    }


    func btechFirstYear(English:UInt8,Physics:UInt8,Chemistry:UInt8,Maths1:UInt8,Maths2:UInt8,CPDS:UInt8,Drawing:UInt8) -> (btechFirstYearResult:Bool,btechFirstyearTotal:UInt16,btechFirstYearPercentage:Float)
    {
        if(English>=passMarks && Physics>=passMarks && Chemistry>=passMarks && Maths1>=passMarks && Maths2>=passMarks && CPDS>=passMarks && Drawing>=passMarks){
            btechFirstYearResult = true
            print("Passed")
        }else
        {
            btechFirstYearResult = false
            print("Failed")
        }

        let btechFirstyearTotal:UInt16 = UInt16(English+Physics+Chemistry+Maths1+Maths2+CPDS+Drawing)

        let btechFirstYearPercentage:Float = Float(btechFirstyearTotal)/Float(700)*Float(100)


        let btechFirstYearSummary:(btechFirstYearResult:Bool,btechFirstyearTotal:UInt16,btechFirstYearPercentage:Float) = (btechFirstYearResult,btechFirstyearTotal,btechFirstYearPercentage)

            return btechFirstYearSummary

    }

    func btechSecondYearSem1(Maths3:UInt8,EDC:UInt8,PTSP:UInt8,EC:UInt8,SS:UInt8,STLD:UInt8) -> (btechSecondYearSem1Result:Bool,btechSecondYearSem1Total:UInt16,btechSecondYearSem1Percentage:Float)
    {
        if(Maths3>=passMarks && EDC>=passMarks && PTSP>=passMarks && EC>=passMarks && SS>=passMarks && STLD>=passMarks)
        {
            btechSecondYearSem1Result = true
            print("Passed")
        }else
        {
            btechSecondYearSem1Result = false
            print("Failed")
        }
        let btechSecondYearSem1Total:UInt16 = UInt16(Maths3+EDC+PTSP+EC+SS+STLD)

        let btechSecondYearSem1Percentage:Float = Float(btechSecondYearSem1Total)/Float(600)*Float(100)

        let btechSecondYearSem1Summary:(btechSecondYearSem1Result:Bool,btechSecondYearSem1Total:UInt16,btechSecondYearSem1Percentage:Float) = (btechSecondYearSem1Result,btechSecondYearSem1Total,btechSecondYearSem1Percentage)
        return btechSecondYearSem1Summary



    }

    func btechSecondYearSem2(PEE:UInt8,ECA:UInt8,PDC:UInt8,ES:UInt8,EMTL:UInt8,DDVHDL:UInt8) -> (btechSecondYearSem2Result:Bool,btechSecondyearSem2Total:UInt16,btechSecondyearSem2Percentage:Float)
    {
        if(PEE>=passMarks && ECA>=passMarks && PDC>=passMarks && ES>=passMarks && EMTL>=passMarks && DDVHDL>=passMarks)
        {
            btechSecondYearSem2Result = true
            print("Passed")
        }else
        {
            btechSecondYearSem2Result = false
            print("Failed")
        }
        let btechSecondyearSem2Total:UInt16 = UInt16(PEE+ECA+PDC+ES+EMTL+DDVHDL)

        let btechSecondyearSem2Percentage = Float(btechSecondyearSem2Total)/Float(600)*Float(100)

        let btechSecondYearSem2Summary:(btechSecondYearSem2Result:Bool,btechSecondyearSem2Total:UInt16,btechSecondyearSem2Percentage:Float) = (btechSecondYearSem2Result,btechSecondyearSem2Total,btechSecondyearSem2Percentage)
        return btechSecondYearSem2Summary

    }


    func btechThirdYearSem1(CS:UInt8,COOS:UInt8,AWS:UInt8,EMI:UInt8,AC:UInt8,IC:UInt8) -> (btechThirdYearSem1Result:Bool,btechThirdyearSem1Total:UInt16,btechThirdyearSem1Percentage:Float)
    {
        if(CS>=passMarks && COOS>=passMarks && AWS>=passMarks && EMI>=passMarks && AC>=passMarks && IC>=passMarks)
        {
            btechThirdYearSem1Result = true
            print("Passed")
        }else
        {
            btechThirdYearSem1Result = false
            print("Failed")
        }
        let btechThirdyearSem1Total:UInt16 = UInt16(CS+COOS+AWS+EMI+AC+IC)
        print(btechThirdyearSem1Total)

        let btechThirdyearSem1Percentage = Float(btechThirdyearSem1Total)/Float(600)*Float(100)
        print(btechThirdyearSem1Percentage)

        let btechThirdYearSem1Summary:(btechThirdYearSem1Result:Bool,btechThirdyearSem1Total:UInt16,btechThirdyearSem1Percentage:Float) = (btechThirdYearSem1Result,btechThirdyearSem1Total,btechThirdyearSem1Percentage)
        return btechThirdYearSem1Summary
    }

    func btechThirdYearSem2(MEFA:UInt8,DM:UInt8,DC:UInt8,VLSI:UInt8,MPMC:UInt8,DSP:UInt8) -> (btechThirdYearSem2Result:Bool,btechThirdyearSem2Total:UInt16,btechThirdyearSem2Percentage:Float)
    {
        if(MEFA>=passMarks && DM>=passMarks && DC>=passMarks && VLSI>=passMarks && MPMC>=passMarks && DSP>=passMarks)
        {
            btechThirdYearSem2Result = true
            print("Passed")
        }else
        {
            btechThirdYearSem2Result = false
            print("Failed")
        }
        let btechThirdyearSem2Total:UInt16 = UInt16(MEFA+DM+DC+VLSI+MPMC+DSP)

        let btechThirdyearSem2Percentage = Float(btechThirdyearSem2Total)/Float(600)*Float(100)

        let btechThirdYearSem2Summary:(btechThirdYearSem2Result:Bool,btechThirdyearSem2Total:UInt16,btechThirdyearSem2Percentage:Float) = (btechThirdYearSem2Result,btechThirdyearSem2Total,btechThirdyearSem2Percentage)
        return btechThirdYearSem2Summary
    }

    func btechFourthYearSem1(MS:UInt8,ME:UInt8,CN:UInt8,CMC:UInt8,OOPS:UInt8,ESD:UInt8) -> (btechFourthYearSem1Result:Bool,btechFourthYearSem1Total:UInt16,btechFourthYearSem1Percentage:Float)
    {
        if(MS>=passMarks && ME>=passMarks && CN>=passMarks && CMC>=passMarks && OOPS>=passMarks && ESD>=passMarks)
        {
            btechFourthYearSem1Result = true
            print("Passed")
        }else
        {
            btechFourthYearSem1Result = false
            print("Failed")
        }
        let btechFourthYearSem1Total:UInt16 = UInt16(MS+ME+CN+CMC+OOPS+ESD)

        let btechFourthYearSem1Percentage = Float(btechFourthYearSem1Total)/Float(600)*Float(100)

        let btechFourthYearSem1Summary:(btechFourthYearSem1Result:Bool,btechFourthYearSem1Total:UInt16,btechFourthYearSem1Percentage:Float) = (btechFourthYearSem1Result,btechFourthYearSem1Total,btechFourthYearSem1Percentage)
        return btechFourthYearSem1Summary


    }


    func btechFourthYearSem2(SC:UInt8,WC:UInt8,RS:UInt8,miniProject:UInt8,VIVA:UInt8,Project:UInt8) -> (btechFourthYearSem2Result:Bool,btechFourthYearSem2Total:UInt16,btechFourthYearSem2Percentage:Float)
    {
        if(SC>=passMarks && WC>=passMarks && RS>=passMarks && miniProject>=passMarks && VIVA>=passMarks && Project>=passMarks)
        {
            btechFourthYearSem2Result = true
            print("Passed")
        }else
        {
            btechFourthYearSem2Result = false
            print("Failed")
        }
        let btechFourthYearSem2Total:UInt16 = UInt16(SC+WC+RS+miniProject+VIVA+Project)

        let btechFourthYearSem2Percentage = Float(btechFourthYearSem2Total)/Float(700)*Float(100)

        let btechFourthYearSem2Summary:(btechFourthYearSem2Result:Bool,btechFourthYearSem2Total:UInt16,btechFourthYearSem2Percentage:Float) = (btechFourthYearSem2Result,btechFourthYearSem2Total,btechFourthYearSem2Percentage)
        return btechFourthYearSem2Summary

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

