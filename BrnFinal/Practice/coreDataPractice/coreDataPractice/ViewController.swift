//
//  ViewController.swift
//  coreDataPractice
//
//  Created by Varalakshmi Kacherla on 12/20/19.
//  Copyright © 2019 Varalakshmi Kacherla. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var scoreLbl: UILabel!
    
    var score = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        getData()
        scoreLbl.text = "\(score)"                                                                                                                                                                                                                     
    }


    @IBAction func onincreseBtnTap(_ sender: Any) {
        
        score += 1
        scoreLbl.text = "\(score)"
        
        
    }
    
    @IBAction func saveDataBtn(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

        let entity = NSEntityDescription.entity(forEntityName: "Entity", in: context)

        let newEntity = NSManagedObject(entity: entity!, insertInto: context)


        newEntity.setValue(score, forKey: "number")

        do {
            try context.save()
            print("saved")
        }
        catch {
            print("Failed Saving")
        }

    }
    
    func getData() {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Entity")
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            
            for data in result as! [NSManagedObject]
            {
                score = data.value(forKey: "number") as! Int
            }
        }
            catch {
                print("Failed")
            }
        }
    }
    


