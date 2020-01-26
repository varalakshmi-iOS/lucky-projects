//
//  MovieDetailsViewController.swift
//  serverDataByJsonDecoder
//
//  Created by Varalakshmi Kacherla on 12/12/19.
//  Copyright © 2019 Varalakshmi Kacherla. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class MovieDetailsViewController: UIViewController {
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var movieTitleLbl: UILabel!
    
    @IBOutlet weak var directorNameLbl: UILabel!
    @IBOutlet weak var actorsStackView: UIStackView!
    
    @IBOutlet weak var storyLbl: UILabel!
    
    @IBOutlet weak var trailerView: UIView!
    
    @IBOutlet weak var audioView: UIStackView!
    
    var avPlayer:AVPlayerViewController!
       var audioBtnArray = [UIButton]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        imageView.image = GettingData.shared.moviePosterImage[GettingData.shared.movieBtnTags]
               movieTitleLbl.text = GettingData.shared.moviesTitle[GettingData.shared.movieBtnTags]
               directorNameLbl.text = GettingData.shared.directorName[GettingData.shared.movieBtnTags]
               storyLbl.text = GettingData.shared.moviesStory[GettingData.shared.movieBtnTags]
               
               movieAudioDetails()
               movieVideoDetails()
               actorDetails()

    }
    
    // function for Trailer
    
    func movieVideoDetails(){
        
        
        avPlayer = AVPlayerViewController()
        avPlayer = GettingData.shared.movieTrailer[GettingData.shared.movieBtnTags]
        avPlayer.view.frame = CGRect(x: 0, y: 0, width: trailerView.frame.width, height: trailerView.frame.height)
        trailerView.addSubview(avPlayer.view)
            
        }
    // function for ActorDetails
    
    func actorDetails() {
        
        for i in GettingData.shared.actorsNames[GettingData.shared.movieBtnTags]
        {
            let actorNameLbl = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
            
            actorNameLbl.text = "\(i)"
            actorsStackView.addArrangedSubview(actorNameLbl)
        
        }
    }
    
    // function for Audio
    
    func movieAudioDetails() {
        var number = 1
        if (GettingData.shared.audioSongArray[GettingData.shared.movieBtnTags].count == 0)
        {
            print("No Songs available")
        }
        else
        {
            for x in 0...GettingData.shared.audioSongArray[GettingData.shared.movieBtnTags].count-1
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
                audioView.addArrangedSubview(button)
            }
        }
        
    }
    
    
    @IBAction func onBackBtnTapped(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
    }
    
     let audioPlayer = AVPlayerViewController()
        
        @objc func playAndPause(sender:UIButton)
        {

            GettingData.shared.buttonTapped = sender.tag
            
            let audio = GettingData.shared.audioSongArray[GettingData.shared.movieBtnTags!][sender.tag]
            
            let data = AVPlayer(url: URL(string: audio)!)
            
            audioPlayer.player = data
            
    //        data.play()
    //
    //        if((data.rate != 0) && (data.error == nil)) {
    //            print("========audioPlaying========")
    //        }
    //
            present(audioPlayer, animated: true) {
                if((self.audioPlayer.player!.rate != 0) && (self.audioPlayer.player?.error == nil)) {
                    print("Audio Playing")
                    
                }
            }
        }
        
    
    
}
