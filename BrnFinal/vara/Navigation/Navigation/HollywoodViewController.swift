//
//  HollywoodViewController.swift
//  Navigation
//
//  Created by Varalakshmi Kacherla on 12/17/19.
//  Copyright © 2019 Varalakshmi Kacherla. All rights reserved.
//

import UIKit
import AVKit

class HollywoodViewController: UIViewController,UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var refreshBtn: UIButton!
    
    
    
       var contentView: UIView!
       var videoPlayer: AVPlayerViewController!
       var movieTitleArray = [String]()
       var stories = [String]()
       var postersBtnArray = [UIButton]()
       
       var moviesDict:[String:String] = ["War":"bollywood","Frozen 2":"Hollywood" ,"Ala Vaikuntapuram lo":"tollywood","Saaho":"tollywood","Pehlwaan":"bollywood","Frozen%202":"tollywood","Rakshasudu":"tollywood","Jersey":"tollywood","Manmadhudu 2":"tollywood","Mallesham":"tollywood","Khaidi":"tollywood",
                                         "Agent Sai Srinivasa Athreya":"tollywood","Sye Raa Narasimha Reddy":"tollywood","The Zoya Factor":"bollywood","Gaddalakonda Ganesh":"tollywood","George Reddy":"tollywood","Game Over":"tollywood","Dear Comrade":"tollywood","Petta":"tollywood","118" :"tollywood","Gang Leader":"tollywood","Oh! Baby":"tollywood","Whistle":"tollywood","Ranarangam":"tollywood","Evvarikee Cheppoddu":"tollywood","Evaru":"tollywood"]
       
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.backgroundColor = UIColor.white
        scrollView.layer.cornerRadius = 20
        
        refreshBtn.backgroundColor = UIColor.yellow
        refreshBtn.layer.cornerRadius = 5
        
        creatingComponents()
        
        scrollView.delegate = self
        
        Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(timerEventHandler), userInfo: nil, repeats: true)
        

        // Do any additional setup after loading the view.
    }
    

    @IBAction func onBtnTap(_ sender: UIButton) {
        
        creatingComponents()
    }
    
    func creatingComponents()
    {
        // MARK:- Page Controller
        
        pageControl.addTarget(self, action: #selector(pageControlEventHandler), for: UIControl.Event.valueChanged)
        
        var detailsTag = 0
        var songsTag = 0
        var trailerTag = 0
        
        let moviesData = GettingData.shared.gettingMoviesDetails()
        
        for x in postersBtnArray
        {
            x.removeFromSuperview()
        }
        
        postersBtnArray = [UIButton]()
        movieTitleArray = [String]()
        
        GettingData.shared.movieBtnTags = 0
        GettingData.shared.moviesStory = [String]()
        GettingData.shared.MoviesTitle = [String]()
        GettingData.shared.actorsNames = [[String]]()
        GettingData.shared.directorName = [String]()
        GettingData.shared.moviePosterImage = [UIImage]()
        
        
        
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
                        if (self.moviesDict[i.title!] == "hollywood")
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
                            
                            self.pageControl.numberOfPages = x
                            
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
                            songsBtn.widthAnchor.constraint(equalToConstant: 60).isActive = true
                            songsBtn.heightAnchor.constraint(equalToConstant: 45).isActive = true
                            songsBtn.setImage(UIImage(named: "mp3"), for: UIControl.State.normal)
                            
                            songsBtn.addTarget(self, action: #selector(self.audioSongsBtnTapped(_:)), for: UIControl.Event.touchUpInside)
                            
                            songsBtn.tag = songsTag
                            
                            songsTag += 1
                            
                            let detailsBtn = UIButton()
                            detailsBtn.translatesAutoresizingMaskIntoConstraints = false
                            detailsBtn.widthAnchor.constraint(equalToConstant: 60).isActive = true
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
                            
                            GettingData.shared.moviePosterImage.append(UIImage(data: posterData!)!)
                            GettingData.shared.directorName.append(i.director!)
                            
                            GettingData.shared.MoviesTitle.append(i.title!)
                            GettingData.shared.moviesStory.append(i.story ?? "😜 Story not Available")
                            
                            let actorsName = i.actors
                            GettingData.shared.actorsNames.append(actorsName!)
                            
                            let video = (i.trailers!)[0]
                            let videoURL = video.replacingOccurrences(of: " ", with: "%20")
                            let videoAVPlayer = AVPlayerViewController()
                            videoAVPlayer.player = AVPlayer(url: URL(string: "https://www.brninfotech.com/tws/\(videoURL)")!)
                            GettingData.shared.movieTrailer.append(videoAVPlayer)
                            
                            let arraySong:[String] = i.songs!
                            var allSongsUrlInString = [String]()
                            let stringSong:String = "https://www.brninfotech.com/tws/"
                            
                            for n in arraySong
                            {
                                let urlData = n.replacingOccurrences(of: " ", with: "%20")
                                
                                allSongsUrlInString.append(stringSong + urlData)
                                
                            }
                            GettingData.shared.audioSongArray.append(allSongsUrlInString)
                        }
                        else
                        {
                            if (x == 0)
                            {
                                let noDataImg = UIImageView(image: UIImage(named: "no_data"))
                                noDataImg.frame = CGRect(x: 0, y: 0, width: self.scrollView.frame.width, height: self.scrollView.frame.height)
                                
                                self.scrollView.addSubview(noDataImg)
                                
                                self.pageControl.isHidden = true
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
        
        GettingData.shared.movieBtnTags = sender.tag
        
        videoPlayer = AVPlayerViewController()
        
        videoPlayer = GettingData.shared.movieTrailer[GettingData.shared.movieBtnTags]
        
        present(videoPlayer, animated: true, completion: nil)
        
    }
    
    // MARK:- event handler for audio songs
    
    @objc func audioSongsBtnTapped(_ sender: UIButton)
    {
        print("YYYYYYYYYYYY : ", sender.tag)
        
        GettingData.shared.movieBtnTags = sender.tag
        
        let audioVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "avc") as? AudioViewController
        self.navigationController?.pushViewController(audioVC!, animated: true)
    }
    
    // MARK:- event handler for audio songs
    
    @objc func detailsBtnTapped(_ sender: UIButton)
    {
        GettingData.shared.movieBtnTags = sender.tag
        
        let detailsVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "dvc") as? DetailsViewController
        self.navigationController?.pushViewController(detailsVC!, animated: true)
    }
    
    
    // MARK:- Page Controller event handler
    
    @objc func pageControlEventHandler()
    {
        scrollView.contentOffset.x = CGFloat(pageControl.currentPage) * scrollView.frame.width
        scrollView.contentOffset.y = 50
    }
    
    // MARK:- scrollView
    
    func scrollViewDidScroll(_ scrollView: UIScrollView)
    {
        pageControl.currentPage = Int(scrollView.contentOffset.x / scrollView.bounds.width)
    }
    
    // MARK:- timer event handler
    
    @objc func timerEventHandler()
    {
        if(pageControl.currentPage != postersBtnArray.count-1)
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
