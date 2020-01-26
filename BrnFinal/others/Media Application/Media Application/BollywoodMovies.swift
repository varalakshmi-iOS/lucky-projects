//
//  BollywoodMovies.swift
//  Media Application
//
//  Created by Vadde Narendra on 12/15/19.
//  Copyright © 2019 Vadde Narendra. All rights reserved.
//

import UIKit
import AVKit

class BollywoodMovies: UIViewController, UIScrollViewDelegate
{

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var posterPageController: UIPageControl!
    @IBOutlet weak var refreshBtn: UIButton!
    
    var contentView: UIView!
    var videoPlayer: AVPlayerViewController!
    var movieTitleArray = [String]()
    var stories = [String]()
    var postersBtnArray = [UIButton]()
    
    var moviesDict:[String:String] = ["War":"bollywood","Frozen 2":"Hollywood" ,"Ala Vaikuntapuram lo":"tollywood","Saaho":"tollywood","Pehlwaan":"bollywood","Frozen%202":"tollywood","Rakshasudu":"tollywood","Jersey":"tollywood","Manmadhudu 2":"tollywood","Mallesham":"tollywood","Khaidi":"tollywood",
                                      "Agent Sai Srinivasa Athreya":"tollywood","Sye Raa Narasimha Reddy":"tollywood","The Zoya Factor":"bollywood","Gaddalakonda Ganesh":"tollywood","George Reddy":"tollywood","Game Over":"tollywood","Dear Comrade":"tollywood","Petta":"tollywood","118" :"tollywood","Gang Leader":"tollywood","Oh! Baby":"tollywood","Whistle":"tollywood","Ranarangam":"tollywood","Evvarikee Cheppoddu":"tollywood","Evaru":"tollywood"]
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        scrollView.backgroundColor = UIColor.white
        scrollView.layer.cornerRadius = 20
        
        refreshBtn.backgroundColor = UIColor.yellow
        refreshBtn.layer.cornerRadius = 5
        
        creatingComponents()
        
