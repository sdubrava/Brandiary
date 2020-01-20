//
//  profilepolygonCell.swift
//  Brandiary
//
//  Created by young on 31/10/2019.
//  Copyright © 2019 young. All rights reserved.
//

import UIKit

class profilepolygonCell: UITableViewCell,UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collection2.dequeueReusableCell(withReuseIdentifier: "polygonprofileCollection", for: indexPath) as! polygonprofileCollection
        
        cell.something.layer.cornerRadius = 5
               cell.something.layer.masksToBounds = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(profilepolygonCell.tap(_:)))
               cell.something.isUserInteractionEnabled = true
               cell.something.addGestureRecognizer(tap)
        return cell
    }
    
 
    

    
    override func awakeFromNib() {
        super.awakeFromNib()
        collection2.delegate = self
        collection2.dataSource = self
        
    }
    @objc func tap(_ sender:UITapGestureRecognizer){

         let label:UILabel = (sender.view as! UILabel)
          if label.backgroundColor == UIColor(displayP3Red: 162/255, green: 32/255, blue: 58/255, alpha: 1) {
                   label.backgroundColor = UIColor(displayP3Red: 174/255, green: 174/255, blue: 174/255, alpha: 1)
               }else{
                    label.backgroundColor = UIColor(displayP3Red: 162/255, green: 32/255, blue: 58/255, alpha: 1)
               }
          
      }
 
   
    @IBOutlet weak var collection2: UICollectionView!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}

