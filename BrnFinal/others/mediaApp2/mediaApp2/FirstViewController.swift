//
//  FirstViewController.swift
//  mediaApp2
//
//  Created by R Shantha Kumar on 12/11/19.
//  Copyright © 2019 R Shantha Kumar. All rights reserved.
//

import UIKit
import  AVKit

class FirstViewController: UIViewController,UIScrollViewDelegate{

    var urlRequestObj:URLRequest!
       var  dataTaskObj:URLSessionDataTask!
    var data:AVPlayer?
    var segmentControl = UISegmentedControl()
    
    var serverData1 = [[String:Any]]()
    var allArray = [UILabel()]
    
    var titleDictonary = [String:String]()
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    
    
    
    
    
//    var allMovies = ["tollywood":String]()
    
//

    
    var imaged:UIImage?
    

  var alltitles = [String]()
  
    var xValue:CGFloat?
    var length:CGFloat!
    var lengthHeight:CGFloat!
     var contentView: UIView!
    
    var timer:Timer?
    
    @IBOutlet weak var scrollView1: UIScrollView!
  
    
    var mm:[String:String] = ["War":"bollywood","Frozen 2":"Hollywood" ,"Ala Vaikuntapuram lo":"tollywood","Saaho":"tollywood","Pehlwaan":"bollywood","Frozen%202":"tollywood","Rakshasudu":"tollywood","Jersey":"tollywood","Manmadhudu 2":"tollywood","Mallesham":"tollywood","Khaidi":"tollywood",
    "Agent Sai Srinivasa Athreya":"tollywood","Sye Raa Narasimha Reddy":"tollywood","The Zoya Factor":"bollywood","Gaddalakonda Ganesh":"tollywood","George Reddy":"tollywood","Game Over":"tollywood","Dear Comrade":"tollywood","Petta":"tollywood","118" :"tollywood","Gang Leader":"tollywood","Oh! Baby":"tollywood","Whistle":"tollywood","Ranarangam":"tollywood","Evvarikee Cheppoddu":"tollywood","Evaru":"tollywood"]
    @IBAction func refresh(_ sender: UIBarButtonItem) {
        
        mediaData()
        
        dataOperation()
        
        
               
            pageControl.isHidden = false
        
        
    }
    
    
    
    
    
        
//       var myImage = UIImageView()
//        myImage.frame = CGRect(x: 0, y: 0, width: scrollView1.frame.width, height: scrollView1.frame.height)
//        myImage.image =  UIImage(named: "loading")
//        contentView.addSubview(myImage)
      
        
      
              
        //
        
        
        
 
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        
        scrollView1.delegate = self
        scrollView1.showsVerticalScrollIndicator = false
         scrollView1.isPagingEnabled = true
        segmentControl.selectedSegmentIndex = -1
        
             

         // Do any additional setup after loading the view.
           pageControl.isHidden = true
           scrollView1.delegate = self
           
           scrollView1.isPagingEnabled = true
           scrollView1.showsHorizontalScrollIndicator  = false
           

