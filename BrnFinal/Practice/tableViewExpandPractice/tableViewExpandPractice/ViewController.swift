//
//  ViewController.swift
//  tableViewExpandPractice
//
//  Created by Varalakshmi Kacherla on 1/8/20.
//  Copyright © 2020 Varalakshmi Kacherla. All rights reserved.
//

import UIKit


struct cellData {
    
    var opened = Bool()
    var title = String()
    var sectionData = [String]()
    
}

class TableViewController: UITableViewController {
    
var tableViewData = [cellData]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
tableViewData = [cellData(opened: false, title: "title1", sectionData: ["cell1","cell2","cell3"]),
                  cellData(opened: false, title: "title2", sectionData: ["cell1","cell2","cell3"]),
                  cellData(opened: false, title: "title3", sectionData: ["cell1","cell2","cell3"]),
                  cellData(opened: false, title: "title4", sectionData: ["cell1","cell2","cell3"])]
        
        // Do any additional setup after loading the view.
    }

    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewData.count
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if(tableViewData[section].opened == true){
            
            return tableViewData[section].sectionData.count
        }else {
           
            return 1
        }
        }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if(indexPath.row == 0) {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else {
                return UITableViewCell()
            }
            return cell
        }else {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else {
            return UITableViewCell()
            }
             
            cell.textLabel?.text = tableViewData[indexPath.section].sectionData[indexPath.row]
            return cell
        }
        }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if(tableViewData[indexPath.section].opened == true) {
            tableViewData[indexPath.section].opened = false
            let sections = IndexSet.init(integer: indexPath.section)
            tableView.reloadSections(sections, with: .none)
        }
        else {
            tableViewData[indexPath.section].opened = true
        }
    }
    }


