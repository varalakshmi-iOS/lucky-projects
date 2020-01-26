//
//  UserDashboard.swift
//  Dashboard Snippets
//
//  Created by GARLAPATI SAIRAM on 9/11/19.
//  Copyright © 2019 GARLAPATI SAIRAM. All rights reserved.
//

import UIKit

class UserDashboard: NSObject {
    var URLReqObj:URLRequest!
    
    var dataTaskObj:URLSessionDataTask!
    var holidaysReasons:String = ""
    var holidaysDate:String = ""
    var leavesReasons:String = ""
    var leaveDates:String = ""
    var lateCheckIn = ""
    var lateCheckInDate = ""
    var workingHrsDate = ""
    var spentTime = ""
    
    func getValidatePulseLogin(){
        
        URLReqObj=URLRequest(url:URL(string:"https://www.brninfotech.com/pulse/modules/admin/ValidateLogin.php")!)
        
        URLReqObj.httpMethod="POST"
        
        var dataToSend =
            
        "registeredEmail=garlapati.gsr@gmail.com&registeredPassword=sai2122&funcName=verifyLogin"
        
        URLReqObj.httpBody = dataToSend.data(using:String.Encoding.utf8)
        
        dataTaskObj = URLSession.shared.dataTask(with: URLReqObj)  { (data, connectionDetails, error)in
            
            print("got data from server")
            
            do{
                
                let convertedData = try JSONSerialization.jsonObject(with:data!, options:JSONSerialization.ReadingOptions.allowFragments) as!  [String:String]
                
                print(convertedData.count)
            }
                
            catch{
                
                print("something went wrong")
            }
            
        }
        
        dataTaskObj.resume()
    }
    
    //attendance details
    
    func getUserAttendance(textView:UITextView,UItextview:UITextView,stringVar:String){
        
        
        URLReqObj = URLRequest(url: URL(string: "https://www.brninfotech.com/pulse/modules/admin/DashboardSnippets.php?")!)
        
        URLReqObj.httpMethod = "POST"
        
        let dataToSend = "funcName=getUserAttendance&studentIDByAdmin=NoValue"
        
        URLReqObj.httpBody = dataToSend.data(using: String.Encoding.utf8)
        
        dataTaskObj = URLSession.shared.dataTask(with: URLReqObj) { (Data, URLResponse, Error) in
            do{
                var convertedData = try JSONSerialization.jsonObject(with: Data!, options: JSONSerialization.ReadingOptions.allowFragments) as![[String:Any]]
                print(convertedData)
                
                // Get Holidays
                if(stringVar == "Holidays")
                {
                for i in 1..<convertedData.count
                {
                    if(convertedData[i]["isAttended"] as? Bool == false )
                    {
                        self.holidaysReasons.append("\(convertedData[i]["reasonForNonAttendance"]! as! String)  \n\n")
                        self.holidaysDate.append("\(convertedData[i]["attendanceDate"]! as! String) \n\n")
                        
                        print(self.holidaysReasons)
                        DispatchQueue.main.async {
                            textView.text = self.holidaysDate as! String
                            UItextview.text = self.holidaysReasons as! String
                        }
                        //print("aaaaaaaaa")
                    }
                }
                }
                else
                {//Get Leaves
                    if(stringVar == "Leaves")
                    {
                        for i in 1..<convertedData.count
                        {
                            if((convertedData[i]["reasonForNonAttendance"] as? String)?.prefix(12) == "Casual Leave" || (convertedData[i]["reasonForNonAttendance"] as? String)?.prefix(14) == "Emergency Leave" || (convertedData[i]["reasonForNonAttendance"] as? String)?.prefix(9) == "Sick Leave" && convertedData[i]["isAttended"] as? Bool == false)
                            {
                                self.leavesReasons.append("\(convertedData[i]["reasonForNonAttendance"]! as! String)  \n\n")
                                self.leaveDates.append("\(convertedData[i]["attendanceDate"]! as! String) \n\n")
                                
                                print(self.holidaysReasons)
                                DispatchQueue.main.async {
                                    textView.text = self.leaveDates as! String
                                    UItextview.text = self.leavesReasons as! String
                                }// dispatchQueue
                            }// inner if condition
                        }// else for loop
                    }//else if condition
                    
                    // Get Late Details
                    if (stringVar == "Late")
                    {
                        for i in 1..<convertedData.count
                        {
                            if(convertedData[i]["isAttended"] as? Bool == true && convertedData[i]["isLateCheckIn"] as? Bool == true)
                            {
                                self.lateCheckIn.append("\(convertedData[i]["checkIn"]! as! String)  \n\n")
                                self.lateCheckInDate.append("\(convertedData[i]["attendanceDate"]! as! String) \n\n")
                                
                                print(self.holidaysReasons)
                                DispatchQueue.main.async {
                                    textView.text = self.lateCheckInDate as! String
                                    UItextview.text = self.lateCheckIn as! String
                                }// dispatchQueue
                            }
                        }
                    }
                
                    
                }//outer else
                
                // Get Working Hrs
                if(stringVar == "Hours")
                {
                    for i in 1..<convertedData.count
                    {
                        if(convertedData[i]["isAttended"] as? Bool == true)
                        {
                            self.spentTime.append("\(convertedData[i]["timeSpent"]! as! String)  \n\n")
                            self.workingHrsDate.append("\(convertedData[i]["attendanceDate"]! as! String) \n\n")
                            
                            print(self.holidaysReasons)
                            DispatchQueue.main.async {
                                textView.text = self.workingHrsDate as! String
                                UItextview.text = self.spentTime as! String
                            }// dispatchQueue
                        }
                    }
                }
                
            } catch {
                print("the error is \(String(describing: Error))")
            }
        }
        dataTaskObj.resume()
    }


}
