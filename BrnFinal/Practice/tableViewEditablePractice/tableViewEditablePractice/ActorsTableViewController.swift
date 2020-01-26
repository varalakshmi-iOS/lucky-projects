//
//  ActorsTableViewController.swift
//  tableViewEditablePractice
//
//  Created by Varalakshmi Kacherla on 1/7/20.
//  Copyright © 2020 Varalakshmi Kacherla. All rights reserved.
//

import UIKit

class ActorsTableViewController: UITableViewController {
    
//    var actorsNames = ["Amithab","Abhishek","Shahid","VArun","Surya","Ajith","Mahesh","Anushka","Shalini","Raashi","Rakul","Rashmika","Kiara","AmirKhan","Sharukh Khan"]
    
    var tollywoodActors = ["Mahesh","Vijay","NTR","RamCharan","VarunTej","Raviteja"]
    
//    var bollywoodActors = ["Shahid","VarunDhavan","Siddharth","Ranveer","Abhishek","Ranbhir"]
//
//    var hollywoodActors = ["Leonardo","TomCruise","JohnnyDepp","Pitbul","Vin Diesel","Jackmen"]
//

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.navigationItem.rightBarButtonItem = self.editButtonItem

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tollywoodActors.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "aaa", for: indexPath)

        // Configure the cell...
        
        cell.textLabel?.text = tollywoodActors[indexPath.row]

        return cell
    }
    

    
    
    
//    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
//        <#code#>
//    }
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .insert {
            
//            tollywoodActors.remove(at: indexPath.row)
//            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
            
            tollywoodActors.insert("Anushka", at: indexPath.row)
            tableView.insertRows(at: [indexPath], with: UITableView.RowAnimation.middle)
            
            
            // Delete the row from the data source
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .delete {
            
//            tollywoodActors.insert("Anushka", at: indexPath.row)
//            tableView.insertRows(at: [indexPath], with: UITableView.RowAnimation.middle)
            
            
            tollywoodActors.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
            
            
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
        
    
    }


    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        
        
        print("User Dragged from row \(fromIndexPath.row) and Dropped at \(to.row)")
        
        
        var stored = tollywoodActors[fromIndexPath.row]
        
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
