//
//  MoviesDetails.swift
//  Page Controller With Server Data
//
//  Created by Vadde Narendra on 12/11/19.
//  Copyright © 2019 Vadde Narendra. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class MoviesDetails: UIViewController
{

    // MARK:- Variables
    
    @IBOutlet weak var posterImageView: UIImageView!
    
    @IBOutlet weak var movieTitleLbl: UILabel!
    
    @IBOutlet weak var directorNameLbl: UILabel!
    
    @IBOutlet weak var actorsStackView: UIStackView!
    
    @IBOutlet weak var storyLbl: UILabel!
    
    @IBOutlet weak var trailerView: UIView!
    
    @IBOutlet weak var audioStackView: UIStackView!
    
    var avPlayer:AVPlayerViewController!
    var audioBtnArray = [UIButton]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // MARK:- singleton data adssigning to buttons and labels
        
        posterImageView.image = GettingMoviesData.shared.moviePosterImage[GettingMoviesData.shared.movieBtnTags]
        movieTitleLbl.text = GettingMoviesData.shared.MoviesTitle[GettingMoviesData.shared.movieBtnTags]
        directorNameLbl.text = GettingMoviesData.shared.directorName[GettingMoviesData.shared.movieBtnTags]
        storyLbl.text = GettingMoviesData.shared.moviesStory[GettingMoviesData.shared.movieBtnTags]
        
        // MARK:- calling functions
        
        actorsDeatils()
        
        movieVideosDeatils()

        movieAudioDetails()
       
    }
    
    // MARK:- creating func about actors details
    
    func actorsDeatils()
    {
        for i in GettingMoviesData.shared.actorsNames[GettingMoviesData.shared.movieBtnTags]
        {
            let actorsNameLbl =  UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
            actorsNameLbl.text = "\(i)"
            actorsStackView.addArrangedSubview(actorsNameLbl)
        }
    }
    
    // MARK:- creating func about trailers details
    
    func movieVideosDeatils()
    {
        avPlayer = AVPlayerViewController()
        avPlayer = GettingMoviesData.shared.movieTrailer[GettingMoviesData.shared.movieBtnTags]
        avPlayer.view.frame = CGRect(x: 0 , y: 0, width: trailerView.frame.width, height: trailerView.frame.height)
        trailerView.addSubview(avPlayer.view)
    }
    
    // MARK:- creating func about audio details
    
    func movieAudioDetails()
    {
        var number = 1
                           
        // MARK:- LOOPS FOR INVINDUAL SONGS
                           
        for x in 0...GettingMoviesData.shared.audioSongArray[GettingMoviesData.shared.movieBtnTags].count-1
        {
            let button = UIButton()
            button.addTarget(self, action: #selector(playAndPause(sender:)), for: UIControl.Event.touchUpInside)
            button.backgroundColor = .black
            button.translatesAutoresizingMaskIntoConstraints = false
            button.widthAnchor.constraint(equalToConstant: 300).isActive = true
            button.tag = x
            button.setTitle("song\(number)", for: UIControl.State.normal)
                               
            number += 1
                            
            audioBtnArray.append(button)
                       
            audioStackView.addArrangedSubview(button)
            
        }
        
    }
    
    // MARK:- audio btn event handler
    
    let audioPlayer = AVPlayerViewController()
    
    @objc func playAndPause(sender:UIButton)
    {
        GettingMoviesData.shared.buttonTapped = sender.tag
        
       let audiod =  GettingMoviesData.shared.audioSongArray[GettingMoviesData.shared.movieBtnTags!][sender.tag]
        
        let data = AVPlayer(url: URL(string: audiod)!)

        audioPlayer.player = data
        
        //data.play()
        
        //if((data.rate != 0) && (data.error == nil))
        //{
        //    print("Audio Playing",audiod)
        //}
        
       present(audioPlayer, animated: true, completion: {

            if((self.audioPlayer.player!.rate != 0) && (self.audioPlayer.player?.error == nil))
            {
                print("Audio Playing",audiod)
            }
        })
                 
    }
    
    // MARK:- back button func
    
    @IBAction func backBtnTapped(_ sender: UIButton)
    {
        dismiss(animated: true, completion: nil)
    }
    
    
    
}
