//
//  ActorsTableViewController.swift
//  tableViewsSearchablePractice
//
//  Created by Varalakshmi Kacherla on 1/8/20.
//  Copyright © 2020 Varalakshmi Kacherla. All rights reserved.
//

import UIKit

class ActorsTableViewController: UITableViewController,UISearchResultsUpdating {
    
     
    @IBOutlet var TV: UITableView!
    
    var actors = ["Amitab Bachchan","Deepika Padukone","Ranveer Singh","Ranbir Kapoor","Anil Kapoor","Shahid Kapoor","Amir Khan","Salman Khan","Sharukh Khan","Kareen Kapoor","Irfan Khan","Saif Ali Khan","Karishma Kapoor"]
    
    var searchControl:UISearchController!
    var filteredArray = [String]()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        TV.register(UITableViewCell.self, forCellReuseIdentifier: "aaa")
        
        searchControl = UISearchController(searchResultsController: nil)
        
        searchControl.searchResultsUpdater = self
        
        tableView.tableHeaderView = searchControl.searchBar
        

        searchControl.searchBar.placeholder = "Search Actors Here"
        searchControl.searchBar.showsCancelButton = true
//        searchControl.searchBar.scopeButtonTitles = ["Khan","Kapoor","Singh"]
//        searchControl.searchBar.showsScopeBar = true
        
        
    }

    // MARK: - Table view data source
    
    
    func updateSearchResults(for searchController: UISearchController) {
        
        print("Searching For \(searchController.searchBar.text!)")
        
        var Predicate = NSPredicate(format: "self Contains[c] %@ ", searchController.searchBar.text!)
        filteredArray = (actors as! NSArray).filtered(using: Predicate) as! [String]
        print(filteredArray)
        
        tableView.reloadData()
        
    }
    

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        if(searchControl.isActive == true) {
            return filteredArray.count
        }else {
            return actors.count
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "aaa", for: indexPath)

        // Configure the cell...
        if(searchControl.isActive == true) {
          
            cell.textLabel?.text = filteredArray[indexPath.row]
        }
        else {
            cell.textLabel?.text = actors[indexPath.row]
        }

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
