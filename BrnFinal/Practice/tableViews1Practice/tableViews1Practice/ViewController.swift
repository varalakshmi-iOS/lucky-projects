//
//  ViewController.swift
//  tableViews1Practice
//
//  Created by Varalakshmi Kacherla on 12/27/19.
//  Copyright © 2019 Varalakshmi Kacherla. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    

    
    var actorsTV:UITableView!
    
    var actorsNames = ["Mahesh","Ram","Shahid","NTR","Bunny","Vijay","Ajith","Surya","Kiara","Shalini","Rashmika","Raashi","VarunTej","RamCharanTej"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        createUI()
        // Do any additional setup after loading the view.
    }
    
     func createUI()
     {
        actorsTV = UITableView(frame: view.frame, style: UITableView.Style.plain)
        
        actorsTV.delegate = self
        actorsTV.dataSource = self
        view.addSubview(actorsTV)
        
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 13
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "aa")
        
        cell.textLabel?.text = "\(indexPath.row).\(actorsNames[indexPath.row])"
        
        cell.imageView?.image = UIImage(named: "doll")
        
        return cell
    }
    
    
}

