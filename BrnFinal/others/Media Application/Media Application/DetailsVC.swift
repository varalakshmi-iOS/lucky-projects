//
//  DetailsVC.swift
//  Media Application
//
//  Created by Vadde Narendra on 12/14/19.
//  Copyright © 2019 Vadde Narendra. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class DetailsVC: UIViewController
{

    @IBOutlet weak var movieTitleLbl: UILabel!
    @IBOutlet weak var directorNameLbl: UILabel!
    @IBOutlet weak var actorsDetailsSV: UIStackView!
    @IBOutlet weak var storyLbl: UILabel!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // MARK:- singleton data adssigning to buttons and labels
        
        movieTitleLbl.text = GettingMoviesData.shared.MoviesTitle[GettingMoviesData.shared.movieBtnTags]
        
        directorNameLbl.text = GettingMoviesData.shared.directorName[GettingMoviesData.shared.movieBtnTags]
        
        storyLbl.text = GettingMoviesData.shared.moviesStory[GettingMoviesData.shared.movieBtnTags]
        
        // MARK:- calling actors func
        
        actorsDeatils()
    }
    
    // MARK:- creating func about actors details
    
    func actorsDeatils()
    {
        for i in GettingMoviesData.shared.actorsNames[GettingMoviesData.shared.movieBtnTags]
        {
            let actorsNameLbl =  UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
            
            actorsNameLbl.text = "\(i)"
            
            actorsDetailsSV.addArrangedSubview(actorsNameLbl)
        }
        
    }
    
}
