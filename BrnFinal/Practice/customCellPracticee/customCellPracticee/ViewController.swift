//
//  ViewController.swift
//  customCellPracticee
//
//  Created by Varalakshmi Kacherla on 1/7/20.
//  Copyright © 2020 Varalakshmi Kacherla. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var actorsTV:UITableView!
         
      var actorsNames = ["Amithab","Abhishek","Shahid","VArun","Surya","Ajith","Mahesh","Anushka","Shalini","Raashi","Rakul","Rashmika","Kiara","AmirKhan","Sharukh Khan"]
    

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        createUI()
        
        // Do any additional setup after loading the view.
    }


    
    func createUI(){

               actorsTV = UITableView(frame: view.frame, style: UITableView.Style.plain)


    //           actorsTV.register(UITableViewCell.self, forCellReuseIdentifier: "aaa")

               actorsTV.delegate = self
               actorsTV.dataSource = self

            let actorXIB = UINib(nibName: "ActorsTableViewCell", bundle: nil)

            actorsTV.register(actorXIB, forCellReuseIdentifier: "aaa")


               view.addSubview(actorsTV)
           }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            
            return actorsNames.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "aaa", for: indexPath) as! ActorsTableViewCell
            
            cell.nameLbl.text = actorsNames[indexPath.row]
            
        return cell
        
        }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            
            return 400
        }

    }



