//
//  ViewController.swift
//  funcwithTuple
//
//  Created by Varalakshmi Kacherla on 11/14/19.
//  Copyright © 2019 Varalakshmi Kacherla. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let vijay1stYearBtechResults = calFirstYearBtechResults(communicativeEngMarks: 85, enggPhysicsMarks: 88, enggChemistryMarks: 39, mathematics1Marks: 92, proCAndDatastructureMarks: 79, mathematics2Marks: 94, enggGraphicsMarks: 92, proCDatastrucLabMarks: 70, enggPhyAndEnggCheLabMarks: 68, enggAndITWorkShopMarks: 72, enggLangComSkillLabMarks: 65)
        
        print("Vijay B-Tech 1st Year Percentage = \(vijay1stYearBtechResults.firstYearBtechPercentage)")
        print("Vijay B-Tech 1st Year Total Marks = \(vijay1stYearBtechResults.gained1stYearBtechMarks)")
        
        // Second Year B-Tech Results
        
        let vijay2ndYear1stSemResults = cal2ndYear1stSemBtechResults(mathematics3Marks: 84, environmentalSciMarks: 75, basicFMHMMarks: 72, elecDevCirsMarks: 86, elecMachines1Marks: 87, elecCircuitsMarks: 92, basicFMHMLabMarks: 68)
        
        print("Vijay B-Tech 2nd Year 2nd Sem Total Marks = \(vijay2ndYear1stSemResults.secondYear1stSemGainedMarks)")
        print("Vijay B-Tech 2nd Year 1st Sem Percentage = \(vijay2ndYear1stSemResults.secondYear1stSemPercentage)")
        
        let vijay2ndYear2ndSemResults = cal2ndYear2ndSemBtechResults(EMFMarks: 74, GEPMarks: 71, AECMarks: 75, STLDMarks: 85, NTMarks: 65, EM2Marks: 48)
        
        print("Vijay B-Tech 2nd Year 2nd Sem Total Marks = \(vijay2ndYear2ndSemResults.secondYear2ndSemGainedMarks)")
        print("Vijay B-Tech 2nd Year 2nd Sem Percentage = \(vijay2ndYear2ndSemResults.secondYear2ndSemPercentage)")
        
        let vijayTotal2ndYearGainedBtechMarks:UInt16 = (vijay2ndYear1stSemResults.secondYear1stSemGainedMarks)+(vijay2ndYear2ndSemResults.secondYear2ndSemGainedMarks)
        
        print("Vijay 2nd Year B-Tech Total Marks = \(vijayTotal2ndYearGainedBtechMarks)")
        
        let total2ndYearMarks:Float = 1500
        
        let vijaySecondYearBtechPercentage:Float = (Float(vijayTotal2ndYearGainedBtechMarks)/total2ndYearMarks)*100
        
        print("Vijay 2nd Year B-Tech Percentage = \(vijaySecondYearBtechPercentage)")
        
        if (vijay2ndYear1stSemResults.secondYear1stSemResults == true && vijay2ndYear2ndSemResults.secondYear2ndSemResults == true)
        {
            switch vijaySecondYearBtechPercentage{
            case 90...100:
                print("Grade A")
            case 75..<90:
                print("Grade B")
            case 50..<75:
                print("Grade C")
            case 35..<50:
                print("Grade D")
            default:
                print("Grade E")
            }
            print("Vijay Passed 2nd Year B-Tech")
        } else {
            print("Vijay Failed 2nd Year B-Tech")
        }
        
        // B-Tech 3rd Year Results
        
        let vijay3rdYear1stSemResults = cal3rdYear1stSemBtechResults(MEFAMarks: 79, EEMMarks: 95, TEPMarks: 84, CSMarks: 74, PEMarks: 68)
        
        print("Vijay B-Tech 3rd Year 1st Sem Total Marks = \(vijay3rdYear1stSemResults.thirdYear1stSemGainedMarks)")
        print("Vijay B-Tech 3rd Year 1st Sem Percentage = \(vijay3rdYear1stSemResults.thirdYear1stSemPercentage)")
        
        let vijay3rdYear2ndSemResults = cal3rdYear2ndSemBtechResults(MSMarks: 74, PSDMarks: 72, PSAMarks: 84, MPMCMarks: 65)
        
        print("Vijay B-Tech 3rd Year 2nd Sem Total Marks = \(vijay3rdYear2ndSemResults.thirdYear2ndSemGainedMarks)")
        print("Vijay B-Tech 3rd Year 2nd Sem Percentage = \(vijay3rdYear2ndSemResults.thirdYear2ndSemPercentage)")
        
        let vijayTotal3rdYearGainedBtechMarks:UInt16 = (vijay3rdYear1stSemResults.thirdYear1stSemGainedMarks)+(vijay3rdYear2ndSemResults.thirdYear2ndSemGainedMarks)
        
        print("Vijay 3rd Year B-Tech Total Marks = \(vijayTotal3rdYearGainedBtechMarks)")
        
        let total3rdYearMarks:Float = 1500
        
        let vijayThirdYearBtechPercentage:Float = (Float(vijayTotal3rdYearGainedBtechMarks)/total3rdYearMarks)*100
        
        print("Vijay 3rd Year B-Tech Percentage = \(vijayThirdYearBtechPercentage)")
        
        if (vijay3rdYear1stSemResults.thirdYear1stSemResults == true && vijay3rdYear2ndSemResults.thirdYear2ndSemResults == true)
        {
            switch vijayThirdYearBtechPercentage{
            case 90...100:
                print("Grade A")
            case 75..<90:
                print("Grade B")
            case 50..<75:
                print("Grade C")
            case 35..<50:
                print("Grade D")
            default:
                print("Grade E")
            }
            print("Vijay Passed 3rd Year B-Tech")
        } else {
            print("Vijay Failed 3rd Year B-Tech")
        }
        
        // Forth Year B-Tech Results
        
        let vijay4thYear1stSemResults = cal4thYear1stSemBtechResults(DEPMarks: 78, DSPMarks: 84, fundamentalsOfHVDCFactsDevicesMarks: 62)
        
        print("Vijay B-Tech 4th Year 1st Sem Total Marks = \(vijay4thYear1stSemResults.fourthYear1stSemGainedMarks)")
        print("Vijay B-Tech 4th Year 1st Sem Percentage = \(vijay4thYear1stSemResults.fourthYear1stSemPercentage)")
        
        let vijay4thYear2ndsemResults = cal4thYear2ndSemBtechResults()
        
        print("Vijay B-Tech 4th Year 2nd Sem Total Marks = \(vijay4thYear2ndsemResults.fourthYear2ndSemGainedMarks)")
        print("Vijay B-Tech 4th Year 2nd Sem Percentage = \(vijay4thYear2ndsemResults.fourthYear2ndSemPercentage)")
        
        let vijayTotal4thYearGainedBtechMarks:UInt16 = (vijay4thYear1stSemResults.fourthYear1stSemGainedMarks)+(vijay4thYear2ndsemResults.fourthYear2ndSemGainedMarks)
        
        print("Vijay 4th Year B-Tech Total Marks = \(vijayTotal4thYearGainedBtechMarks)")
        
        let total4thYearMarks:Float = 1500
        
        let vijayFourthYearBtechPercentage:Float = (Float(vijayTotal4thYearGainedBtechMarks)/total4thYearMarks)*100
        
        print("Vijay 4th Year B-Tech Percentage = \(vijayFourthYearBtechPercentage)")
        
        if (vijay4thYear1stSemResults.fourthYear1stSemResults == true && vijay4thYear2ndsemResults.fourthYear2ndSemResults == true)
        {
            switch vijayFourthYearBtechPercentage{
            case 90...100:
                print("Grade A")
            case 75..<90:
                print("Grade B")
            case 50..<75:
                print("Grade C")
            case 35..<50:
                print("Grade D")
            default:
                print("Grade E")
            }
            print("Vijay Passed 4th Year B-Tech")
        } else {
            print("Vijay Failed 4th Year B-Tech")
        }
        
        //Overall B-Tech Results
        
        let vijayfirstGainedMarks:UInt16 = vijay1stYearBtechResults.gained1stYearBtechMarks
        
        let vijayTotalGainedMarksBtech:UInt16 = vijayfirstGainedMarks + vijayTotal2ndYearGainedBtechMarks + vijayTotal3rdYearGainedBtechMarks + vijayTotal4thYearGainedBtechMarks
        
        print("Vijay B-Tech Total Marks = \(vijayTotalGainedMarksBtech)")
        
        let totalBtechMarks:Float = 5500
        
        let vijayBtechPercentage:Float = (Float(vijayTotalGainedMarksBtech)/totalBtechMarks)*100
        
        print("Vijay B-Tech Percentage = \(vijayBtechPercentage)")
        
        if (vijay1stYearBtechResults.firstYearBtechResults == true && vijay2ndYear1stSemResults.secondYear1stSemResults == true && vijay2ndYear2ndSemResults.secondYear2ndSemResults == true && vijay3rdYear1stSemResults.thirdYear1stSemResults == true && vijay3rdYear2ndSemResults.thirdYear2ndSemResults == true && vijay4thYear1stSemResults.fourthYear1stSemResults == true && vijay4thYear2ndsemResults.fourthYear2ndSemResults == true)
        {
            switch vijayBtechPercentage
            {
            case 90...100:
                print("Grade A")
            case 75..<90:
                print("Grade B")
            case 50..<75:
                print("Grade C")
            case 35..<50:
                print("Grade D")
            default:
                print("Grade E")
            }
            print("Vijay Passed B-Tech")
        } else {
            print("Vijay Failed B-Tech")
        }
        
        
        
        
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }


    func calFirstYearBtechResults(communicativeEngMarks:UInt8,enggPhysicsMarks:UInt8,enggChemistryMarks:UInt8,mathematics1Marks:UInt8,proCAndDatastructureMarks:UInt8,mathematics2Marks:UInt8,enggGraphicsMarks:UInt8,proCDatastrucLabMarks:UInt8,enggPhyAndEnggCheLabMarks:UInt8,enggAndITWorkShopMarks:UInt8,enggLangComSkillLabMarks:UInt8)->(firstYearBtechResults:Bool,gained1stYearBtechMarks:UInt16,firstYearBtechPercentage:Float)
    {
    
    // Calculating Total Marks
    
    let gained1stYearBtechMarks:UInt16 = UInt16(communicativeEngMarks)+UInt16(enggPhysicsMarks)+UInt16(enggChemistryMarks)+UInt16(enggGraphicsMarks)+UInt16(proCAndDatastructureMarks)+UInt16(enggPhyAndEnggCheLabMarks)+UInt16(enggAndITWorkShopMarks)+UInt16(enggLangComSkillLabMarks)+UInt16(mathematics2Marks)+UInt16(mathematics1Marks)
    
    
    
    let firstYearBtechTotalMarks:Float = 1000
    
    let firstYearBtechMarks:Float = Float(gained1stYearBtechMarks)
    
    let firstYearBtechPercentage:Float = (firstYearBtechMarks/firstYearBtechTotalMarks)*100
    
    
    let subPassMarks:UInt8 = 35
    let labPassMarks:UInt8 = 27
    
    var communicativeEnglish:Bool = false
    var engineeringPhysics:Bool = false
    var engineeringChemistry:Bool = false
    var engineeringGraphics:Bool = false
    var programmingCAndDataStructure:Bool = false
    var engineeringPhysicsAndEngineeringChemistryLab:Bool = false
    var mathematics1:Bool = false
    var mathematics2:Bool = false
    var engineeringAndITWorkShop:Bool = false
    var englishLanguageCommunicationSkillLab:Bool = false
    var programmingCAndDataStructureLab:Bool = false
    
    if communicativeEngMarks >= subPassMarks
    {
    communicativeEnglish = true
    } else {
    communicativeEnglish = false
    }
    
    if enggGraphicsMarks >= subPassMarks
    {
    engineeringGraphics = true
    } else {
    engineeringGraphics = false
    }
    
    if enggChemistryMarks >= subPassMarks
    {
    engineeringChemistry = true
    } else {
    engineeringChemistry = false
    }
    
    if mathematics1Marks >= subPassMarks
    {
    mathematics1 = true
    } else {
    mathematics1 = false
    }
    
    if mathematics2Marks >= subPassMarks
    {
    mathematics2 = true
    } else {
    mathematics2 = false
    }
    
    if proCAndDatastructureMarks >= subPassMarks
    {
    programmingCAndDataStructure = true
    } else {
    programmingCAndDataStructure = false
    }
    
    if enggPhyAndEnggCheLabMarks >= labPassMarks
    {
    engineeringPhysicsAndEngineeringChemistryLab = true
    } else {
    engineeringPhysicsAndEngineeringChemistryLab = false
    }
    
    if enggAndITWorkShopMarks >= labPassMarks
    {
    engineeringAndITWorkShop = true
    } else {
    engineeringAndITWorkShop = false
    }
    
    if proCDatastrucLabMarks >= labPassMarks
    {
    programmingCAndDataStructureLab = true
    } else {
    programmingCAndDataStructureLab = false
    }
    
    if enggLangComSkillLabMarks >= labPassMarks
    {
    englishLanguageCommunicationSkillLab = true
    } else {
    englishLanguageCommunicationSkillLab = false
    }
    
    if enggPhysicsMarks >= subPassMarks
    {
    engineeringPhysics = true
    } else {
    engineeringPhysics = false
    }
    
    // finding out B-Tech 1st Year Passed or Failed and giving grade
    
    
    var firstYearBtechResults:Bool = false
    
    if (communicativeEnglish == true && engineeringGraphics == true && engineeringChemistry == true && mathematics1 == true && mathematics2 == true && programmingCAndDataStructure == true && engineeringPhysicsAndEngineeringChemistryLab == true && engineeringAndITWorkShop == true && programmingCAndDataStructureLab == true && englishLanguageCommunicationSkillLab == true && engineeringPhysics == true)
    {
    
    firstYearBtechResults = true
    print("Passed B-Tech 1st Year")
    
    }
    else
    {
    firstYearBtechResults = false
    print("Failed B-Tech 1st Year")
    }
    
    let firstYearBtechResult:(firstYearBtechResults:Bool,gained1stYearBtechMarks:UInt16,firstYearBtechPercentage:Float) = (firstYearBtechResults,gained1stYearBtechMarks,firstYearBtechPercentage)
    
    return firstYearBtechResult
    }
    

    func cal2ndYear1stSemBtechResults(mathematics3Marks:UInt8,environmentalSciMarks:UInt8,basicFMHMMarks:UInt8,elecDevCirsMarks:UInt8,elecMachines1Marks:UInt8,elecCircuitsMarks:UInt8,basicFMHMLabMarks:UInt8,electronicDevCirsLabMarks:UInt8 = 70) -> (secondYear1stSemGainedMarks:UInt16,secondYear1stSemPercentage:Float,secondYear1stSemResults:Bool)
    {
        // Calculating Total Marks
        
        let secondYear1stSemGainedMarks:UInt16 = UInt16(mathematics3Marks)+UInt16(environmentalSciMarks)+UInt16(basicFMHMMarks)+UInt16(elecDevCirsMarks)+UInt16(elecMachines1Marks)+UInt16(elecCircuitsMarks)+UInt16(basicFMHMLabMarks)+UInt16(electronicDevCirsLabMarks)
        
        //print("B-Tech 2nd Year 1st Sem Total Marks = \(secondYear1stSemGainedMarks)")
        
        // Calculating Percentage
        
        let totalMarks1stSem:Float = 750
        
        let firstSemGainedMarks:Float = Float(secondYear1stSemGainedMarks)
        
        let secondYear1stSemPercentage:Float = (firstSemGainedMarks/totalMarks1stSem)*100
        
        //print("B-Tech 2nd Year 1st Sem Percentage = \(secondYear1stSemPercentage)")
        
        // finding out subject wise pass or fail
        
        let subPassMarks:UInt8 = 35
        let labPassMarks:UInt8 = 27
        
        var mathematics3:Bool = false
        var environmentalScience:Bool = false
        var basicFMHM:Bool = false
        var electronicDevicesAndCircuits:Bool = false
        var electricalMachines1:Bool = false
        var electricalCircuits:Bool = false
        var basicFMHMLab:Bool = false
        var electronicDevicesAndCircuitsLab:Bool = false
        
        if mathematics3Marks >= subPassMarks
        {
            mathematics3 = true
        } else {
            mathematics3 = false
        }
        
        if environmentalSciMarks >= subPassMarks
        {
            environmentalScience = true
        } else {
            environmentalScience = false
        }
        
        if basicFMHMMarks >= subPassMarks
        {
            basicFMHM = true
        } else {
            basicFMHM = false
        }
        
        if elecDevCirsMarks >= subPassMarks
        {
            electronicDevicesAndCircuits = true
        } else {
            electronicDevicesAndCircuits = false
        }
        
        if elecMachines1Marks >= subPassMarks
        {
            electricalMachines1 = true
        } else {
            electricalMachines1 = false
        }
        
        if elecCircuitsMarks >= subPassMarks
        {
            electricalCircuits = true
        } else {
            electricalCircuits = false
        }
        
        if basicFMHMLabMarks >= labPassMarks
        {
            basicFMHMLab = true
        } else {
            basicFMHMLab = false
        }
        
        if  electronicDevCirsLabMarks >= labPassMarks
        {
            electronicDevicesAndCircuitsLab = true
        } else {
            electronicDevicesAndCircuitsLab = false
        }
        
        // Total 2nd Year 1st Sem pass or fail with grade
        
        var secondYear1stSemResults:Bool = false
        
        if (mathematics3 == true && environmentalScience == true && basicFMHM == true && electronicDevicesAndCircuits == true && electricalMachines1 == true && electricalCircuits == true && basicFMHMLab == true && electronicDevicesAndCircuitsLab == true)
        {
            
            secondYear1stSemResults = true
            //print("B-Tech 2nd Year 1st Sem Passed")
        }
        else
        {
            secondYear1stSemResults = false
            //print("B-Tech 2nd Year 1st Sem Failed")
        }
        
        
        let seconYear1stSemBtechResult:(secondYear1stSemGainedMarks:UInt16,secondYear1stSemPercentage:Float,secondYear1stSemResults:Bool) = (secondYear1stSemGainedMarks,secondYear1stSemPercentage,secondYear1stSemResults)
        
        return seconYear1stSemBtechResult
        
    }
    
    
    
    
    func cal2ndYear2ndSemBtechResults(EMFMarks:UInt8,GEPMarks:UInt8,AECMarks:UInt8,STLDMarks:UInt8,NTMarks:UInt8,EM2Marks:UInt8,EM1LabMarks:UInt8 = 71,ECSLabMarks:UInt8 = 72) -> (secondYear2ndSemGainedMarks:UInt16,secondYear2ndSemPercentage:Float,secondYear2ndSemResults:Bool)
    {
        // Calculating Total Marks
        
        let secondYear2ndSemGainedMarks:UInt16 = UInt16(EMFMarks)+UInt16(GEPMarks)+UInt16(AECMarks)+UInt16(STLDMarks)+UInt16(EM2Marks)+UInt16(NTMarks)+UInt16(EM1LabMarks)+UInt16(ECSLabMarks)
        
        //print("B-Tech 2nd Year 2nd Sem Total Marks = \(secondYear2ndSemGainedMarks)")
        
        // Calculating Percentage
        
        let totalMarks2ndSem:Float = 750
        
        let secondSemGainedMarks:Float = Float(secondYear2ndSemGainedMarks)
        
        let secondYear2ndSemPercentage:Float = (secondSemGainedMarks/totalMarks2ndSem)*100
        
        //print("B-Tech 2nd Year 2nd Sem Percentage = \(secondYear2ndSemPercentage)")
        
        // finding out subject wise pass or fail
        
        let subPassMarks:UInt8 = 35
        let labPassMarks:UInt8 = 27
        
        var electroMagneticField:Bool = false
        var generationOfElectricalPower:Bool = false
        var analogElectroniccsAndCircuts:Bool = false
        var switchingThoeryAndLogicalDesign:Bool = false
        var electricalMachines2:Bool = false
        var NetworkTheory:Bool = false
        var electricalMachines1Lab:Bool = false
        var electricalCircuitsAndSimulationLab:Bool = false
        
        if EMFMarks >= subPassMarks
        {
            electroMagneticField = true
        } else {
            electroMagneticField = false
        }
        
        if GEPMarks >= subPassMarks
        {
            generationOfElectricalPower = true
        } else {
            generationOfElectricalPower = false
        }
        
        if AECMarks >= subPassMarks
        {
            analogElectroniccsAndCircuts = true
        } else {
            analogElectroniccsAndCircuts = false
        }
        
        if STLDMarks >= subPassMarks
        {
            switchingThoeryAndLogicalDesign = true
        } else {
            switchingThoeryAndLogicalDesign = false
        }
        
        if EM2Marks >= subPassMarks
        {
            electricalMachines2 = true
        } else {
            electricalMachines2 = false
        }
        
        if NTMarks >= subPassMarks
        {
            NetworkTheory = true
        } else {
            NetworkTheory = false
        }
        
        if EM1LabMarks >= labPassMarks
        {
            electricalMachines1Lab = true
        } else {
            electricalMachines1Lab = false
        }
        
        if  ECSLabMarks >= labPassMarks
        {
            electricalCircuitsAndSimulationLab = true
        } else {
            electricalCircuitsAndSimulationLab = false
        }
        
        // Total 2nd Year 2nd Sem pass or fail with grade
        
        var secondYear2ndSemResults:Bool = false
        
        if (electroMagneticField == true && generationOfElectricalPower == true && switchingThoeryAndLogicalDesign == true && analogElectroniccsAndCircuts == true && electricalMachines2 == true && NetworkTheory == true && electricalMachines1Lab == true && electricalCircuitsAndSimulationLab == true)
        {
           
            secondYear2ndSemResults = true
            print("B-Tech 2nd Year 2nd Sem Passed")
        }
        else
        {
            secondYear2ndSemResults = false
            print("B-Tech 2nd Year 2nd Sem Failed")
        }
        
        let secondYear2ndSemBtechResult:(secondYear2ndSemGainedMarks:UInt16,secondYear2ndSemPercentage:Float,secondYear2ndSemResults:Bool) = (secondYear2ndSemGainedMarks,secondYear2ndSemPercentage,secondYear2ndSemResults)
        
        return secondYear2ndSemBtechResult
        
    }
    
    
    
    func cal3rdYear1stSemBtechResults(MEFAMarks:UInt8,EEMMarks:UInt8,TEPMarks:UInt8,CSMarks:UInt8,PEMarks:UInt8,EM3Marks:UInt8 = 86,EMLab2Marks:UInt8 = 68,CSSimLabMarks:UInt8 = 56) -> (thirdYear1stSemGainedMarks:UInt16,thirdYear1stSemPercentage:Float,thirdYear1stSemResults:Bool)
    {
        // Calculating Total Marks
        
        let thirdYear1stSemGainedMarks:UInt16 = UInt16(MEFAMarks)+UInt16(EEMMarks)+UInt16(TEPMarks)+UInt16(CSMarks)+UInt16(PEMarks)+UInt16(EM3Marks)+UInt16(EMLab2Marks)+UInt16(CSSimLabMarks)
        
        
        //print("B-Tech 3rd Year 1st Sem Percentage = \(thirdYear1stSemGainedMarks)")
        
        // Calculating Percentage
        
        let totalMarks1stSem:Float = 750
        
        let thirdYearFirstSemGainedMarks:Float = Float(thirdYear1stSemGainedMarks)
        
        let thirdYear1stSemPercentage:Float = (thirdYearFirstSemGainedMarks/totalMarks1stSem)*100
        
        //print("B-Tech 3rd Year 1st Sem Percentage = \(thirdYear1stSemPercentage)")
        
        // finding out subject wise pass or fail
        
        let subPassMarks:UInt8 = 35
        let labPassMarks:UInt8 = 27
        
        var managerialEconomicsAndFinancialAnalysis:Bool = false
        var electricalAndElectronicsMeasurements:Bool = false
        var transmissionOfELectricalPower:Bool = false
        var controlSystems:Bool = false
        var powerElectronics:Bool = false
        var electricalMachines3:Bool = false
        var electricalMachinesLab2:Bool = false
        var controlSystemsAndSimulationLab:Bool = false
        
        if MEFAMarks >= subPassMarks
        {
            managerialEconomicsAndFinancialAnalysis = true
        } else {
            managerialEconomicsAndFinancialAnalysis = false
        }
        
        if EEMMarks >= subPassMarks
        {
            electricalAndElectronicsMeasurements = true
        } else {
            electricalAndElectronicsMeasurements = false
        }
        
        if TEPMarks >= subPassMarks
        {
            transmissionOfELectricalPower = true
        } else {
            transmissionOfELectricalPower = false
        }
        
        if CSMarks >= subPassMarks
        {
            controlSystems = true
        } else {
            controlSystems = false
        }
        
        if PEMarks >= subPassMarks
        {
            powerElectronics = true
        } else {
            powerElectronics = false
        }
        
        if EM3Marks >= subPassMarks
        {
            electricalMachines3 = true
        } else {
            electricalMachines3 = false
        }
        
        if EMLab2Marks >= labPassMarks
        {
            electricalMachinesLab2 = true
        } else {
            electricalMachinesLab2 = false
        }
        
        if  CSSimLabMarks >= labPassMarks
        {
            controlSystemsAndSimulationLab = true
        } else {
            controlSystemsAndSimulationLab = false
        }
        
        // Total 3rd Year 1st Sem pass or fail with grade
        
        var thirdYear1stSemResults:Bool = false
        
        if (managerialEconomicsAndFinancialAnalysis == true && electricalAndElectronicsMeasurements == true && transmissionOfELectricalPower == true && controlSystems == true && powerElectronics == true && electricalMachines3 == true && electricalMachinesLab2 == true && controlSystemsAndSimulationLab == true)
        {
            
            thirdYear1stSemResults = true
            print("B-Tech 3rd Year 1st Sem Passed")
        }
        else
        {
            thirdYear1stSemResults = false
            print("B-Tech 3rd Year 1st Sem Failed")
        }
        
        let thirdYear1stSemBtechResult:(thirdYear1stSemGainedMarks:UInt16,thirdYear1stSemPercentage:Float,thirdYear1stSemResults:Bool) = (thirdYear1stSemGainedMarks,thirdYear1stSemPercentage,thirdYear1stSemResults)
        
        return thirdYear1stSemBtechResult
        
    }
    
    
    
    func cal3rdYear2ndSemBtechResults(MSMarks:UInt8,PSDMarks:UInt8,PSAMarks:UInt8,MPMCMarks:UInt8,PSOCMarks:UInt8 = 74,LDICAMarks:UInt8 = 48,AECSLLabMarks:UInt8 = 61,EMLabMarks:UInt8 = 58) -> (thirdYear2ndSemGainedMarks:UInt16,thirdYear2ndSemPercentage:Float,thirdYear2ndSemResults:Bool)
    {
        // Calculating Total Marks
        
        let thirdYear2ndSemGainedMarks:UInt16 = UInt16(MSMarks)+UInt16(PSDMarks)+UInt16(PSAMarks)+UInt16(MPMCMarks)+UInt16(PSOCMarks)+UInt16(LDICAMarks)+UInt16(AECSLLabMarks)+UInt16(EMLabMarks)
        
        //print("B-Tech 3rd Year 2nd Sem Total = \(thirdYear2ndSemGainedMarks)")
        
        // Calculating Percentage
        
        let totalMarks2ndSem:Float = 750
        
        let thirdYearSecondSemGainedMarks:Float = Float(thirdYear2ndSemGainedMarks)
        
        let thirdYear2ndSemPercentage:Float = (thirdYearSecondSemGainedMarks/totalMarks2ndSem)*100
        
        //print("B-Tech 3rd Year 2nd Sem Percentage = \(thirdYear2ndSemPercentage)")
        
        // finding out subject wise pass or fail
        
        let subPassMarks:UInt8 = 35
        let labPassMarks:UInt8 = 27
        
        var managementScience:Bool = false
        var powerSemiconductorDrives:Bool = false
        var powerSystemAnalysis:Bool = false
        var microprocessorsAndMicrocontrollers:Bool = false
        var powerOperationsAndControl:Bool = false
        var linearAndDigitalICApplications:Bool = false
        var advancedEnglishCommunicationSkillsLab:Bool = false
        var electricalMeasurementsLab:Bool = false
        
        if MSMarks >= subPassMarks
        {
            managementScience = true
        } else {
            managementScience = false
        }
        
        if PSDMarks >= subPassMarks
        {
            powerSemiconductorDrives = true
        } else {
            powerSemiconductorDrives = false
        }
        
        if PSAMarks >= subPassMarks
        {
            powerSystemAnalysis = true
        } else {
            powerSystemAnalysis = false
        }
        
        if MPMCMarks >= subPassMarks
        {
            microprocessorsAndMicrocontrollers = true
        } else {
            microprocessorsAndMicrocontrollers = false
        }
        
        if PSOCMarks >= subPassMarks
        {
            powerOperationsAndControl = true
        } else {
            powerOperationsAndControl = false
        }
        
        if LDICAMarks >= subPassMarks
        {
            linearAndDigitalICApplications = true
        } else {
            linearAndDigitalICApplications = false
        }
        
        if AECSLLabMarks >= labPassMarks
        {
            advancedEnglishCommunicationSkillsLab = true
        } else {
            advancedEnglishCommunicationSkillsLab = false
        }
        
        if  EMLabMarks >= labPassMarks
        {
            electricalMeasurementsLab = true
        } else {
            electricalMeasurementsLab = false
        }
        
        // Total 3rd Year 2nd Sem pass or fail with grade
        
        var thirdYear2ndSemResults:Bool = false
        
        if (managementScience == true && powerSemiconductorDrives == true && powerSystemAnalysis == true && microprocessorsAndMicrocontrollers == true && powerOperationsAndControl == true && linearAndDigitalICApplications == true && electricalMeasurementsLab == true && advancedEnglishCommunicationSkillsLab == true)
        {
            
            thirdYear2ndSemResults = true
            print("B-Tech 3rd Year 2nd Sem Passed")
        }
        else
        {
            thirdYear2ndSemResults = false
            print("B-Tech 3rd Year 2nd Sem Failed")
        }
        
        let thirdYear2ndSemBtechResult:(thirdYear2ndSemGainedMarks:UInt16,thirdYear2ndSemPercentage:Float,thirdYear2ndSemResults:Bool) = (thirdYear2ndSemGainedMarks,thirdYear2ndSemPercentage,thirdYear2ndSemResults)
        
        return thirdYear2ndSemBtechResult
        
    }
    
    
    
    func cal4thYear1stSemBtechResults(DEPMarks:UInt8,DSPMarks:UInt8,fundamentalsOfHVDCFactsDevicesMarks:UInt8,SGPMarks:UInt8 = 87,InstrumentationMarks:UInt8 = 89,OTMarks:UInt8 = 92,MPMCLabMarks:UInt8 = 65,PESimLabMarks:UInt8 = 69) -> (fourthYear1stSemGainedMarks:UInt16,fourthYear1stSemPercentage:Float,fourthYear1stSemResults:Bool)
    {
        // Calculating Total Marks
        
        let fourthYear1stSemGainedMarks:UInt16 = UInt16(DEPMarks)+UInt16(DSPMarks)+UInt16(fundamentalsOfHVDCFactsDevicesMarks)+UInt16(SGPMarks)+UInt16(InstrumentationMarks)+UInt16(OTMarks)+UInt16(MPMCLabMarks)+UInt16(PESimLabMarks)
        
        //print("B-Tech 4th Year 1st Sem Total Marks = \(fourthYear1stSemGainedMarks)")
        
        // Calculating Percentage
        
        let totalMarks1stSem:Float = 750
        
        let fourthYearFirstSemGainedMarks:Float = Float(fourthYear1stSemGainedMarks)
        
        let fourthYear1stSemPercentage:Float = (fourthYearFirstSemGainedMarks/totalMarks1stSem)*100
        
        //print("B-Tech 4th Year 1st Sem Percentage = \(fourthYear1stSemPercentage)")
        
        // finding out subject wise pass or fail
        
        let subPassMarks:UInt8 = 35
        let labPassMarks:UInt8 = 27
        
        var distributionOfElectricalPower:Bool = false
        var digitalSignalProcessing:Bool = false
        var fundamentalsOfHVDCFactsDevices:Bool = false
        var switchGearAndProtection:Bool = false
        var Instrumentation:Bool = false
        var optimizationTechniques:Bool = false
        var microprocessorsAndMicrocontrollersLab:Bool = false
        var powerElectronicsAndSimulationLab:Bool = false
        
        if DEPMarks >= subPassMarks
        {
            distributionOfElectricalPower = true
        } else {
            distributionOfElectricalPower = false
        }
        
        if DSPMarks >= subPassMarks
        {
            digitalSignalProcessing = true
        } else {
            digitalSignalProcessing = false
        }
        
        if fundamentalsOfHVDCFactsDevicesMarks >= subPassMarks
        {
            fundamentalsOfHVDCFactsDevices = true
        } else {
            fundamentalsOfHVDCFactsDevices = false
        }
        
        if SGPMarks >= subPassMarks
        {
            switchGearAndProtection = true
        } else {
            switchGearAndProtection = false
        }
        
        if InstrumentationMarks >= subPassMarks
        {
            Instrumentation = true
        } else {
            Instrumentation = false
        }
        
        if OTMarks >= subPassMarks
        {
            optimizationTechniques = true
        } else {
            optimizationTechniques = false
        }
        
        if MPMCLabMarks >= labPassMarks
        {
            microprocessorsAndMicrocontrollersLab = true
        } else {
            microprocessorsAndMicrocontrollersLab = false
        }
        
        if  PESimLabMarks >= labPassMarks
        {
            powerElectronicsAndSimulationLab = true
        } else {
            powerElectronicsAndSimulationLab = false
        }
        
        // Total 4th Year 1st Sem pass or fail with grade
        
        var fourthYear1stSemResults:Bool = false
        
        if (distributionOfElectricalPower == true && digitalSignalProcessing == true && fundamentalsOfHVDCFactsDevices == true && switchGearAndProtection == true && Instrumentation == true && optimizationTechniques == true && microprocessorsAndMicrocontrollersLab == true && powerElectronicsAndSimulationLab == true)
        {
            
            fourthYear1stSemResults = true
            print("B-Tech 4th Year 1st Sem Passed")
        }
        else
        {
            fourthYear1stSemResults = false
            print("B-Tech 4th Year 1st Sem Failed")
        }
        
        let fourthYear1stSemBtechResult:(fourthYear1stSemGainedMarks:UInt16,fourthYear1stSemPercentage:Float,fourthYear1stSemResults:Bool) = (fourthYear1stSemGainedMarks,fourthYear1stSemPercentage,fourthYear1stSemResults)
        
        return fourthYear1stSemBtechResult
        
    }
    
    
    
    func cal4thYear2ndSemBtechResults(PPQMarks:UInt8 = 60,UEEMarks:UInt8 = 67,MCTMarks:UInt8 = 53,EADSMMarks:UInt8 = 67,SeminarMarks:UInt8 = 45,ProjectWorkMarks:UInt16 = 300) -> (fourthYear2ndSemGainedMarks:UInt16,fourthYear2ndSemPercentage:Float,fourthYear2ndSemResults:Bool)
    {
        // Calculating Total Marks
        
        let fourthYear2ndSemGainedMarks:UInt16 = UInt16(PPQMarks)+UInt16(UEEMarks)+UInt16(MCTMarks)+UInt16(EADSMMarks)+UInt16(SeminarMarks)+ProjectWorkMarks
        
        //print("B-Tech 4th Year 2nd Sem Total Marks = \(fourthYear2ndSemGainedMarks)")
        
        // Calculating Percentage
        
        let totalMarks2ndSem:Float = 750
        
        let fourthYearSecondSemGainedMarks:Float = Float(fourthYear2ndSemGainedMarks)
        
        let fourthYear2ndSemPercentage:Float = (fourthYearSecondSemGainedMarks/totalMarks2ndSem)*100
        
        //print("B-Tech 4th Year 2nd Sem Percentage = \(fourthYear2ndSemPercentage)")
        
        // finding out subject wise pass or fail
        
        let subPassMarks:UInt8 = 35
        let projectPassMarks:UInt16 = 90
        let seminarPassMarks:UInt8 = 15
        
        var principlesOfPowerQuality:Bool = false
        var utilizationOfElectricalEnergy:Bool = false
        var modernControlTheory:Bool = false
        var EnergyAuditingAndDemandSideManagement:Bool = false
        var seminar:Bool = false
        var projectWork:Bool = false
        
        if PPQMarks >= subPassMarks
        {
            principlesOfPowerQuality = true
        } else {
            principlesOfPowerQuality = false
        }
        
        if UEEMarks >= subPassMarks
        {
            utilizationOfElectricalEnergy = true
        } else {
            utilizationOfElectricalEnergy = false
        }
        
        if MCTMarks >= subPassMarks
        {
            modernControlTheory = true
        } else {
            modernControlTheory = false
        }
        
        if EADSMMarks >= subPassMarks
        {
            EnergyAuditingAndDemandSideManagement = true
        } else {
            EnergyAuditingAndDemandSideManagement = false
        }
        
        if SeminarMarks >= seminarPassMarks
        {
            seminar = true
        } else {
            seminar = false
        }
        
        if ProjectWorkMarks >= projectPassMarks
        {
            projectWork = true
        } else {
            projectWork = false
        }
        
        
        // Total 4th Year 2nd Sem pass or fail with grade
        
        var fourthYear2ndSemResults:Bool = false
        
        if (principlesOfPowerQuality == true && utilizationOfElectricalEnergy == true && modernControlTheory == true && EnergyAuditingAndDemandSideManagement == true && seminar == true && projectWork == true)
        {
            
            fourthYear2ndSemResults = true
            print("B-Tech 4th Year 2nd Sem Passed")
        }
        else
        {
            fourthYear2ndSemResults = false
            print("B-Tech 4th Year 2nd Sem Failed")
        }
        
        let fourthYear2ndSemBtechResult:(fourthYear2ndSemGainedMarks:UInt16,fourthYear2ndSemPercentage:Float,fourthYear2ndSemResults:Bool) = (fourthYear2ndSemGainedMarks,fourthYear2ndSemPercentage,fourthYear2ndSemResults)
        
        return fourthYear2ndSemBtechResult
        
    }
    

    
}

