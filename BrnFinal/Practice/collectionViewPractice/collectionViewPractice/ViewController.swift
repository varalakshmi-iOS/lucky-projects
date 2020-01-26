//
//  ViewController.swift
//  collectionViewPractice
//
//  Created by Varalakshmi Kacherla on 1/4/20.
//  Copyright © 2020 Varalakshmi Kacherla. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
   
    
    
    var cv:UICollectionView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        createUI()
        // Do any additional setup after loading the view.
    }


    
    func createUI(){
        
        var flowLayOut = UICollectionViewFlowLayout()
        
        flowLayOut.itemSize = CGSize(width: 100, height: 100)
        flowLayOut.minimumLineSpacing = 20
        flowLayOut.minimumInteritemSpacing = 10
        flowLayOut.scrollDirection = .horizontal
        
        cv = UICollectionView(frame: view.frame, collectionViewLayout: flowLayOut)
        
        
        view.addSubview(cv)

        cv.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "aaa")
        cv.delegate = self
        cv.dataSource = self
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
           
        return 100
       }
       
       func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var cell = collectionView.dequeueReusableCell(withReuseIdentifier: "aaa", for: indexPath)
        
        var imgViewObj = UIImageView(image: UIImage(named: "flower"))
        
        imgViewObj.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        
        cell.contentView.addSubview(imgViewObj)
        
        return cell
        
       }
}

