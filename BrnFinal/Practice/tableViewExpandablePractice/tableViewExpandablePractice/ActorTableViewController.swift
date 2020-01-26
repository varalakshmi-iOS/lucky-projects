//
//  ActorTableViewController.swift
//  tableViewExpandablePractice
//
//  Created by Varalakshmi Kacherla on 1/8/20.
//  Copyright © 2020 Varalakshmi Kacherla. All rights reserved.
//

import UIKit

class ActorTableViewController: UITableViewController {
    
    var hollywoodActors = ["Arnald","tom","cruise","ema watson","amy","nick jonas"]
    var bollywoodActors = ["srk","salman","shahid","amir","devagan","varun","sooraj","siddarth"]
    var tollywoodActors = ["nani","tarun","naga chaitanya","akhil","varun","dharam tej"]
    
    var actorArray = [Actors]()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
        let hollywoodActorsObj = Actors(NamesArray: hollywoodActors, isExpandable: true)
        
        var bollywoodActorsObj = Actors(NamesArray: bollywoodActors, isExpandable: true)
        
        var tollywoodActorsObj = Actors(NamesArray: tollywoodActors, isExpandable: true)
        
        actorArray = [hollywoodActorsObj,bollywoodActorsObj,tollywoodActorsObj]
        
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return actorArray.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        if(actorArray[section].isExpandable == false) {
        
        return 0
        }
        else {
            
            return actorArray[section].NamesArray!.count
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "aaa", for: indexPath)

        // Configure the cell...
        
        cell.textLabel?.text = actorArray[indexPath.section].NamesArray![indexPath.row]
        

        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        var expandButton = UIButton(type: UIButton.ButtonType.system)
        expandButton.setTitle("Collapse", for: UIControl.State.normal)
        
        expandButton.addTarget(self, action: #selector(onExpandBtn(tappedBtn:)), for: UIControl.Event.touchUpInside)
        
        expandButton.tag = section
        
        return expandButton
    }

    
    @objc func onExpandBtn(tappedBtn:UIButton) {
        
        var sectionRowsArray = [IndexPath]()
        
        for i in 0..<actorArray[tappedBtn.tag].NamesArray!.count {
            
            var ip = IndexPath(row:
                i, section: tappedBtn.tag)
            
            sectionRowsArray.append(ip)
        }
        
        if(actorArray[tappedBtn.tag].isExpandable == true)
        {
            print("Delete Cells")
            
            actorArray[tappedBtn.tag].isExpandable = false
            tableView.deleteRows(at: sectionRowsArray, with: UITableView.RowAnimation.automatic)
            tappedBtn.setTitle(("Expand"), for: UIControl.State.normal)
        }
        else {
            print("Insert Cells")
            actorArray[tappedBtn.tag].isExpandable = true
            tableView.insertRows(at: sectionRowsArray, with: UITableView.RowAnimation.automatic)
            tappedBtn.setTitle("Collapse", for: UIControl.State.normal)
        }
        
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
