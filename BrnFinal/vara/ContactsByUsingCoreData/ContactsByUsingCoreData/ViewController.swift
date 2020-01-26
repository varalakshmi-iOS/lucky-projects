//
//  ViewController.swift
//  ContactsByUsingCoreData
//
//  Created by Varalakshmi Kacherla on 12/30/19.
//  Copyright © 2019 Varalakshmi Kacherla. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    @IBOutlet weak var imageSV: UIStackView!
    @IBOutlet weak var nameSV: UIStackView!
    @IBOutlet weak var editSV: UIStackView!
    @IBOutlet weak var deleteSV: UIStackView!
    
    @IBOutlet weak var stackView: UIStackView!
    
    
    
    
    
    
    var contacts:[UIButton] = [UIButton]()
    var images:[UIImageView] = [UIImageView]()
    var deleteBtn:[UIButton] = [UIButton]()
    var editBtn:[UIButton] = [UIButton]()
    var contactBtn = UIButton()
    
    
    var ad:AppDelegate!
    var moc:NSManagedObjectContext!
    var userDetails:NSEntityDescription!
    var details:String = " "
    
    var firstName:[String] = [String]()
    var lastName:[String] = [String]()
    var mobileNo:[Int] = [Int]()
    var imageData:[Data] = [Data]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    
    override func viewWillAppear(_ animated: Bool) {
        
        for x in contacts {
            x.removeFromSuperview()
        }
        
        for x in images {
            x.removeFromSuperview()
        }
        
        for x in deleteBtn {
            x.removeFromSuperview()
        }
        
        for x in editBtn {
            x.removeFromSuperview()
        }
        
        firstName = [String]()
        lastName = [String]()
        mobileNo = [Int]()
        
        contacts = [UIButton]()
        images = [UIImageView]()
        deleteBtn = [UIButton]()
        editBtn = [UIButton]()
        
        ad = UIApplication.shared.delegate as? AppDelegate
        moc = ad.persistentContainer.viewContext
        
        let fr = NSFetchRequest<NSFetchRequestResult>(entityName: "Contacts")
        
        do {
            let fetchedManagedObjects = try moc.fetch(fr)
            
            for i in 0..<fetchedManagedObjects.count {
                 
                let currentMO:NSManagedObject = fetchedManagedObjects[i] as! NSManagedObject
                
                print("currentMO : \(currentMO)")
                
                firstName.append("\(currentMO.value(forKey: "firstName")!)")
                lastName.append("\(currentMO.value(forKey: "lastName")!)")
                mobileNo.append(Int(currentMO.value(forKey: "mobileNo") as? Int ?? 0))
                
                
                let name1 = "Name:" + "\(currentMO.value(forKey: "firstName")!)"
                
                let name2 = "\(currentMO.value(forKey: "lastName")!)"
                
                let fullName = name1 + " " + name2
                
                let mobileNumber = currentMO.value(forKey: "mobileNo") as? Int16 ?? 0
                
                let serverImage = currentMO.value(forKey: "image") as! Data
                
                imageData.append(serverImage)
                print("imageData: \(imageData)")
                
                details = fullName + "\n" + "mobileNo:" + "\(mobileNumber)"
                
                print(details)
                
                let button = UIButton()
                button.setTitle(details, for: UIControl.State.normal)
                button.titleLabel?.numberOfLines = 0
                contacts.append(button)
                button.tag = i
                
                button.translatesAutoresizingMaskIntoConstraints = false
                button.heightAnchor.constraint(equalToConstant: 80).isActive = true
                button.widthAnchor.constraint(equalToConstant: 180).isActive = true
                
                nameSV.addArrangedSubview(button)
                
                let imageViews = UIImageView()
                imageViews.image = UIImage(data: serverImage)
                images.append(imageViews)
                imageViews.layer.cornerRadius = imageViews.frame.size.width / 2
                imageViews.clipsToBounds = true
                imageViews.layer.masksToBounds = false
                imageViews.tag = i
                imageViews.translatesAutoresizingMaskIntoConstraints = false
                imageViews.heightAnchor.constraint(equalToConstant: 80).isActive = true
                imageViews.widthAnchor.constraint(equalToConstant: 80).isActive = true
                
                imageSV.addArrangedSubview(imageViews)
                
                let deleteButton = UIButton()
                deleteButton.setImage(UIImage(named: "delete"), for: UIControl.State.normal)
                deleteButton.tag = i
                deleteBtn.append(deleteButton)
                deleteButton.addTarget(self, action: #selector(deleteElements(sender:)), for: UIControl.Event.touchUpInside)
                deleteButton.translatesAutoresizingMaskIntoConstraints = false
                deleteButton.heightAnchor.constraint(equalToConstant: 80).isActive = true
                deleteButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
                
                deleteSV.addArrangedSubview(deleteButton)
                
                let editButton = UIButton()
                editButton.setImage(UIImage(named: "edit"), for: UIControl.State.normal)
                editButton.tag = i
                editBtn.append(editButton)
                editButton.addTarget(self, action: #selector(navigatesToNextVC(sender:)), for: UIControl.Event.touchUpInside)
                editButton.translatesAutoresizingMaskIntoConstraints = false
                editButton.heightAnchor.constraint(equalToConstant: 80).isActive = true
                editButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
                editSV.addArrangedSubview(editButton)
                
                
                let allstackView = UIStackView(arrangedSubviews: [imageSV,nameSV,editSV,deleteSV])
                
                allstackView.distribution = .fill
                stackView.addArrangedSubview(allstackView)
                
            }
        }
        catch
        {
            print("Unable to Fetch Data")
        }
    }
    
    
    @objc func deleteElements (sender:UIButton) {
        
        contacts[sender.tag].removeFromSuperview()
        images[sender.tag].removeFromSuperview()
        deleteBtn[sender.tag].removeFromSuperview()
        editBtn[sender.tag].removeFromSuperview()
        
        
        let selectedObj = NSFetchRequest<NSFetchRequestResult>(entityName: "Contacts")
        selectedObj.predicate = NSPredicate(format: "firstName = %@", firstName[sender.tag])
        
        
        do {
            let fetchedManaged = try moc.fetch(selectedObj).first! as! NSManagedObject
            
            moc.delete(fetchedManaged)
            try moc.save()
        }
        catch {
            print("Unable to get selected Data")
        }
        
}
   
    @objc func navigatesToNextVC(sender:UIButton) {
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        
        let secondVC = storyboard?.instantiateViewController(identifier: "svc") as! SecondViewController
        
        print("name1:\(firstName[sender.tag])")
        print("name2:\(lastName[sender.tag])")
        print("mobileNumber:\(mobileNo[sender.tag])")
        
        secondVC.name1 = self.firstName[sender.tag]
        secondVC.name2 = self.lastName[sender.tag]
        secondVC.mobileNumber = "\(self.mobileNo[sender.tag])"
        secondVC.tag = sender.tag
        
        print(imageData[sender.tag])
        
        secondVC.imageFromVC = [self.imageData[sender.tag]]
        
        
        navigationController?.pushViewController(secondVC, animated: true)
        
        
}
    
}


