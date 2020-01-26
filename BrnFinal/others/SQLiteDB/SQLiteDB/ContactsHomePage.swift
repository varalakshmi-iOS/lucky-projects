//
//  ContactsHomePage.swift
//  SQLiteDB
//
//  Created by Ankam Ajay Kumar on 17/12/19.
//  Copyright © 2019 Ankam Ajay Kumar. All rights reserved.
//

import UIKit
import SQLite

class ContactsHomePage: UIViewController {
    
    //MARK:- IBOutlet
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var mainStackView: UIStackView!
    
    //instance creation
    var path:String!
    var db:Connection!
    var allStackView = [UIStackView]()
    var alert:UIAlertController!
    var OKAction:UIAlertAction!
    var cancelAction:UIAlertAction!
    
    //MARK:- IBAction
    @IBAction func createContactActionBtn(_ sender: Any) {
        
        SingletonData.shared.isCreateBtnTab = true
        
        for x in allStackView
        {
            x.removeFromSuperview()
        }
        
        
        allStackView = [UIStackView]()
        
        let addContacts = storyboard?.instantiateViewController(identifier: "AddContactsPage") as! AddContactsPage
        
        self.navigationController?.pushViewController(addContacts, animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask,true).first!
        print(path!)

        do
        {
        db = try Connection("\(path!)/db.sqlite3")
        try db.run("CREATE TABLE IF NOT EXISTS Contacts (ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME varchar, MOBILENO varchar(50), EMAIL NVARCHAR(320)")
        }
        catch
        {
            print("Unable to connect to DB OR Table already exits")
        }
        SingletonData.shared.dbConnection = db
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        fetchData()
    }
    
