//
//  AudioViewController.swift
//  Navigation
//
//  Created by Varalakshmi Kacherla on 12/17/19.
//  Copyright © 2019 Varalakshmi Kacherla. All rights reserved.
//

import UIKit
import AVKit

class AudioViewController: UIViewController {

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var audioView: UIStackView!
    
    var audioBtnArray = [UIButton]()
    var audioPlayer:AVPlayerViewController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK:- assigning movie title
        
        titleLbl.text = GettingData.shared.MoviesTitle[GettingData.shared.movieBtnTags]
        
        // MARK:- calling audio songs func
        
        movieAudioDetails()
        

    }
    

    func movieAudioDetails()
       {
           var number = 1
                                     
           // MARK:- LOOPS FOR INVINDUAL SONGS
                                     
           for x in 0...GettingData.shared.audioSongArray[GettingData.shared.movieBtnTags].count-1
           {
               if (GettingData.shared.audioSongArray.count != 0)
               {
                   let button = UIButton()
                   button.addTarget(self, action: #selector(playAndPause(sender:)), for: UIControl.Event.touchUpInside)
                   button.backgroundColor = .black
                   button.layer.borderColor = CGColor.init(srgbRed: 0.7, green: 0.7, blue: 0.7, alpha: 1)
                   button.layer.cornerRadius = 5
                   button.layer.borderWidth = 1
                   button.translatesAutoresizingMaskIntoConstraints = false
                   button.widthAnchor.constraint(equalToConstant: 300).isActive = true
                   button.tag = x
                   button.setTitle("song\(number)", for: UIControl.State.normal)
                                             
                   number += 1
                                          
                   audioBtnArray.append(button)
                                     
                   audioView.addArrangedSubview(button)
               }
            else
               {
                print("No Songs are Available")
            }
               
           }
           
       }
       
       // MARK:- audio btn event handler
       
       @objc func playAndPause(sender:UIButton)
       {
           audioPlayer = AVPlayerViewController()
           
           GettingData.shared.buttonTapped = sender.tag
           
          let audiod =  GettingData.shared.audioSongArray[GettingData.shared.movieBtnTags!][sender.tag]
           
           let data = AVPlayer(url: URL(string: audiod)!)

           audioPlayer.player = data

           data.play()

           if((data.rate != 0) && (data.error == nil))
           {
               print("Audio Playing",audiod)
           }
           
   //       present(audioPlayer, animated: true, completion:
   //        {
   //
   //            if((self.audioPlayer.player!.rate != 0) && (self.audioPlayer.player?.error == nil))
   //            {
   //                print("Audio Playing",audiod)
   //            }
   //        })
           
       }


}
