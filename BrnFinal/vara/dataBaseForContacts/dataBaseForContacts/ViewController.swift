//
//  ViewController.swift
//  dataBaseForContacts
//
//  Created by Varalakshmi Kacherla on 12/21/19.
//  Copyright © 2019 Varalakshmi Kacherla. All rights reserved.
//

import UIKit
import SQLite

class ViewController: UIViewController {
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var stackView: UIStackView!
    
    
    var name = [String]()
    var email = [String]()
    var mobileNo = [String]()
    
    var path:String!
    var dbConn:Connection!
    var allStackView = [UIStackView]()
    var alert:UIAlertController!
    var action:UIAlertAction!
    var cancelAction:UIAlertAction!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        var path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        
        print(path)
        
        do {
            dbConn = try Connection("\(path)/MyContacts.sqlite3")
            
            try dbConn.run("CREATE TABLE IF NOT EXISTS MyContacts (ID INTEGER PRIMARY KEY AUTOINCREMENT, Name Text, EmailID Text, MobileNo Text)")
            
        }
        catch{
            print("Unable to Connect database")
            
        }
        Data.shared.dbConnection = dbConn
        
        
        // Do any additional setup after loading the view.
    }


    @IBAction func onAddBtnTapped(_ sender: Any) {
        
        Data.shared.createBtn = true
        
        for x in allStackView
        {
            x.removeFromSuperview()
            
            let addContact = storyboard?.instantiateViewController(identifier: "svc") as! SecondViewController
            
            self.navigationController?.pushViewController(addContact, animated: true)
            
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        fetchData()
    }

    func fetchData(){

        for x in allStackView {
            x.removeFromSuperview()
        }

        allStackView = [UIStackView]()
        Data.shared.nameArray = [String]()
        Data.shared.mobileArray = [String]()
        Data.shared.emailArray = [String]()
        Data.shared.idArray = [Int]()

        do {
            let fetchContacts = try Data.shared.dbConnection.run("SELECT * FROM MyContacts")

            var i = 0
            for row in fetchContacts {
                 var nameText = String()
                var mobileText = String()
                var emailText = String()
                var idText = Int()


                for (index,name) in fetchContacts.columnNames.enumerated()
                {
                    print("\(name):\(row[index]!)")

                    if(name == "Name")
                    {
                        nameText = row[index] as! String
                    }

                   else if(name == "EmailID")
                    {
                        mobileText = row[index] as! String
                    }
                   else if(name == "MobileNo")
                    {
                        emailText = row[index] as! String
                    }
//                    else if(name == "ID")
//                    {
//                        idText = row[index] as! Int
//                    }
                }

                let nameLbl = UILabel()
                nameLbl.text = nameText
                nameLbl.font = UIFont(name: "vara", size: 25)
                nameLbl.textColor = .black
                nameLbl.textAlignment = .left
                
                
                
                let deleteButton = UIButton()
                deleteButton.setTitle("Delete", for: UIControl.State.normal)
                deleteButton.addTarget(self, action: #selector(deleteData(obj:)), for: UIControl.Event.touchUpInside)
                deleteButton.tintColor = .magenta
                deleteButton.translatesAutoresizingMaskIntoConstraints = false
                deleteButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
                deleteButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
                
                
                let editButton = UIButton()
                editButton.setTitle("Edit", for: UIControl.State.normal)
                editButton.addTarget(self, action: #selector(editData(obj:)), for: UIControl.Event.touchUpInside)
                editButton.translatesAutoresizingMaskIntoConstraints = false
                editButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
                editButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
                
                
                let labelStackView = UIStackView(arrangedSubviews: [nameLbl])
                labelStackView.axis = .vertical
                labelStackView.distribution = .fillEqually
                
                let deleteStackView = UIStackView(arrangedSubviews: [deleteButton])
                
                
                let subStackView = UIStackView(arrangedSubviews: [labelStackView,deleteStackView])
                subStackView.alignment = .fill
                subStackView.axis = .horizontal
                subStackView.distribution = .fill
                subStackView.spacing = 20
                allStackView.append(subStackView)
                
                
                stackView.addArrangedSubview(subStackView)
                
                Data.shared.nameArray.append(nameText)
                Data.shared.mobileArray.append(mobileText)
                Data.shared.emailArray.append(emailText)
                Data.shared.idArray.append(idText)
                
                i += 1
            }
        }
            catch {
                print("Unable to fetch Data")
                
            }
    }
    
    @objc func deleteData(obj:UIButton) {
        Data.shared.deleteBtn = obj.tag
        
        alert = UIAlertController(title: "Alert", message: "Are yo want to Delete \(Data.shared.nameArray[Data.shared.deleteBtn]) Contact", preferredStyle: UIAlertController.Style.alert)
        cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil)
        action = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (delete) in
            do {
                try self.dbConn.run("DELETE FROM MyContacts WHERE ID = \(Data.shared.idArray[Data.shared.deleteBtn])")
                
                self.fetchData()
            }
            catch {
                print("Unable to Delete data")
            }
        })
        alert.addAction(cancelAction)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    
    @objc func editData(obj:UIButton) {
        Data.shared.button = obj.tag
         for x in allStackView
         {
            x.removeFromSuperview()
        }
        allStackView = [UIStackView]()
        Data.shared.createBtn = false
        print("button:", Data.shared.button)
        
        let addContacts = storyboard?.instantiateViewController(identifier: "svc") as! SecondViewController
        self.navigationController?.popViewController(animated: true)
        
    }
                
}



