//
//  ViewController.swift
//  serverDataByJsonDecoder
//
//  Created by Varalakshmi Kacherla on 12/12/19.
//  Copyright © 2019 Varalakshmi Kacherla. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var stackView: UIStackView!
    
    
       //Variable Decalration
       
       var userData:[[String:Any]]!
       var buttonsArray:[UIButton] = []
       var labelsArray:[UILabel] = []
       var audioURLs:[[String]] = [[]]

       
    
    

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func onBtnTap(_ sender: Any) {
        
        creatingComponents()
        
    }
    

     // function for  component Creation
        
        func creatingComponents()
        {
         
            
            var j = 0
            
            let moviesData = GettingData.shared.gettingDetails()
            
            
//            for (x,y) in zip(buttonsArray, labelsArray)
//            {
//                x.removeFromSuperview()
//                y.removeFromSuperview()
//            }
            
            
//            buttonsArray = [UIButton]()
//            labelsArray = [UILabel]()
            
            GettingData.shared.movieBtnTags = 0
            GettingData.shared.moviesStory = [String]()
            GettingData.shared.moviesTitle = [String]()
            GettingData.shared.actorsNames = [[String]]()
            GettingData.shared.directorName = [String]()
            GettingData.shared.moviePosterImage = [UIImage]()
                
               
            for i in moviesData
            {
                var posterData = i.posters![0]
                let url = posterData.replacingOccurrences(of: " ", with: "%20")
                let urlNew = URL(string: "https://www.brninfotech.com/tws/\(url)")
                let posterDataTask = URLSession.shared.dataTask(with: urlNew!)
                { (posterData, connDetails, error) in
                    
                DispatchQueue.main.async {
                   
                    let posterButton = UIButton()
//                    self.buttonsArray.append(posterButton)
                
                // Button Creation
                    
                    posterButton.backgroundColor = .red
                    posterButton.setImage(UIImage(data: posterData!), for: UIControl.State.normal)
                    posterButton.translatesAutoresizingMaskIntoConstraints = false
                    posterButton.heightAnchor.constraint(equalToConstant: 300).isActive = true
                    posterButton.widthAnchor.constraint(equalToConstant: 300).isActive = true
                    self.stackView.addArrangedSubview(posterButton)
                    posterButton.imageView?.contentMode = .scaleAspectFit
                    posterButton.addTarget(self, action: #selector(self.movieDetails(_:)), for: UIControl.Event.touchUpInside)
                    posterButton.tag = j
                        j += 1
                
                // Label Creation
                    
                    let movieTitle = i.title
                    let titleLabel = UILabel()
                    titleLabel.text = movieTitle
                    titleLabel.font = UIFont.boldSystemFont(ofSize: 25)
                    titleLabel.textAlignment = .center
                    titleLabel.textColor = UIColor.black
//                    self.labelsArray.append(titleLabel)
                    self.stackView.addArrangedSubview(titleLabel)
                    
                    
                    
                    GettingData.shared.moviePosterImage.append(UIImage(data: posterData!)!)
                
                    GettingData.shared.directorName.append(i.director!)
                    
                    GettingData.shared.moviesTitle.append(i.title!)
                    
                    GettingData.shared.moviesStory.append(i.story ?? "Story is not available")
                    
                    
                    
                    let actorsName = i.actors
                    GettingData.shared.actorsNames.append(actorsName!)
                    
                    let video = i.trailers![0]
                    let videoURL = video.replacingOccurrences(of: " ", with: "%20")
                    let videoAVPlayer = AVPlayerViewController()
                    videoAVPlayer.player = AVPlayer(url: URL(string: "https://www.brninfotech.com/tws/\(videoURL)")!)
                    GettingData.shared.movieTrailer.append(videoAVPlayer)
                    
                    let arraySong:[String] = i.songs!
                    
                    let convString = arraySong.joined(separator: "")
                    
                    let string:String = "https://www.brninfotech.com/tws/ "
                    let addString = string.replacingOccurrences(of: " ", with: convString,options: .literal,range: nil)
                    
                    let finalStringSong = addString.replacingOccurrences(of: " ", with: "%20",options: .literal,range: nil)
                    
                    var allSongsUrlInString = [String]()
                    
                    let stringSong:String = "httpa://www.brninfotech.com/tws/"
                    
                    for n in arraySong
                    {
                        let urlData = n.replacingOccurrences(of: " ", with: "%20")
                        
                        allSongsUrlInString.append(stringSong + urlData)
                    }
                    GettingData.shared.audioSongArray.append(allSongsUrlInString)
                
        }
        
            
        }
        
                posterDataTask.resume()
        
    }
        
    }
        @objc func movieDetails(_ sender: UIButton){
            
            GettingData.shared.movieBtnTags = sender.tag
            
            let movieDetailsVC = storyboard?.instantiateViewController(identifier: "secondVC") as! MovieDetailsViewController
            
            present(movieDetailsVC, animated: true, completion: nil)
            
        }

        

    }



