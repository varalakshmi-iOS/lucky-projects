//
//  AddContactsPage.swift
//  SQLiteDB
//
//  Created by Ankam Ajay Kumar on 17/12/19.
//  Copyright © 2019 Ankam Ajay Kumar. All rights reserved.
//

import UIKit

//import SkyFloatingLabelTextField
import SQLite

class AddContactsPage: UIViewController
{
    
    //MARK:- IBOutlet
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var mobileNumberTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    
    //instance creation
    var db:Connection!
    var alert:UIAlertController!
    var OKAction:UIAlertAction!
    
    //MARK:- IBAction
    @IBAction func saveActionBtn(_ sender: Any) {
        
        saveData()
    }

    @IBAction func updateActionBtn(_ sender: Any) {
        
        updateData()
    }

    @IBAction func uploadImageActionBtn(_ sender: Any) {
        let libraryPhoto = UIImagePickerController()
        //libraryPhoto.delegate = self
        libraryPhoto.sourceType = .photoLibrary
        self.present(libraryPhoto, animated: true, completion: nil)
    }
    
    //MARK:- viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()

        setInObjCreation()
        
        db = SingletonData.shared.dbConnection
    }
    
    //MARK:- viewWillAppear
    override func viewWillAppear(_ animated: Bool) {
        
        if(SingletonData.shared.isCreateBtnTab == false)
        {
            print("nameArray:", SingletonData.shared.nameArray)
            print("ButtonTap:", SingletonData.shared.buttonTapped)
            nameTF.text = SingletonData.shared.nameArray[SingletonData.shared.buttonTapped]
            mobileNumberTF.text = SingletonData.shared.mobileArray[SingletonData.shared.buttonTapped]
            emailTF.text = SingletonData.shared.emailArray[SingletonData.shared.buttonTapped]
        }
    }
    
    //MARK:- Method Creation
    //method for TextField layout with parameters
    func setInTextFieldColor(textField:SkyFloatingLabelTextField, placeholder:String, title:String, tintColor:UIColor, textColor:UIColor, lineColor:UIColor, selectedTitleColor:UIColor, selectedLineColor:UIColor)
    {
        textField.placeholder = placeholder
        textField.title = title
        textField.tintColor = tintColor
        textField.textColor = textColor
        textField.delegate = self
        textField.lineColor = lineColor
        textField.selectedTitleColor = selectedTitleColor
        textField.selectedLineColor = selectedLineColor
    }
    
    //method for objects creation
    func setInObjCreation()
    {
        //calling 'setInTextFieldLayout' method for 'Name' TextField
        setInTextFieldColor(textField: nameTF, placeholder: "Name", title: "Enter Your Name", tintColor: UIColor.black, textColor: UIColor.black, lineColor: .red, selectedTitleColor: #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1), selectedLineColor: #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1))
        
        //calling 'setInTextFieldLayout' method for 'Mobile Number' TextField
        setInTextFieldColor(textField: mobileNumberTF, placeholder: "Mobile Number", title: "Enter Your Mobile Number", tintColor: UIColor.black, textColor: UIColor.black, lineColor: .red, selectedTitleColor: #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1), selectedLineColor: #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1))
        
        //calling 'setInTextFieldLayout' method for 'Email ID' TextField
        setInTextFieldColor(textField: emailTF, placeholder: "Email Address", title: "Enter Your Email Address", tintColor: UIColor.black, textColor: UIColor.black, lineColor: .red, selectedTitleColor: #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1), selectedLineColor: #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1))
    }
    
    //method to save data in SQLite
    func saveData()
    {
        alert = UIAlertController(title: "Well Done!", message: "Contact Saved Successfuly😎 ", preferredStyle: UIAlertController.Style.alert)
        OKAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (save) in
            do
            {
                
                try self.db.run("INSERT INTO Contacts (NAME, MOBILENO, EMAIL) VALUES (?,?,?)", self.nameTF.text!, self.mobileNumberTF.text!, self.emailTF.text!)
                self.navigationController?.popViewController(animated: true)
            }
            catch
            {
                print("Unable to insert data")
            }
        })
        alert.addAction(OKAction)
        self.present(alert, animated: true, completion: nil)
        
    }
    
    //method to update data in SQLite
    func updateData()
    {
        alert = UIAlertController(title: "Well Done!", message: "Contact Updated Successfuly👍 ", preferredStyle: UIAlertController.Style.alert)
        OKAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (update) in
            do
            {
                try self.db.run("UPDATE Contacts SET NAME = '\(self.nameTF.text!)', MOBILENO = '\(self.mobileNumberTF.text!)', EMAIL = '\(self.emailTF.text!)' WHERE ID = \(SingletonData.shared.idArray[SingletonData.shared.buttonTapped])")
                self.navigationController?.popViewController(animated: true)
            }
            catch
            {
                print("Unable to update data", update)
            }
        })
        alert.addAction(OKAction)
        self.present(alert, animated: true, completion: nil)
    }


}
