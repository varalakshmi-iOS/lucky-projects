//
//  FirstViewController6.swift
//  mediaApp2
//
//  Created by R Shantha Kumar on 12/13/19.
//  Copyright © 2019 R Shantha Kumar. All rights reserved.
//

import UIKit

class FirstViewController6: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    
    @IBOutlet weak var stackView: UIStackView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
displayiingData()


//storyView.isEditable = false

        scrollView.showsVerticalScrollIndicator = false
        // Do any additional setup after loading the view.
    }
    
    
    func displayiingData(){
                
        stackView.spacing = 30
        
    
        var titles = UILabel()
        titles.frame = CGRect(x: 70, y: 330, width: 200, height: 30)
        titles.textAlignment = .left
        titles.text = "Movie - \(FormData.shared.title[FormData.shared.selectedButton!])"
        stackView.addArrangedSubview(titles)
        
        
    
        var directorl = UILabel()
        directorl.frame = CGRect(x: 70, y: 330, width: 200, height: 30)
        directorl.textAlignment = .left
        
        directorl.text = "Director - \(FormData.shared.director[FormData.shared.selectedButton!])"
        stackView.addArrangedSubview(directorl)

        
        
        var Story = UILabel()
        Story.frame = CGRect(x: 200, y: 330, width: 200, height: 30)
        Story.textAlignment = .center
        Story.text = "Story"
        stackView.addArrangedSubview(Story)
       
        
        
        
        var storyView = UITextView()
        storyView.text! = FormData.shared.stories[FormData.shared.selectedButton!]
        storyView.translatesAutoresizingMaskIntoConstraints = false
        storyView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        storyView.backgroundColor = UIColor.clear
        storyView.isEditable = false
        stackView.addArrangedSubview(storyView)
        
        print( FormData.shared.stories[FormData.shared.selectedButton!])
        
        
        var actors = UILabel()
        actors.textAlignment = .center
        actors.text = "Actors"
        stackView.addArrangedSubview(actors)
        
        
        
        for y in FormData.shared.actorDetials[FormData.shared.selectedButton!]{
        
        var actors = UILabel()
         actors.frame = CGRect(x: 200, y: 330, width: 200, height: 30)
         actors.textAlignment = .left
         stackView.addArrangedSubview(actors)
         actors.text = y + "\n"
        }
        print(FormData.shared.actorDetials[FormData.shared.selectedButton!])

                 
                
           
           
           
           
           
           // Do any additional setup after loading the view.
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
