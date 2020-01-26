//
//  ViewController.swift
//  sqlLite
//
//  Created by Puligilla Rakesh Gupta on 12/18/19.
//  Copyright © 2019 Puligilla Rakesh Gupta. All rights reserved.
//

import UIKit
import SQLite


class ViewController: UIViewController {

    @IBOutlet weak var contactsStackView: UIStackView!
   
    
    var details:String = " "
    var allButtons = [UIButton]()
    var deleteButtons = [UIButton]()
    var data = [String]()
    var allStackView = [UIStackView]()
    
    var firstName = [String]()
    var lastName = [String]()
    var mobileNumber = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
        
    
    override func viewWillAppear(_ animated: Bool) {
        for x in allStackView
        {
            x.removeFromSuperview()
            
        }
          
        allButtons = [UIButton]()
        deleteButtons = [UIButton]()
        data = [String]()
        firstName = [String]()
        lastName = [String]()
        mobileNumber = [String]()
        
        connectsToDataBase.shared.dataBase()
        do {
            var value:Int = 0
            //  retrieving data from database
            let stmt = try connectsToDataBase.shared.dbConnection.run("SELECT FirstName,LastName, MobileNumber from UserDetails")
            for row in stmt {
                  details = " "
            for (index,name) in stmt.columnNames.enumerated() {
                          print("\(name):\(row[index]!)")
                
                if  (index == 0) {
                 firstName.append("\(row[index]!)")
                 data.append("\(row[index]!)")
                }
                if  (index == 1) {
                lastName.append("\(row[index]!)")
                }
                if  (index == 2) {
                mobileNumber.append("\(row[index]!)")
                }
                details = details  + "\n" + ("\(name):\(row[index]!)")
               }
                let button = UIButton()
                button.setTitle(details, for: UIControl.State.normal)
                button.tag = value
                button.titleLabel?.textAlignment = .left
                button.titleLabel?.numberOfLines = 0
                allButtons.append(button)
                button.addTarget(self, action: #selector(navigatesToNextVC(sender:)), for: UIControl.Event.touchUpInside)
                
                
              
                button.translatesAutoresizingMaskIntoConstraints = false
                button.widthAnchor.constraint(equalToConstant: 180).isActive = true
                button.heightAnchor.constraint(equalToConstant: 150).isActive = true
                
                
                let button1 = UIButton()
                let image = UIImage(named: "delete1")
                button1.setImage(image, for: UIControl.State.normal)
                button1.tag = value
                value = value + 1
                deleteButtons.append(button1)
                button1.addTarget(self, action: #selector(deletesSelectedContact(sender:)), for: UIControl.Event.touchUpInside)
                
                
                button1.translatesAutoresizingMaskIntoConstraints = false
                button1.widthAnchor.constraint(equalToConstant: 180).isActive = true
                button1.heightAnchor.constraint(equalToConstant: 150).isActive = true
                
                let stackView = UIStackView(arrangedSubviews: [button])
                stackView.alignment = .leading
                let stackView2 = UIStackView(arrangedSubviews: [button1])
                
                let stackView3 = UIStackView(arrangedSubviews: [stackView, stackView2])
                  contactsStackView.addArrangedSubview(stackView3)
                allStackView.append(stackView3)
                    
                }
                       
            }
                    
            catch {
                        
                print("unable to fetch data")
                  }

        
    }
        
       
    
    @objc func navigatesToNextVC(sender:UIButton) {
        
        

// note: present method disables back button in navigation controller
        
   let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let nextVC = storyboard.instantiateViewController(withIdentifier: "userDetails") as! UserDetailsViewController

        
        print("fname:\(firstName[sender.tag])")
        print("lname:\(lastName[sender.tag])")
        print("email:\(mobileNumber[sender.tag])")
        
            nextVC.fName = self.firstName[sender.tag]
                nextVC.lName = self.lastName[sender.tag]
                nextVC.mNumber = self.mobileNumber[sender.tag]
                nextVC.update = self.data
        nextVC.tag = sender.tag

    navigationController?.pushViewController(nextVC, animated: true)
        
        
    }
    
    
    @objc func deletesSelectedContact(sender:UIButton) {
        
        
        // removes all contact buttons and delete button from viewController
        
            allButtons[sender.tag].removeFromSuperview()
            deleteButtons[sender.tag].removeFromSuperview()
        

        let dataToBeRemoved = data[sender.tag]
       
    
            do {
                
            
                try connectsToDataBase.shared.dbConnection.run ("delete from UserDetails where Firstname = '\(dataToBeRemoved)'")  // sql query for deleting the data

            }
                
         catch {

                    print("unable to delete the data")
                }
        
          
           // popup alerts stating deleted sucessfully
        
        
        
        connectsToDataBase.shared.alert(message: "deleted succesfully")
        present(connectsToDataBase.shared.alertController, animated: true, completion: nil)
        
       }
    

    }


