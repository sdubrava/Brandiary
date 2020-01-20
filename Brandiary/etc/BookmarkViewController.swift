//
//  BookmarkViewController.swift
//  Brandiary
//
//  Created by young on 06/08/2019.
//  Copyright © 2019 young. All rights reserved.
//

import UIKit

class BookmarkViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    @IBOutlet weak var collection: UICollectionView!
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collection.dequeueReusableCell(withReuseIdentifier: "bookmarkcell", for: indexPath)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: self.collection.frame.width/3, height: self.collection.frame.width/3)
    }
    


    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.collection.dataSource = self
        self.collection.delegate = self
        



        
        
    }
   
}
