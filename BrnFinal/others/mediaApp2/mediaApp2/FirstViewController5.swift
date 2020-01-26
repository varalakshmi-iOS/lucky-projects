//
//  FirstViewController5.swift
//  mediaApp2
//
//  Created by R Shantha Kumar on 12/13/19.
//  Copyright © 2019 R Shantha Kumar. All rights reserved.
//

import UIKit
import AVKit


class FirstViewController5: UIViewController {

    var vieplayer:AVPlayerViewController!
    
    
    
    @IBOutlet weak var contentVie: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        media()
    }
    func media(){
        
        // Do any additional setup after loading the view.
    
         vieplayer = AVPlayerViewController()
   
             
        let videString = FormData.shared.videoData[FormData.shared.selectedButton!]
               
               print(videString)
                  //                data = AVPlayer(url: URL(string: video)!)
        vieplayer.player = AVPlayer(url: URL(string: videString)!)
        
        vieplayer.view.frame = CGRect(x: 0, y: 0, width: contentVie.frame.width, height: contentVie.frame.height)
              
        
        contentVie.addSubview(vieplayer.view)
    }
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
