//
//  ViewController.swift
//  Button and Label
//
//  Created by Varalakshmi Kacherla on 11/9/19.
//  Copyright © 2019 Varalakshmi Kacherla. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var submitButton:UIButton!
    var firstName:UILabel!
    var firstNameTextField:UITextField!
    var lastName:UILabel!
    var lastNameTextField:UITextField!
    var gender:UISegmentedControl!
    var textGender:UILabel!
    var age:UISlider!
    var textAge:UILabel!
    var maritalStatus:UISwitch!
    var textMaritalStatus:UILabel!
    var noOfMobiles:UIStepper!
    var textNoOfMobiles:UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.cyan
        
        let state = UILabel(frame: CGRect(x: 50, y: 90, width: 200, height: 50))
        state.text = "State"
        view.addSubview(state)
        
        let stateName = UILabel(frame: CGRect(x: 200, y: 90, width: 200, height: 50))
        view.addSubview(stateName)
        
        let city = UILabel(frame: CGRect(x: 50, y: 140, width: 200, height: 50))
        city.text = "City"
        view.addSubview(city)
        
        let cityName = UILabel(frame: CGRect(x: 200, y: 140, width: 200, height: 50))
        view.addSubview(cityName)
        
        let actor = UILabel(frame: CGRect(x: 50, y: 180, width: 200, height: 50))
        actor.text = "Actor"
        view.addSubview(actor)
        
        
        let actorName = UILabel(frame: CGRect(x: 200, y: 180, width: 200, height: 50))
        view.addSubview(actorName)
        
        
        let quote = UILabel(frame: CGRect(x: 50, y: 230, width: 200, height: 50))
        quote.text = "Quote"
        view.addSubview(quote)
        
        let quoteName = UILabel(frame: CGRect(x: 200, y: 230, width: 200, height: 50))
        view.addSubview(quoteName)
        
        
        
        
        
        firstName = UILabel()
        firstName.frame = CGRect(x: 50, y: 290, width: 300, height: 50)
        firstName.text = "FirstName"
        view.addSubview(firstName)
        
        firstNameTextField = UITextField()
        firstNameTextField.frame = CGRect(x: 200, y: 290, width: 200, height: 50)
        firstNameTextField.text = "Varalakshmi"
        firstNameTextField.borderStyle = UITextField.BorderStyle.roundedRect
        firstNameTextField.textColor = UIColor.red
        view.addSubview(firstNameTextField)
        
        lastName = UILabel(frame: CGRect(x: 50, y: 350, width: 200, height: 50))
        lastName.text = "LastName"
        view.addSubview(lastName)
        
        lastNameTextField = UITextField(frame: CGRect(x: 200, y: 350, width: 200, height: 50))
        lastNameTextField.text = "Kacherla"
        lastNameTextField.borderStyle = UITextField.BorderStyle.roundedRect
        lastNameTextField.textColor = UIColor.red
        view.addSubview(lastNameTextField)
        
        textGender = UILabel(frame: CGRect(x:50, y: 400, width: 200, height: 50))
        textGender.text = "Gender"
        view.addSubview(textGender)
        
        gender = UISegmentedControl(frame: CGRect(x: 200, y: 400, width: 200, height: 50))
        gender.insertSegment(withTitle: "Male", at: 0, animated: false)
        gender.insertSegment(withTitle: "Female", at: 1, animated: true)
        view.addSubview(gender)
        
        textAge = UILabel(frame: CGRect(x: 50, y: 450, width: 200, height: 50))
        textAge.text = "Age"
        view.addSubview(textAge)
        
        age = UISlider(frame: CGRect(x: 200, y: 470, width: 200, height: 50))
        age.minimumValue = 0
        age.maximumValue = 100
        age.isContinuous = true
        view.addSubview(age)
        
        textMaritalStatus = UILabel(frame: CGRect(x: 50, y: 520, width: 200, height: 50))
        textMaritalStatus.text = "MaritalStatus"
        view.addSubview(textMaritalStatus)
        
        maritalStatus = UISwitch(frame: CGRect(x: 200, y: 530, width: 200, height: 50))
        view.addSubview(maritalStatus)
        
        submitButton = UIButton(frame: CGRect(x: 150, y: 630, width: 150, height: 80))
        submitButton.backgroundColor = UIColor.red
        submitButton.setTitle("Submit", for: UIControl.State.normal)
        view.addSubview(submitButton)
        
        
        getStateDetails(url:"https://brninfotech.com/tws/IndiaDetails.php?type=state&quantity=1", label: stateName)
        
        
        getCityDetails(url:"https://brninfotech.com/tws/IndiaDetails.php?type=city&quantity=1", label: cityName)
        
        
        getActor(dataToSend:"type=actor&quantity=1",label: actorName)
        
        
        getQuote(dataToSend:"type=quote&quantity=1",label: quoteName)
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    
    func getStateDetails(url:String,label:UILabel)
    {
        var  URLReqObj = URLRequest(url: URL(string: url)!)
        URLReqObj.httpMethod = "Get"
        
        var dataTaskObj = URLSession.shared.dataTask(with: URLReqObj, completionHandler: { (data, connectionDetails, error) in
            
            print("got data from server")
            do {
                
                var convertedData = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)as! [String]
                
                print(convertedData)
                
                DispatchQueue.main.async {
                    
                    label.text = convertedData[0]
                    
                }
                
            } catch
            {
                
                print("Something went wrong")
                
            }
            
        })
        
        dataTaskObj.resume()
        
    }
    
    
    // Function for Cities
    
    func getCityDetails(url:String,label: UILabel)
        
    {
        
        var  URLReqObj = URLRequest(url: URL(string: url)!)
        
        URLReqObj.httpMethod = "Get"
        
        var dataTaskObj = URLSession.shared.dataTask(with: URLReqObj, completionHandler: { (data, connectionDetails, error) in
            
            print("got data from server")
            
            do {
                
                var convertedData = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)as! [String]
                
                print(convertedData)
                
                DispatchQueue.main.async {
                    
                    label.text = convertedData[0]
                    
                }
                
            } catch {
                
                print("Something went wrong")
                
            }
            
        })
        
        dataTaskObj.resume()
        
    }
    
    // Function for  Actor Details
    
    func getActor(dataToSend:String,label: UILabel)
        
    {
        
        var  URLReqObj = URLRequest(url: URL(string:"https://brninfotech.com/tws/Quotes.php?")!)
        
        URLReqObj.httpMethod = "POST"
        
        URLReqObj.httpBody = dataToSend.data(using: String.Encoding.utf8)
        
        var dataTaskObj = URLSession.shared.dataTask(with: URLReqObj, completionHandler: { (data, connectionDetails, error) in
            
            
            print("got data from server")
            
            do {
                
                var convertedData = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)as! [String]
                
                print(convertedData)
                
                DispatchQueue.main.async {
                    
                    label.text = convertedData[0]
                    
                }
                
            } catch
            {
                
                print("Something went wrong")
                
            }
            
        })
        
        
        
        dataTaskObj.resume()
        
    }
    
    
    
    //function with parameters in Display//
    
    
    
    func getQuote(dataToSend:String,label: UILabel)
        
    {
        
        var  URLReqObj = URLRequest(url: URL(string:"https://brninfotech.com/tws/Quotes.php?")!)
        
        URLReqObj.httpMethod = "POST"
        
        URLReqObj.httpBody = dataToSend.data(using: String.Encoding.utf8)
        
        
        
        var dataTaskObj = URLSession.shared.dataTask(with: URLReqObj, completionHandler: { (data, connectionDetails, error) in
            
            
            print("got data from server")
            
            do {
                
                var convertedData = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)as! [String]
                
                print(convertedData)
                
                DispatchQueue.main.async {
                    
                    label.text = convertedData[0]
                    
                }
                
            } catch {
                
                print("Something went wrong")
                
            }
            
        })
        
        dataTaskObj.resume()
        
    }
    
}