    //method to fetch data
    func fetchData()
    {
        for x in allStackView
        {
            x.removeFromSuperview()
        }
        
        
        allStackView = [UIStackView]()
        
        SingletonData.shared.nameArray = [String]()
        SingletonData.shared.mobileArray = [String]()
        SingletonData.shared.emailArray = [String]()
        SingletonData.shared.idArray = [Int64]()
        
        do
        {
        let fetchContacts = try SingletonData.shared.dbConnection.run("SELECT * FROM Contacts")
            
        var i = 0
        for row in fetchContacts {
            var nameTxt = String()
            var mobileTxt = String()
            var emailTxt = String()
            var idTxt = Int64()
            
            for (index, name) in fetchContacts.columnNames.enumerated() {
                print ("\(name):\(row[index]!)")
                
                if(name == "NAME")
                {
                    nameTxt = row[index] as! String
                }
                else if(name == "MOBILENO")
                {
                    mobileTxt = row[index] as! String
                }
                else if(name == "EMAIL")
                {
                    emailTxt = row[index] as! String
                }
                else if(name == "ID")
                {
                    idTxt = row[index] as! Int64
                }
                
            }
            
            //user Image
            let imageBtn = UIButton()
            imageBtn.setImage(UIImage(named: "noImage"), for: UIControl.State.normal)
            imageBtn.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            imageBtn.layer.borderWidth = 1
            imageBtn.layer.masksToBounds = false
            imageBtn.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            imageBtn.layer.cornerRadius = imageBtn.frame.height/2
            imageBtn.clipsToBounds = true
            imageBtn.translatesAutoresizingMaskIntoConstraints = false
            imageBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
            imageBtn.widthAnchor.constraint(equalToConstant: 30).isActive = true
            
            //Name Label
            let nameLbl = UILabel()
            nameLbl.text = nameTxt
            nameLbl.font = UIFont(name: "Georgia", size: 20)
            nameLbl.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            nameLbl.textAlignment = .left
            
            //Edit button
            let editBtn = UIButton()
            editBtn.setImage(UIImage(systemName: "square.and.pencil"), for: UIControl.State.normal)
            editBtn.addTarget(self, action: #selector(editData(obj:)), for: UIControl.Event.touchUpInside)
            editBtn.tintColor = #colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1)
            editBtn.layer.borderWidth = 1
            editBtn.layer.masksToBounds = false
            editBtn.layer.borderColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
            editBtn.layer.cornerRadius = imageBtn.frame.height/2
            editBtn.clipsToBounds = true
            editBtn.tag = i
            editBtn.translatesAutoresizingMaskIntoConstraints = false
            editBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
            editBtn.widthAnchor.constraint(equalToConstant: 30).isActive = true
            
            //Delete button
            let deleteBtn = UIButton()
            deleteBtn.setImage(UIImage(systemName: "trash"), for: UIControl.State.normal)
            deleteBtn.addTarget(self, action: #selector(deleteData(obj:)), for: UIControl.Event.touchUpInside)
            deleteBtn.tintColor = #colorLiteral(red: 0.846742928, green: 0.1176741496, blue: 0, alpha: 1)
            deleteBtn.layer.borderWidth = 1
            deleteBtn.layer.masksToBounds = false
            deleteBtn.layer.borderColor = #colorLiteral(red: 0.846742928, green: 0.1176741496, blue: 0, alpha: 1)
            deleteBtn.layer.cornerRadius = imageBtn.frame.height/2
            deleteBtn.clipsToBounds = true
            deleteBtn.tag = i
            deleteBtn.translatesAutoresizingMaskIntoConstraints = false
            deleteBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
            deleteBtn.widthAnchor.constraint(equalToConstant: 30).isActive = true
            
            //Image StackView
            let imageStackView = UIStackView(arrangedSubviews: [imageBtn])
            
            
            //Label StackView
            let labelStackView = UIStackView(arrangedSubviews: [nameLbl])
            labelStackView.axis = .vertical
            labelStackView.distribution = .fillEqually
            
            //edit Stackview
            let editStackView = UIStackView(arrangedSubviews: [editBtn])
            
            //delete stackview
            let deleteStackView = UIStackView(arrangedSubviews: [deleteBtn])
            
            
            //Main StackView
            let subStackView = UIStackView(arrangedSubviews: [imageStackView, labelStackView, editStackView, deleteStackView])
            subStackView.axis = .horizontal
            subStackView.alignment = .fill
            subStackView.distribution = .fill
            subStackView.spacing = 10
            allStackView.append(subStackView)
            
            mainStackView.addArrangedSubview(subStackView)
            
            SingletonData.shared.nameArray.append(nameTxt)
            SingletonData.shared.mobileArray.append(mobileTxt)
            SingletonData.shared.emailArray.append(emailTxt)
            SingletonData.shared.idArray.append(idTxt)
            
            i += 1
            
            }
        }
        catch
        {
            print("Unable to Fetch data")
        }
    }
    
    //method to delete
    @objc func deleteData(obj:UIButton)
    {
        SingletonData.shared.deleteButtonTapped = obj.tag
        
        alert = UIAlertController(title: "Alert", message: "Are you sure you want to delete \(SingletonData.shared.nameArray[SingletonData.shared.deleteButtonTapped]) contact", preferredStyle: UIAlertController.Style.alert)
        cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil)
        OKAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (delete) in
            do
            {
                try self.db.run("DELETE FROM Contacts WHERE ID = \(SingletonData.shared.idArray[SingletonData.shared.deleteButtonTapped])")
                self.fetchData()
                
            }
            catch
            {
                print("Unable to delete data")
            }
        })
        alert.addAction(cancelAction)
        alert.addAction(OKAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    //method to edit
    @objc func editData(obj:UIButton)
    {
        SingletonData.shared.buttonTapped = obj.tag
//        for x in allStackView
//        {
//            x.removeFromSuperview()
//        }
//
//
//        allStackView = [UIStackView]()
//
        SingletonData.shared.isCreateBtnTab = false
        
        print("button:", SingletonData.shared.buttonTapped)
        let addContacts = storyboard?.instantiateViewController(identifier: "AddContactsPage") as! AddContactsPage
        self.navigationController?.pushViewController(addContacts, animated: true)
    }
    
    
}
