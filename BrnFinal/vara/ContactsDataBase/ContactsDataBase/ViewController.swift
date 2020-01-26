//
//  ViewController.swift
//  ContactsDataBase
//
//  Created by Varalakshmi Kacherla on 12/24/19.
//  Copyright © 2019 Varalakshmi Kacherla. All rights reserved.
//

import UIKit
import SQLite

class ViewController: UIViewController {
   
    
    @IBOutlet weak var contactStackView: UIStackView!
    
    
       var allButtons = [UIButton]()
       var deleteButtons = [UIButton]()
       var data = [String]()
       var allStackView = [UIStackView]()
       var details:String = " "
       
       var firstName = [String]()
       var lastName = [String]()
       var mobileNo = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        
        contactStackView.spacing = 10
        
        for x in allStackView {
            x.removeFromSuperview()
        }
        
         allButtons = [UIButton]()
         deleteButtons = [UIButton]()
         data = [String]()
         firstName = [String]()
         lastName = [String]()
         mobileNo = [String]()
        
        Data.shared.dataBase()
        do {
            var value:Int = 0
            let stmt = try Data.shared.dbConnection.run("SELECT FirstName,LastName,MobileNo FROM MyContacts")
            
            for row in stmt {
                details = " "
                for (index,name) in stmt.columnNames.enumerated() {
                    
                    print("\(name):\(row[index]!)")
                    
                    if(index == 0) {
                        firstName.append("\(row[index]!)")
                        data.append("\(row[index]!)")
                    }
                    if(index == 1){
                        lastName.append("\(row[index]!)")
                        data.append("\(row[index]!)")
                    }
                    if(index == 2){
                        mobileNo.append("\(row[index]!)")
                        data.append("\(row[index]!)")
                    }
                    details = details + "\n" + ("\(row[index]!)")
                }
                
                let button  = UIButton()
                button.tag = value
                button.setTitle(details, for: UIControl.State.normal)
                button.titleLabel?.textAlignment = .left
                button.titleLabel?.numberOfLines = 0
                allButtons.append(button)
                button.addTarget(self, action: #selector(navigatesToNextVC(sender:)), for: UIControl.Event.touchUpInside)
                
                button.translatesAutoresizingMaskIntoConstraints = false
                button.heightAnchor.constraint(equalToConstant: 180).isActive = true
                button.widthAnchor.constraint(equalToConstant: 150).isActive = true
                
                
                 let delButton = UIButton()
                delButton.tag = value
                value += 1
                delButton.setTitle("Delete", for: UIControl.State.normal)
                delButton.addTarget(self, action: #selector(deleteContacts(sender:)), for: UIControl.Event.touchUpInside)
                deleteButtons.append(delButton)
                delButton.tintColor = .magenta
                delButton.translatesAutoresizingMaskIntoConstraints = false
                delButton.heightAnchor.constraint(equalToConstant: 180).isActive = true
                delButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
                
                
                
                
                let stackView = UIStackView(arrangedSubviews: [button])
                stackView.alignment = .leading
                
                let stackView2 = UIStackView(arrangedSubviews: [delButton])
                
                let stackView3 = UIStackView(arrangedSubviews: [stackView, stackView2])
                stackView3.spacing = 50
                  contactStackView.addArrangedSubview(stackView3)
                allStackView.append(stackView3)
            }
        }
        catch {
            print("Unable to Fetch Data")
        }
    }
    
    @objc func deleteContacts(sender:UIButton) {
        
        
        print(sender.tag)
        
        allButtons[sender.tag].removeFromSuperview()
        deleteButtons[sender.tag].removeFromSuperview()
        
        let dataToBeRemoved = data[sender.tag]
        
        print("data:\(dataToBeRemoved)")
        
        do {
            
            try Data.shared.dbConnection.run("DELETE FROM MyContacts WHERE FirstName = '\(dataToBeRemoved)'")
            
        } catch {
            print("Unable to Delete data")
        }
        
        Data.shared.alertControl(message: "Contact Deleted")
        present(Data.shared.alert, animated: true, completion: nil)
        
    }
    
     @objc func navigatesToNextVC(sender:UIButton) {
            
            

    // note: present method disables back button in navigation controller
            
       let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let secondVC = storyboard.instantiateViewController(withIdentifier: "svc") as! SecondViewController

            
            print("name1\(firstName[sender.tag])")
            print("name2\(lastName[sender.tag])")
            print("mobile:\(mobileNo[sender.tag])")
            
                    secondVC.name1 = self.firstName[sender.tag]
                    secondVC.name2 = self.lastName[sender.tag]
                    secondVC.mobile = self.mobileNo[sender.tag]
                    secondVC.update = self.data
                    secondVC.tag = sender.tag

        navigationController?.pushViewController(secondVC, animated: true)
            
            
        }
}

