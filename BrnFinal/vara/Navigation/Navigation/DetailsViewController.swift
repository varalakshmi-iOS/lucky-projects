//
//  DetailsViewController.swift
//  Navigation
//
//  Created by Varalakshmi Kacherla on 12/17/19.
//  Copyright © 2019 Varalakshmi Kacherla. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class DetailsViewController: UIViewController {

    @IBOutlet weak var titlelbl: UILabel!
    @IBOutlet weak var directorNameLbl: UILabel!
    @IBOutlet weak var actorStackView: UIStackView!
    @IBOutlet weak var storyLbl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK:- singleton data adssigning to buttons and labels
               
               titlelbl.text = GettingData.shared.MoviesTitle[GettingData.shared.movieBtnTags]
               
               directorNameLbl.text = GettingData.shared.directorName[GettingData.shared.movieBtnTags]
               
               storyLbl.text = GettingData.shared.moviesStory[GettingData.shared.movieBtnTags]
               
               // MARK:- calling actors func
               
               actorsDeatils()

    }
    

    func actorsDeatils()
        {
            for i in GettingData.shared.actorsNames[GettingData.shared.movieBtnTags]
            {
                let actorsNameLbl =  UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
                
                actorsNameLbl.text = "\(i)"
                
                actorStackView.addArrangedSubview(actorsNameLbl)
            }
            
        }
        
    
}