           pageControl.addTarget(self, action: #selector(pageControllerEvent), for: UIControl.Event.valueChanged)
          timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(timerEvent), userInfo: nil, repeats: true)
        
       
    
       }
        
       @objc func pageControllerEvent(){
           
          
           if(pageControl.currentPage == Int(pageControl.numberOfPages-1))
                         {
                             
                      pageControl.currentPage = 0
                
                             
                         }
                             
               scrollView1.scrollRectToVisible(CGRect(x: CGFloat(pageControl.currentPage)*scrollView1.frame.width, y: 0, width: scrollView1.frame.width, height: scrollView1.frame.height), animated: true)
               
           
       }
    
    
    
    
    
    
    
       
       @objc func timerEvent(){


           if(pageControl.currentPage < Int(pageControl.numberOfPages-1))
                  {

                      pageControl.currentPage += 1


                  }else{

                      pageControl.currentPage = 0

                  }
           scrollView1.scrollRectToVisible(CGRect(x: CGFloat(pageControl.currentPage)*scrollView1.frame.width, y: 0, width: scrollView1.frame.width, height: scrollView1.frame.height), animated: true)




        }
      
  
                           
    func dataOperation(){
       
        serverData1 = mediaData()

                                   FormData.shared.movieType = [String]()
                                   FormData.shared.images = [UIImage]()
                                   FormData.shared.title = [String]()
                                   FormData.shared.stories = [String]()
                                   FormData.shared.songz = [[String]]()
                                   FormData.shared.videoData = [String]()

        
        
        
        
            
      for x in 0...serverData1.count-1{
//                  pageController.numberOfPages = data.count
        let titles = serverData1[x]["title"] as!  String
        FormData.shared.title.append(titles)
        print(titles)
        FormData.shared.movieType.append(mm[titles]!)
    
        let imageString = (serverData1[x]["posters"] as!  [String])
        let string1 = imageString.joined(separator: "")
        var strig2 = "https://www.brninfotech.com/tws/ "
        var image1String = "%20"
        let newString = strig2.replacingOccurrences(of: " ", with: string1, options: .literal, range: nil)
        let newString2 = newString.replacingOccurrences(of: " ", with: image1String, options: .literal, range: nil)
      
                   let url  = URL(string: newString2)
                   let data = try! Data(contentsOf: url!)


               imaged = UIImage(data: data)
        
        
               FormData.shared.images.append(imaged!)


// appending story to singleton class
        

        let stories = serverData1[x]["story"] as? String ?? "DATA NOT AVAILABLE"
        
        FormData.shared.stories.append(stories)
        
//appending director info to singleton class
        
        
        let director = serverData1[x]["director"] as! String
        
        FormData.shared.director.append(director)
        
      
        
//appending director info to singleton class
        
        let actorDetails = serverData1[x]["actors"] as! [String]
        
        FormData.shared.actorDetials.append(actorDetails)
        
// song appending
        
        
                      let audio = serverData1[x]["songs"] as! [String]
        
                      let replace = "%20"
                      let ith = " "
        
                      let strig6 = "https://www.brninfotech.com/tws/"
        
                      var allSongsUrlInString = [String]()
                      var names = [String]()
        
                      for x in audio
                          {
                               if (x.count != 0){
                                  let replace = "%20"
                              let ith = " "
                      
                              let urlData = x.replacingOccurrences(of: ith, with: replace)
                              
                              allSongsUrlInString.append(strig6 + urlData)
                              
                              
                              if let index =  (x.range(of: "-")?.upperBound)
                                      {
                                          names.append(String(x.suffix(from: index)))
                                          
                                      }
                              
                          
                          }
                          }
        
        FormData.shared.songz.append(allSongsUrlInString)
        FormData.shared.songTitle.append(names)
        
 
//video data
        
                      let video = serverData1[x]["trailers"] as!  [String]
        
                      var videoclub:String!
                      var trialer:String!
                      for v in video{
                       videoclub = strig2.replacingOccurrences(of: " ", with: v)
                          let v = "%20"
        
                         trialer = videoclub.replacingOccurrences(of: " ", with: v)
        
        
                      }
                         
        
                      FormData.shared.videoData.append(trialer)
        
        
        
                }
   
        
                
        var imageViewCount = 0
                        
        for y in 0...FormData.shared.movieType.count-1
        {
            pageControl.numberOfPages = imageViewCount + 1
            
    if(FormData.shared.movieType[y] == "tollywood")
{
   
        
                
    
        
                 xValue = CGFloat(imageViewCount)*scrollView1.frame.width
                 length = scrollView1.frame.width
                 lengthHeight = scrollView1.frame.height
        
                 imageViewCount += 1
        
   
    
    
                
        
        var myImageView = UIImageView()
        
        myImageView.frame = CGRect(x: 25, y: 50, width: 270, height: 300)
        contentView = UIView()
        myImageView.image = FormData.shared.images[y]
        
        myImageView.clipsToBounds = true
        myImageView.tag = y
    
    
        
        contentView.backgroundColor = .white
        contentView.frame = CGRect(x: xValue!, y: 0, width:length, height: scrollView1.bounds.height)
        myImageView.layer.cornerRadius = contentView.frame.size.width/5
        contentView.layer.cornerRadius = contentView.frame.size.width/5
        contentView.clipsToBounds = true
        contentView.addSubview(myImageView)
    
//  movieTitles
    
    
          var titles = UILabel()
          titles.frame = CGRect(x: 0, y: 15, width: 321, height: 30)
          titles.textAlignment = .center
          titles.text = FormData.shared.title[y]
          contentView.addSubview(titles)
    
    
    
//segmentControl
    

                
        segmentControl = UISegmentedControl()
        let items = ["poster","songs","trailer","Details"]
        segmentControl = UISegmentedControl(items: items)
        segmentControl.frame = CGRect(x: 53, y: 366, width: 220, height: 40)
        segmentControl.tag = y
        //segmentControl.selectedSegmentIndex = -1
        segmentControl.selectedSegmentTintColor = .systemBlue
        segmentControl.backgroundColor = .white
        segmentControl.addTarget(self, action: #selector(eventForSegmentcontrol(obj:)), for: UIControl.Event.valueChanged)
        contentView.addSubview(segmentControl)
                
                
                 //scrollView
                
        scrollView1.addSubview(contentView)
        scrollView1.contentSize = CGSize(width: CGFloat(imageViewCount)*length!, height: lengthHeight)
    
                
    }
        }
        
        
        
        //}







              }
    
    
    @objc func eventForSegmentcontrol(obj:UISegmentedControl){
        
//        print("Sender : ",obj)
//
//        print("Actual Object : ",segmentControl)
 
//
        if(obj.selectedSegmentIndex == 0){
        
        FormData.shared.selectedButton = obj.tag
        
            print( FormData.shared.selectedButton)
        let target = storyboard?.instantiateViewController(identifier: "firstView2") as! FirstViewController2
        
            navigationController?.pushViewController(target, animated: true)
        }
        
        if(obj.selectedSegmentIndex == 3){
        
        FormData.shared.selectedButton = obj.tag
        
            print( FormData.shared.selectedButton)
        let target = storyboard?.instantiateViewController(identifier: "firstView6") as! FirstViewController6
        
        navigationController?.pushViewController(target, animated: true)
        }
        
        if(obj.selectedSegmentIndex == 1){
        
        FormData.shared.selectedButton = obj.tag
        
            print( FormData.shared.selectedButton)
        let target = storyboard?.instantiateViewController(identifier: "firstView4") as! FirstViewController4
        
        navigationController?.pushViewController(target, animated: true)
        }
//
        if(obj.selectedSegmentIndex == 2){
            
  
           
        FormData.shared.selectedButton = obj.tag

            print( FormData.shared.selectedButton)
        let target = storyboard?.instantiateViewController(identifier: "firstView5") as! FirstViewController5

        navigationController?.pushViewController(target, animated: true)
        }
//
        
        
        
    }
     
        
        
    
    

    /*
     MARK: - Navigation

     In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         Get the new view controller using segue.destination.
         Pass the selected object to the new view controller.
    }
    */
    
    
 func mediaData()-> [[String:Any]]
    {
        
       
        
        
        var data1:[[String:Any]]?
        
        
        urlRequestObj = URLRequest(url: URL(string: "https://www.brninfotech.com/tws/MovieDetails2.php?mediaType=movies")!)
        
        urlRequestObj.httpMethod = "GET"
        
        dataTaskObj = URLSession.shared.dataTask(with: urlRequestObj, completionHandler: { (data, respond, error) in
            do{
                
                data1 = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments) as! [[String:Any]]
           
                
            }catch{
                
                                print("something error")
                
            }
            
            
        })
        dataTaskObj.resume()
        
        while (data1==nil) {
            
        }
        
        
        FormData.shared.data = data1!
        
       
        
        return data1!
    }
    
    
    
    
    
    
}
