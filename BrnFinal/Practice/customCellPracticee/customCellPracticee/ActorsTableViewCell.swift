//
//  ActorsTableViewCell.swift
//  customCellPracticee
//
//  Created by Varalakshmi Kacherla on 1/7/20.
//  Copyright © 2020 Varalakshmi Kacherla. All rights reserved.
//

import UIKit

class ActorsTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLbl: UILabel!
    
    @IBOutlet weak var actorsImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    @IBAction func likeBtn(_ sender: Any) {
    }
    
    @IBAction func commentBtn(_ sender: Any) {
    }
    
    @IBAction func shareBtn(_ sender: Any) {
    }
    
    
}
