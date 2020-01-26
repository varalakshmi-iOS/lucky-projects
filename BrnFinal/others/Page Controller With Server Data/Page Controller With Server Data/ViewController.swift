//
//  ViewController.swift
//  Page Controller With Server Data
//
//  Created by Vadde Narendra on 12/11/19.
//  Copyright © 2019 Vadde Narendra. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController, UIScrollViewDelegate
{

    // MARK:- Variables
    
    @IBOutlet weak var movieTitleLbl: UILabel!
    
    @IBOutlet weak var directorNameLbl: UILabel!
    
    @IBOutlet weak var storyLbl: UILabel!
    
    @IBOutlet weak var postersPageControllerObj: UIPageControl!
    
    var postersBtnArray = [UIButton]()
    var movieTitlesArray = [String]()
    var movieStoriesArray = [String]()
    var directorsNamesArray = [String]()
    let scrollView = UIScrollView()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        scrollView.delegate = self
    }
    
    // MARK:- creating Buttons, Labels, button tags and Passing data to Singleton class
    
    func creatingComponents()
    {
        // MARK:- Page Controller
        
        postersPageControllerObj.addTarget(self, action: #selector(pageControlEventHandler), for: UIControl.Event.valueChanged)
        
        // MARK:- Scroll View
        
        scrollView.frame = CGRect(x: 0, y: 160, width: view.frame.width, height: 400)
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.isPagingEnabled = true
        view.addSubview(self.scrollView)
        
        var j = 0
        let moviesData = GettingMoviesData.shared.gettingMoviesDetails()
        
        movieStoriesArray.removeAll()
        movieTitlesArray.removeAll()
        directorsNamesArray.removeAll()
        
        for x in postersBtnArray
        {
            x.removeFromSuperview()
        }
        
        postersBtnArray = [UIButton]()
        movieTitlesArray = [String]()
        movieStoriesArray = [String]()
        directorsNamesArray = [String]()
        
        GettingMoviesData.shared.movieBtnTags = 0
        GettingMoviesData.shared.moviesStory = [String]()
        GettingMoviesData.shared.MoviesTitle = [String]()
        GettingMoviesData.shared.actorsNames = [[String]]()
        GettingMoviesData.shared.directorName = [String]()
        GettingMoviesData.shared.moviePosterImage = [UIImage]()
        
        postersPageControllerObj.numberOfPages = moviesData.count
        
        var x = 0
        for i in moviesData
        {
            let posterImage = (i.posters!)[0]
            let urlString = posterImage.replacingOccurrences(of: " ", with: "%20")
            let posterURL = URL(string: "https://www.brninfotech.com/tws/\(urlString)")
            let posterDataTask = URLSession.shared.dataTask(with: posterURL!)
            {
                (posterData, conDetails, err) in
                
                DispatchQueue.main.async
                {
                    let moviePosterBtn = UIButton()
                    moviePosterBtn.frame = CGRect(x: CGFloat(x) * self.scrollView.frame.width, y: 0, width: self.scrollView.frame.width, height: self.scrollView.frame.height)
                    
                    self.postersBtnArray.append(moviePosterBtn)
                    moviePosterBtn.setImage(UIImage(data: posterData!), for: UIControl.State.normal)
                    moviePosterBtn.backgroundColor = UIColor.black
                   self.scrollView.addSubview(moviePosterBtn)
                    x += 1
                
                    
                    
                    moviePosterBtn.addTarget(self, action: #selector(self.movieDetails(_:)), for: UIControl.Event.touchUpInside)
                    
                    moviePosterBtn.tag = j
                    
                    j += 1
                    
                    let movieTitle = i.title
                    self.movieTitlesArray.append(movieTitle!)
                    
                    GettingMoviesData.shared.moviePosterImage.append(UIImage(data: posterData!)!)
                    GettingMoviesData.shared.directorName.append(i.director!)
                
                    GettingMoviesData.shared.MoviesTitle.append(i.title!)
                    GettingMoviesData.shared.moviesStory.append(i.story ?? "😜 Story not Available")
                
                    let actorsName = i.actors
                    GettingMoviesData.shared.actorsNames.append(actorsName!)
                    
                    let video = (i.trailers!)[0]
                    let videoURL = video.replacingOccurrences(of: " ", with: "%20")
                    let videoAVPlayer = AVPlayerViewController()
                    videoAVPlayer.player = AVPlayer(url: URL(string: "https://www.brninfotech.com/tws/\(videoURL)")!)
                    GettingMoviesData.shared.movieTrailer.append(videoAVPlayer)
                    
                    let arraySong:[String] = i.songs!
                    
                    let convString = arraySong.joined(separator: "")
                    
                    let string:String = "https://www.brninfotech.com/tws/ "
                    
                    let addString = string.replacingOccurrences(of: " ", with: convString,options:  .literal,range: nil)
                    
                    let finalStringSong = addString.replacingOccurrences(of: " ", with: "%20",options:  .literal,range: nil)
                    
                    var allSongsUrlInString = [String]()
                    
                    let stringSong:String = "https://www.brninfotech.com/tws/"
                    
                    for n in arraySong
                    {
                        let urlData = n.replacingOccurrences(of: " ", with: "%20")
                        
                            allSongsUrlInString.append(stringSong + urlData)
                            
                        }
                    GettingMoviesData.shared.audioSongArray.append(allSongsUrlInString)
                    
                }
            }
            posterDataTask.resume()
            
            scrollView.contentSize = CGSize(width: scrollView.frame.width * CGFloat(x), height: scrollView.frame.height)
        }
    }
    
    // MARK:- event handler for poster buttons
    
    @objc func movieDetails(_ sender: UIButton)
    {
        
        GettingMoviesData.shared.movieBtnTags = sender.tag
        
        let movieDetailsVC = storyboard?.instantiateViewController(withIdentifier: "moviesDetails") as! MoviesDetails
        
        present(movieDetailsVC, animated: true, completion: nil)
    }

    // MARK:- refresh button action
    
    @IBAction func refreshBtnTapped(_ sender: UIButton)
    {
        creatingComponents()
        
        Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(timerEventHandler), userInfo: nil, repeats: true)

    }
    
    // MARK:- Page Controller event handler
    
    @objc func pageControlEventHandler()
    {
        scrollView.contentOffset.x = CGFloat(postersPageControllerObj.currentPage) * scrollView.frame.width
        scrollView.contentOffset.y = 50
    }
    
    // MARK:- scrollView
    
    func scrollViewDidScroll(_ scrollView: UIScrollView)
    {
        postersPageControllerObj.currentPage = Int(scrollView.contentOffset.x / scrollView.bounds.width)
    }
    
    // MARK:- timer event handler
    
    @objc func timerEventHandler()
    {
        if(postersPageControllerObj.currentPage != postersBtnArray.count-1)
        {
            postersPageControllerObj.currentPage += 1
            
        }
        else
        {
            postersPageControllerObj.currentPage = 0
        }
        
        scrollView.contentOffset.x = CGFloat(postersPageControllerObj.currentPage * Int(scrollView.frame.width))
    }
    
}

