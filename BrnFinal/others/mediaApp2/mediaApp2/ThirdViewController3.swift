//
//  ThirdViewController3.swift
//  mediaApp2
//
//  Created by R Shantha Kumar on 12/13/19.
//  Copyright © 2019 R Shantha Kumar. All rights reserved.
//

import UIKit

class ThirdViewController3: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
     displayiingData()
        // DdisplayiingData()o any additional setup after loading the view.
    }
    
    
    func displayiingData(){
         
       
         
        var myImageView = UIImageView()
         myImageView.image = FormData.shared.images[FormData.shared.selectedButton!]
         myImageView.frame = CGRect(x: 30, y: 200, width: 300, height: 300)
         myImageView.widthAnchor.constraint(equalToConstant: 300).isActive = true
         myImageView.heightAnchor.constraint(equalToConstant: 300).isActive = true
         view.addSubview(myImageView)
         
    
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
