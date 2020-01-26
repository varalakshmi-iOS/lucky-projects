//
//  ThirdViewController.swift
//  mediaApp2
//
//  Created by R Shantha Kumar on 12/11/19.
//  Copyright © 2019 R Shantha Kumar. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController,UIScrollViewDelegate {
    
    var serverData1 = [[String:Any]]()
       
    @IBOutlet weak var scrollView1: UIScrollView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    var xValue:CGFloat!
        
        var length:CGFloat!
       var lengthHeight:CGFloat!
        var contentView:UIView!
        var segmentControl:UISegmentedControl!
    var timer:Timer?
    
    var mm:[String:String] = ["War":"bollywood","Frozen 2":"Hollywood" ,"Ala Vaikuntapuram lo":"tollywood","Saaho":"tollywood","Pehlwaan":"bollywood","Frozen%202":"tollywood","Rakshasudu":"tollywood","Jersey":"tollywood","Manmadhudu 2":"tollywood","Mallesham":"tollywood","Khaidi":"tollywood",
    "Agent Sai Srinivasa Athreya":"tollywood","Sye Raa Narasimha Reddy":"tollywood","The Zoya Factor":"bollywood","Gaddalakonda Ganesh":"tollywood","George Reddy":"tollywood","Game Over":"tollywood","Dear Comrade":"tollywood","Petta":"tollywood","118" :"tollywood","Gang Leader":"tollywood","Oh! Baby":"tollywood","Whistle":"tollywood","Ranarangam":"tollywood","Evvarikee Cheppoddu":"tollywood","Evaru":"tollywood"]
       
       override func viewDidLoad() {
           super.viewDidLoad()
        
        pageControl.isHidden = true
        scrollView1.delegate = self
        scrollView1.isPagingEnabled = true
           
         
    
//     Do any additional setup after loading the view.
    
     pageControl.addTarget(self, action: #selector(pageControllerEvent), for: UIControl.Event.valueChanged)
          timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(timerEvent), userInfo: nil, repeats: true)
       }

    
    
    @IBAction func refresh(_ sender: Any) {
        pageControl.isHidden = false
        mediaData()
        mediaData1()
        
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

    
    
    
    
    
    
    
    
    func mediaData1(){
        
        
        serverData1 = FormData.shared.data
            
            
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


                         var  imaged = UIImage(data: data)
                    
                    
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
            
        
        

        
        var imageCount = 0
        
        if(FormData.shared.movieType.count != 0){
           for y in 0...FormData.shared.movieType.count-1
                   {
                    
                
                    
                    
                    
               if(FormData.shared.movieType[y] == "Hollywood")
           {
               print("Movie Name :", FormData.shared.title[y])
               
               
            pageControl.numberOfPages = imageCount + 1

                     xValue = CGFloat(imageCount)*scrollView1.bounds.width
                     length = scrollView1.frame.width
                     lengthHeight = scrollView1.frame.height
               
                           imageCount += 1
            
                       contentView = UIView()
                   var myImageView = UIImageView()
            
            
                       myImageView.tag = y
               contentView.frame = CGRect(x: xValue!, y: 0, width:scrollView1.bounds.width, height: scrollView1.bounds.height)
                   myImageView.frame = CGRect(x: 25, y: 30, width: 270, height: 300)
                           
                   contentView.backgroundColor = .white
                   myImageView.layer.cornerRadius = contentView.frame.size.width/5
                   myImageView.clipsToBounds = true
                   contentView.layer.cornerRadius = contentView.frame.size.width/5
                   contentView.clipsToBounds = true
                   myImageView.image = FormData.shared.images[y]
               

              
                   contentView.addSubview(myImageView)
            
            
            

                  var titles = UILabel()
                  titles.frame = CGRect(x: 70, y: 330, width: 200, height: 30)
                  titles.textAlignment = .center
                  titles.text = FormData.shared.title[y]
                  contentView.addSubview(titles)
            
            
            
            
            
                           
    //segmentControl
                           
                      segmentControl = UISegmentedControl()
                                       let items = ["poster","songs","trailer","story"]
                                       segmentControl = UISegmentedControl(items: items)
                                       segmentControl.frame = CGRect(x: 60, y: 366, width: 200, height: 40)
                                       segmentControl.tag = y
                                       //segmentControl.selectedSegmentIndex = -1
                                       segmentControl.selectedSegmentTintColor = .systemBlue
                                       segmentControl.backgroundColor = .white
                                       segmentControl.addTarget(self, action: #selector(eventForSegmentcontrol(obj:)), for: UIControl.Event.valueChanged)
                                       contentView.addSubview(segmentControl)
                           
                           
//scrollView
                           
                  scrollView1.addSubview(contentView)
                     
               
               
               scrollView1.contentSize = CGSize(width: CGFloat(imageCount)*length!, height: lengthHeight)
               
                           
               }
                   }
           
       }
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
               
               
               
               
           }
       

 func mediaData()-> [[String:Any]]
    {
        
       
        
        
        var data1:[[String:Any]]?
        
        
      var  urlRequestObj = URLRequest(url: URL(string: "https://www.brninfotech.com/tws/MovieDetails2.php?mediaType=movies")!)
        
        urlRequestObj.httpMethod = "GET"
        
      var  dataTaskObj = URLSession.shared.dataTask(with: urlRequestObj, completionHandler: { (data, respond, error) in
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
    
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
