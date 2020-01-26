//
//  SingletonFormData.swift
//  mediaApp2
//
//  Created by R Shantha Kumar on 12/11/19.
//  Copyright © 2019 R Shantha Kumar. All rights reserved.
//

import Foundation
import UIKit

class FormData:NSObject{


    static var shared = FormData()
    
    var selectedButton:Int?
    
     var buttonTapped:Int?
    
    var data = [[String:Any]]()
    
    var images = [UIImage]()
    
    var title = [String]()
    
    var stories = [String]()
    
    var movieType = [String]()
    
    var director = [String]()
    
    var actorDetials = [[String]]()
    
    var songz = [[String]]()
    
    var songTitle = [[String]]()
    
    var videoData = [String]()
    
    private override init() {
        super.init()
    }
    
    
  

  
}
