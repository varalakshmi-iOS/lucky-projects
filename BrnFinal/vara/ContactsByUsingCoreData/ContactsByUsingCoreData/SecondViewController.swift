//
//  SecondViewController.swift
//  ContactsByUsingCoreData
//
//  Created by Varalakshmi Kacherla on 12/30/19.
//  Copyright © 2019 Varalakshmi Kacherla. All rights reserved.
//

import UIKit
import CoreData

class SecondViewController: UIViewController ,UINavigationControllerDelegate,UIImagePickerControllerDelegate{

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var firstNameTF: UITextField!
    
    @IBOutlet weak var lastNameTF: UITextField!
    
    @IBOutlet weak var mobileNoTF: UITextField!
    
    @IBOutlet weak var imageSelector: UIButton!
    
    var name1:String = " "
    var name2:String = " "
    var mobileNumber = " "
    var tag:Int!
    var imageFromVC = [Data]()
    
    var ad:AppDelegate!
    var moc:NSManagedObjectContext!
    var contacts:NSEntityDescription!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ad = UIApplication.shared.delegate as! AppDelegate
        moc = ad.persistentContainer.viewContext
        
        contacts = NSEntityDescription.entity(forEntityName: "Contacts", in: moc)
        
        
        let image = UIImage(named: "image")
//        imageView.layer.borderColor = (1.0 as! CGColor)
        imageView.layer.masksToBounds = false
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.cornerRadius = imageView.frame.size.width / 2
        imageView.clipsToBounds = true
        imageView.image = image
        
        let pngs = imageView.image?.pngData()
        
        firstNameTF.text = name1
        lastNameTF.text = name2
        mobileNoTF.text = mobileNumber
        let serverImage = imageFromVC.first
//        imageView.image = UIImage(data: serverImage ?? pngs!)
        
        imageSelector.layer.cornerRadius = imageSelector.frame.size.width / 2
        imageSelector.clipsToBounds = true
        imageSelector.addTarget(self, action: #selector(selectImageFromGallery), for: UIControl.Event.touchUpInside)
    }
    
        

        // Do any additional setup after loading the view.
    
    

    @IBAction func onSaveBtnTap(_ sender: Any) {
        
        let contactsMO = NSManagedObject(entity: contacts, insertInto: moc)
        contactsMO.setValue(firstNameTF.text!, forKey: "firstName")
        contactsMO.setValue(lastNameTF.text!, forKey: "lastName")
        
        let png = self.imageView.image?.pngData()
        print(png!)
        
        contactsMO.setValue(png!, forKey: "image")
        
        let mobileNumber = Int(mobileNoTF.text!)
        
        contactsMO.setValue(mobileNumber, forKey: "mobileNo")
        
        
        do  {
            try moc.save()
            print("Saved Successfully")
        }
        
        catch {
            print("Unable to Save Data")
        }
        
    }
    

    @IBAction func onUpdateBtnTap(_ sender: Any) {
        
        let selectedObj = NSFetchRequest<NSFetchRequestResult>(entityName: "Contacts")
        
        selectedObj.predicate = NSPredicate(format: "firstName = %@", name1)
        
        do {
            let fetchedManaged = try moc.fetch(selectedObj).first! as! NSManagedObject
            
            fetchedManaged.setValue(firstNameTF.text!, forKey: "firstName")
            fetchedManaged.setValue(lastNameTF.text!, forKey: "lastName")
            
            let png = self.imageView.image?.pngData()
            print(png!)
            
            fetchedManaged.setValue(png!, forKey: "image")
            
            let mobileNumber = Int(mobileNoTF.text!)
            fetchedManaged.setValue(mobileNumber, forKey: "mobileNo")
            
            
            try moc.save()
        }
        catch {
            print("Unable to Get Selected data")
        }
        
    
        
        
    }
    
    @objc func selectImageFromGallery() {
        
        let imageController = UIImagePickerController()
        imageController.delegate = self
        imageController.sourceType = .photoLibrary
        imageController.allowsEditing = true
        present(imageController, animated: true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let pickedImage = info[UIImagePickerController.InfoKey.editedImage] as! UIImage? {
            
            imageView.image = pickedImage
        }
        dismiss(animated: true, completion: nil)
    }
    
}
