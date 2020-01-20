//
//  TypesomethingViewController.swift
//  Brandiary
//
//  Created by young on 11/10/2019.
//  Copyright © 2019 young. All rights reserved.
//

import UIKit

class TypesomethingViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         let cell = collection.dequeueReusableCell(withReuseIdentifier: "SearchCollectionCell2", for: indexPath) as! SearchCollectionCell2
              
              return cell
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerview = collection.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "Typesomethingheader", for: indexPath) as! Typesomethingheader
        
                        headerview.headerview.layer.cornerRadius = 10
        headerview.headerview.layer.masksToBounds = true
                        headerview.headerview.layer.borderWidth = 1
                        headerview.headerview.layer.borderColor = UIColor(red:217/255, green:217/255, blue:217/255, alpha: 1).cgColor
        
        headerview.typesomthingview.layer.cornerRadius = 20
                        headerview.typesomthingview.layer.masksToBounds = true
        headerview.typesomthingview.layer.borderWidth = 1
                        headerview.typesomthingview.layer.borderColor = UIColor(red:217/255, green:217/255, blue:217/255, alpha: 1).cgColor

        return headerview
    }
    

    
    

    override func viewDidLoad() {
        super.viewDidLoad()
   

    }
    
  

    


    @IBOutlet weak var collection: UICollectionView!
  

}

extension TypesomethingViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: self.collection.bounds.width/3-1, height: self.collection.bounds.width/3)
    }


    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
}