        scrollView.delegate = self
        
        Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(timerEventHandler), userInfo: nil, repeats: true)
    }
    
    @IBAction func refreshBtnTapped(_ sender: UIButton)
    {
        creatingComponents()
    }
    
    // MARK:- creating Buttons, Labels, button tags and Passing data to Singleton class
    
    func creatingComponents()
    {
        // MARK:- Page Controller
        
        posterPageController.addTarget(self, action: #selector(pageControlEventHandler), for: UIControl.Event.valueChanged)
        
        var detailsTag = 0
        var songsTag = 0
        var trailerTag = 0
        
        let moviesData = GettingMoviesData.shared.gettingMoviesDetails()
        
        for x in postersBtnArray
        {
            x.removeFromSuperview()
        }
        
        postersBtnArray = [UIButton]()
        movieTitleArray = [String]()
        
        GettingMoviesData.shared.movieBtnTags = 0
        GettingMoviesData.shared.moviesStory = [String]()
        GettingMoviesData.shared.MoviesTitle = [String]()
        GettingMoviesData.shared.actorsNames = [[String]]()
        GettingMoviesData.shared.directorName = [String]()
        GettingMoviesData.shared.moviePosterImage = [UIImage]()
        
        
        
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
                        if (self.moviesDict[i.title!] == "bollywood")
                        {
                            self.contentView = UIView()
                            self.contentView.backgroundColor = UIColor.yellow
                            self.contentView.frame = CGRect(x: CGFloat(x) * self.scrollView.frame.width, y: 0, width: self.scrollView.frame.width, height: self.scrollView.frame.height)
                            self.scrollView.addSubview(self.contentView)
                            
                            let moviePosterBtn = UIButton()
                            moviePosterBtn.translatesAutoresizingMaskIntoConstraints = false
                            moviePosterBtn.widthAnchor.constraint(equalToConstant: 280).isActive = true
                            moviePosterBtn.heightAnchor.constraint(equalToConstant: 200).isActive = true
                            
                            self.postersBtnArray.append(moviePosterBtn)
                            moviePosterBtn.setImage(UIImage(data: posterData!), for: UIControl.State.normal)
                            moviePosterBtn.backgroundColor = UIColor.black
                            moviePosterBtn.layer.cornerRadius = 15
                            moviePosterBtn.contentMode = .scaleToFill
                            
                            x += 1
                            
                            self.posterPageController.numberOfPages = x
                            
                            let movieTitle = i.title
                            let movieTitleLbl = UILabel()
                            movieTitleLbl.text = movieTitle
                            movieTitleLbl.textColor = UIColor.black
                            movieTitleLbl.font = UIFont.boldSystemFont(ofSize: 20)
                            
                            let posterTitleSV = UIStackView(arrangedSubviews: [moviePosterBtn,movieTitleLbl])
                            posterTitleSV.axis = .vertical
                            posterTitleSV.alignment = .center
                            posterTitleSV.distribution = .fill
                            posterTitleSV.spacing = 20
                            
                            let trailerBtn = UIButton()
                            trailerBtn.translatesAutoresizingMaskIntoConstraints = false
                            trailerBtn.widthAnchor.constraint(equalToConstant: 60).isActive = true
                            trailerBtn.heightAnchor.constraint(equalToConstant: 60).isActive = true
                            trailerBtn.setImage(UIImage(named: "trailer"), for: UIControl.State.normal)
                            
                            trailerBtn.addTarget(self, action: #selector(self.trailerBtnTapped(_:)), for: UIControl.Event.touchUpInside)
                            
                            trailerBtn.tag = trailerTag
                            
                            trailerTag += 1
                            
                            let songsBtn = UIButton()
                            songsBtn.translatesAutoresizingMaskIntoConstraints = false
                            songsBtn.widthAnchor.constraint(equalToConstant: 45).isActive = true
                            songsBtn.heightAnchor.constraint(equalToConstant: 45).isActive = true
                            songsBtn.setImage(UIImage(named: "mp3"), for: UIControl.State.normal)
                            
                            songsBtn.addTarget(self, action: #selector(self.audioSongsBtnTapped(_:)), for: UIControl.Event.touchUpInside)
                            
                            songsBtn.tag = songsTag
                            
                            songsTag += 1
                            
                            let detailsBtn = UIButton()
                            detailsBtn.translatesAutoresizingMaskIntoConstraints = false
                            detailsBtn.widthAnchor.constraint(equalToConstant: 45).isActive = true
                            detailsBtn.heightAnchor.constraint(equalToConstant: 45).isActive = true
                            detailsBtn.setImage(UIImage(named: "details"), for: UIControl.State.normal)
                            
                            detailsBtn.addTarget(self, action: #selector(self.detailsBtnTapped(_:)), for: UIControl.Event.touchUpInside)
                            
                            detailsBtn.tag = detailsTag
                            
                            detailsTag += 1
                            
                            let buttonsSV = UIStackView(arrangedSubviews: [trailerBtn,songsBtn,detailsBtn])
                            
                            buttonsSV.axis = .horizontal
                            buttonsSV.alignment = .center
                            buttonsSV.distribution = .fillEqually
                            buttonsSV.spacing = 30
                            
                            let mainStackView = UIStackView(arrangedSubviews: [posterTitleSV,buttonsSV])
                            mainStackView.axis = .vertical
                            mainStackView.alignment = .center
                            mainStackView.distribution = .fill
                            mainStackView.spacing = 10
                            
                            
                            self.contentView.addSubview(mainStackView)
                            
                            mainStackView.translatesAutoresizingMaskIntoConstraints = false
                            
                            mainStackView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10).isActive = true
                            mainStackView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 10).isActive = true
                            mainStackView.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -10).isActive = true
                            mainStackView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10).isActive = true
                            
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
                            var allSongsUrlInString = [String]()
                            let stringSong:String = "https://www.brninfotech.com/tws/"
                            
                            for n in arraySong
                            {
                                let urlData = n.replacingOccurrences(of: " ", with: "%20")
                                
                                allSongsUrlInString.append(stringSong + urlData)
                                
                            }
                            GettingMoviesData.shared.audioSongArray.append(allSongsUrlInString)
                        }
                        else
                        {
                            if (x == 0)
                            {
                                let noDataImg = UIImageView(image: UIImage(named: "no_data"))
                                noDataImg.frame = CGRect(x: 0, y: 0, width: self.scrollView.frame.width, height: self.scrollView.frame.height)
                                
                                self.scrollView.addSubview(noDataImg)
                                
//                                self.posterPageController.isHidden = true
                            }
                        }
                }
            }
            posterDataTask.resume()
            
            scrollView.contentSize = CGSize(width: scrollView.frame.width * CGFloat(x), height: scrollView.frame.height)
        }
    }
    
    // MARK:- event handler for poster buttons
    
    @objc func trailerBtnTapped(_ sender: UIButton)
    {
        
        GettingMoviesData.shared.movieBtnTags = sender.tag
        
        videoPlayer = AVPlayerViewController()
        
        videoPlayer = GettingMoviesData.shared.movieTrailer[GettingMoviesData.shared.movieBtnTags]
        
        present(videoPlayer, animated: true, completion: nil)
        
    }
    
    // MARK:- event handler for audio songs
    
    @objc func audioSongsBtnTapped(_ sender: UIButton)
    {
        print("YYYYYYYYYYYY : ", sender.tag)
        
        GettingMoviesData.shared.movieBtnTags = sender.tag
        
        let audioVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "audioSongs") as? AudioSongVC
        self.navigationController?.pushViewController(audioVC!, animated: true)
    }
    
    // MARK:- event handler for audio songs
    
    @objc func detailsBtnTapped(_ sender: UIButton)
    {
        GettingMoviesData.shared.movieBtnTags = sender.tag
        
        let detailsVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "details") as? DetailsVC
        self.navigationController?.pushViewController(detailsVC!, animated: true)
    }
    
    
    // MARK:- Page Controller event handler
    
    @objc func pageControlEventHandler()
    {
        scrollView.contentOffset.x = CGFloat(posterPageController.currentPage) * scrollView.frame.width
        scrollView.contentOffset.y = 50
    }
    
    // MARK:- scrollView
    
    func scrollViewDidScroll(_ scrollView: UIScrollView)
    {
        posterPageController.currentPage = Int(scrollView.contentOffset.x / scrollView.bounds.width)
    }
    
    // MARK:- timer event handler
    
    @objc func timerEventHandler()
    {
        if(posterPageController.currentPage != postersBtnArray.count-1)
        {
            posterPageController.currentPage += 1
            
        }
        else
        {
            posterPageController.currentPage = 0
        }
        
        scrollView.contentOffset.x = CGFloat(posterPageController.currentPage * Int(scrollView.frame.width))
    }
}

