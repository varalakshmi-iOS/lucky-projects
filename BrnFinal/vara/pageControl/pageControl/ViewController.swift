//
//  ViewController.swift
//  pageControl
//
//  Created by Varalakshmi Kacherla on 12/12/19.
//  Copyright © 2019 Varalakshmi Kacherla. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation


class ViewController: UIViewController,UIScrollViewDelegate {
    
    

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var buttonsArray = [UIButton]()
    var movieTitlesArray = [String]()
    var movieStoriesArray = [String]()
    var directorNamesArray = [String]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        scrollView.delegate = self
        
    }

    
    
    @IBAction func onBtnTap(_ sender: UIButton) {
        
        creatingComponents()
        
//        Timer.scheduledTimer(timeInterval: 10, target: self, selector: #selector(timeEventHandler), userInfo: nil, repeats: true)
        
        
        
    }
    
    // function for  component Creation
    func creatingComponents()
           {
             
            pageControl.addTarget(self, action: #selector(pageControlEventHandler), for: UIControl.Event.valueChanged)
               var j = 0
               
               let moviesData = GettingData.shared.gettingDetails()
            
            movieStoriesArray.removeAll()
            movieTitlesArray.removeAll()
            directorNamesArray.removeAll()
            
            for x in buttonsArray
            {
                x.removeFromSuperview()
            }
               
            buttonsArray = [UIButton]()
            movieStoriesArray = [String]()
            movieTitlesArray = [String]()
            directorNamesArray = [String]()
            
            
            
                GettingData.shared.movieBtnTags = 0
                GettingData.shared.moviesStory = [String]()
                GettingData.shared.moviesTitle = [String]()
                GettingData.shared.actorsNames = [[String]]()
                GettingData.shared.directorName = [String]()
                GettingData.shared.moviePosterImage = [UIImage]()
            
                pageControl.numberOfPages = moviesData.count
            
                    
          var x = 0
        for i in moviesData
                {
        var posterData = (i.posters!)[0]
        let url = posterData.replacingOccurrences(of: " ", with: "%20")
        let urlNew = URL(string: "https://www.brninfotech.com/tws/\(url)")
        let posterDataTask = URLSession.shared.dataTask(with: urlNew!)
        {
            (posterData, connDetails, error) in
                        
        DispatchQueue.main.async {
            
        // Button Creation
        let posterButton = UIButton()
        posterButton.frame = CGRect(x: CGFloat(x) * self.scrollView.frame.width, y: 0, width: self.scrollView.frame.width, height: self.scrollView.frame.height)
        self.buttonsArray.append(posterButton)
        posterButton.setImage(UIImage(data: posterData!), for: UIControl.State.normal)
        posterButton.backgroundColor = .white
            self.scrollView.addSubview(posterButton)
            
            x += 1
            
        posterButton.addTarget(self, action: #selector(self.movieDetails(_:)), for: UIControl.Event.touchUpInside)
        
        posterButton.imageView?.contentMode = .scaleAspectFit

        posterButton.tag = j
            j += 1
                    
        
        let movieTitle = i.title
        self.movieTitlesArray.append(movieTitle!)
                                     
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
        scrollView.contentSize = CGSize(width: scrollView.frame.width * CGFloat(x), height: scrollView.frame.height)
            
        }
            
        }
        @objc func movieDetails(_ sender: UIButton){
                
        GettingData.shared.movieBtnTags = sender.tag
        let movieDetailsVC = storyboard?.instantiateViewController(identifier: "svc") as! MovieDetailsViewController
                
        present(movieDetailsVC, animated: true, completion: nil)
                
            }

           
    
    @objc func pageControlEventHandler()
    {
        scrollView.contentOffset.x = CGFloat(pageControl.currentPage) * scrollView.frame.width
//        scrollView.contentOffset.y = 50
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView)
    {
        
        pageControl.currentPage = Int(scrollView.contentOffset.x / scrollView.bounds.width)
        
    }
    @objc func timeEventHandler()
    {
        if(pageControl.currentPage != buttonsArray.count-1)
        {
            pageControl.currentPage += 1
        }
        else
        {
            pageControl.currentPage = 0
        }
        
        scrollView.contentOffset.x = CGFloat(pageControl.currentPage * Int(scrollView.frame.width))
        
    }
    
    
    
    

   }
    
    
    
    
    
    
    


