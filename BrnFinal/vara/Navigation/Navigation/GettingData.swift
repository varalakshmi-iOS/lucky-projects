//
//  GettingData.swift
//  Navigation
//
//  Created by Varalakshmi Kacherla on 12/17/19.
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
    var MoviesTitle = [String]()
    var actorsNames = [[String]]()
    var directorName = [String]()
    var moviePosterImage = [UIImage]()
    var movieTrailer = [AVPlayerViewController]()
    var audioSongBtnTag:Int!
    var audioSongArray = [[String]]()
    var movieType = [String]()
    
    
    
    func gettingMoviesDetails() -> [Movie]
    {
        var moviesData:[Movie]?
        
        var urlObj = URLRequest(url: URL(string: "https://www.brninfotech.com/tws/MovieDetails2.php?mediaType=movies")!)
        
        urlObj.httpMethod = "Get"
        
        let  taskObj = URLSession.shared.dataTask(with: urlObj)
        {
            (data, response, err) in
            
            let  decoder = JSONDecoder()
            
            do
            {
                moviesData = try decoder.decode([Movie].self, from: data!)
            }
            catch
            {
                print("Something went wrong")
            }
        }
        taskObj.resume()
        
        while(moviesData == nil)
        {
            
        }
        
        return moviesData!
        
    }


}
