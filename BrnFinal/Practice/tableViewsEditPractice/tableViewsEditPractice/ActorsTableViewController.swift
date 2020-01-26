//
//  ActorsTableViewController.swift
//  tableViewsEditPractice
//
//  Created by Varalakshmi Kacherla on 1/7/20.
//  Copyright © 2020 Varalakshmi Kacherla. All rights reserved.
//

import UIKit

class ActorsTableViewController: UITableViewController {
    
    
    @IBOutlet weak var TV: UITableView!
    
    var tollywoodActors = ["Mahesh","Vijay","NTR","RamCharan","VarunTej","Raviteja"]
    
    var bollywoodActors = ["kareena","alia","deepika","anushka","sonakshi","karishma","Varun","Shahid"]

    

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        TV.register(UITableViewCell.self, forCellReuseIdentifier: "aaa")
        self.navigationItem.rightBarButtonItem = self.editButtonItem

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
//        return "Tollywood"
        
        if(section == 0){
            return "Tollywood"
        }else{
            return "Bollywood"
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
//        return 1
        
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
//        return tollywoodActors.count
        
        if(section == 0){
            return tollywoodActors.count
        }else
        {
            return bollywoodActors.count
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "aaa", for: indexPath)


//        cell.textLabel?.text = tollywoodActors[indexPath.row]
        if(indexPath.row == 0){
            cell.textLabel?.text = tollywoodActors[indexPath.row]
        }
        else {
            cell.textLabel?.text = bollywoodActors[indexPath.row]
        }
        return cell
    }
    
/*
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        
        if(indexPath.row % 2 == 0) {
            return true
        }
        else
        {
            return false
        }
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
           if(indexPath.row % 2 == 0)
           {
               return UITableViewCell.EditingStyle.insert
           }else{
               return UITableViewCell.EditingStyle.delete
           }

       }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .insert {
            
        tollywoodActors.insert("Anushka", at: indexPath.row)
        tableView.insertRows(at: [indexPath], with: UITableView.RowAnimation.middle)
        }
             if editingStyle == .delete {
                        
            tollywoodActors.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
                        
                        
           
                        
            
        }    
    }

    
    
    // Override to support rearranging the table view.
    
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        
        print("User Dragged from row \(fromIndexPath.row) and Dropped at \(to.row)")
               
               
        let stored = tollywoodActors[fromIndexPath.row]
        
               
               tollywoodActors.remove(at: fromIndexPath.row)
               tollywoodActors.insert(stored, at: to.row)
               

    }
    

    
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
