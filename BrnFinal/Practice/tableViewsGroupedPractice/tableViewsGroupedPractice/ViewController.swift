//
//  ViewController.swift
//  tableViewsGroupedPractice
//
//  Created by Varalakshmi Kacherla on 1/6/20.
//  Copyright © 2020 Varalakshmi Kacherla. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    
    var actorTV:UITableView!
    
    
    var tollywoodActors = ["Mahesh","Vijay","NTR","RamCharan","VarunTej","Raviteja"]
    
    var bollywoodActors = ["Shahid","VarunDhavan","Siddharth","Ranveer","Abhishek","Ranbhir"]
    
    var hollywoodActors = ["Leonardo","TomCruise","JohnnyDepp","Pitbul","Vin Diesel","Jackmen"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        createUI()
        // Do any additional setup after loading the view.
    }


    func createUI(){
       
       actorTV = UITableView(frame: view.frame, style: UITableView.Style.grouped)
       
       actorTV.register(UITableViewCell.self, forCellReuseIdentifier: "aaa")
       
       actorTV.delegate = self
       actorTV.dataSource = self
       
       view.addSubview(actorTV)
}

    func numberOfSections(in tableView: UITableView) -> Int {
           
           return 3
       }
    
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    if(section == 0){
               
               return tollywoodActors.count
           }
    else if(section == 1){
               return bollywoodActors.count
               
           }
    else {
               return hollywoodActors.count
           }
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
            
    //        var cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "aaa")
            
            var cell = tableView.dequeueReusableCell(withIdentifier: "aaa", for: indexPath)

//    cell.textLabel?.text = "\(indexPath.row).\(actorNames[indexPath.row])"
    
    cell.accessoryType = .checkmark
    
    if(indexPath.section == 0){
        cell.textLabel?.text = hollywoodActors[indexPath.row]
    }
    else if(indexPath.section == 1) {
        cell.textLabel?.text = bollywoodActors[indexPath.row]
    }
    else
    {
        cell.textLabel?.text = tollywoodActors[indexPath.row]
    }
    
            
            return cell
}
   
   
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        
        if(section == 0) {
            return "End of Hollywood"
        }
        
        else if(section == 1){
            
            return "End of Bollywood"
        }
        else {
            return "End of Tollywood"
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if(section == 0) {
            
            return "Hollywood"
        }
        else if(section == 1){
            
            return "Bollywood"
        }
        else
        {
            return "Tollywood"
        }
    }
    
    
}
