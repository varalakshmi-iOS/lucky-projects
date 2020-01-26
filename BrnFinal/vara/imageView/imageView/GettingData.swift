//
//  GettingData.swift
//  imageView
//
//  Created by Varalakshmi Kacherla on 12/2/19.
//  Copyright © 2019 Varalakshmi Kacherla. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class GettingData: NSObject {
    
    static var shared:GettingData = GettingData()
    
    var movieBtnTags:Int!
    var buttonTapped:Int?
    var moviesStory = [String]()
    var moviesTitle = [String]()
    var actorsNames = [[String]]()
    var directorName = [String]()
    var moviePosterImage = [UIImage]()
    var movieTrailer = [AVPlayerViewController]()
    var audioSongsPaths = [AVPlayer]()
    var audioSongBtnTag:Int!
    
    var moviesData:[[String:Any]]!
    var audioSongArray = [[String]]()
    
    // function for fetching data from Server

    func gettingDetails() -> [[String:Any]] {

        var URLObj = URLRequest(url: URL(string: "https://www.brninfotech.com/tws/MovieDetails2.php?mediaType=movies")!)

        URLObj.httpMethod = "GET"
        var dataTask = URLSession.shared.dataTask(with: URLObj) { (data, connDetails, erroe) in
            do {
                self.moviesData = try! JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments) as! [[String:Any]]

                print(self.moviesData)
                
            }
            catch {
                print("Something went Wrong")
            }
        }
        dataTask.resume()
        while(moviesData == nil)
        {
        }
    return moviesData
    }
}

