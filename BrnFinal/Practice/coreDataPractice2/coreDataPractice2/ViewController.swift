//
//  ViewController.swift
//  coreDataPractice2
//
//  Created by Varalakshmi Kacherla on 12/20/19.
//  Copyright © 2019 Varalakshmi Kacherla. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var ageTF: UITextField!
    @IBOutlet weak var woodTF: UITextField!
    
    var ad:AppDelegate!
    
    var moc:NSManagedObjectContext!
    
    var actorEntity:NSEntityDescription!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ad = UIApplication.shared.delegate as! AppDelegate
        
        moc = ad.persistentContainer.viewContext
        
//        print("MOC : \(moc!)")
        
        
        actorEntity = NSEntityDescription.entity(forEntityName: "Actors", in: moc)
    
//     print("actorEntity : \(actorEntity!)")
    }


    @IBAction func saveBtnTap(_ sender: Any)
    {
        
        let actorMO = NSManagedObject(entity: actorEntity, insertInto: moc)
        print(actorMO)
        
        actorMO.setValue(nameTF.text!, forKey: "name")
        
        let age = Int(ageTF.text!)
        
        actorMO.setValue(age, forKey: "age")
        
        actorMO.setValue(woodTF.text!, forKey: "wood")
        
        
        do {
            try moc.save()
            print("Successfully Saved")
        }catch {
            print("Unable to Save")
        }
        
        
        
    }
    
    
    @IBAction func fetchBtnTap(_ sender: Any) {
        
        
        var fr = NSFetchRequest<NSFetchRequestResult>(entityName: "Actor")
        
        do {
            var fetchedManagedObjects =  try moc.fetch(fr)
        }catch {
            
            
            
            
            print("Unable to Fetch")
        }
        
    }
    
    
}

