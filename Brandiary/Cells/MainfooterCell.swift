//
//  MainfooterCell.swift
//  Brandiary
//
//  Created by young on 11/12/2019.
//  Copyright © 2019 young. All rights reserved.
//

import UIKit
import DGCollectionViewLeftAlignFlowLayout



class MainfooterCell: UITableViewCell,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
  
        
    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var Boosterbtn: UIButton!
    @IBOutlet weak var Selectagtime: UILabel!
    @IBOutlet weak var Selectlabel: UILabel!
    @IBOutlet weak var sharebtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collection.delegate = self
        collection.dataSource = self
        collection.collectionViewLayout = DGCollectionViewLeftAlignFlowLayout()
       
     
        
        
    }


    

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let labelwidth = collectiontags[collection.tag][indexPath.section].widthOfString(usingFont: UIFont.systemFont(ofSize: 10))
        if collectiontags[collection.tag][indexPath.section].count < 5{
        return CGSize(width: labelwidth+30, height: 25)
        }else if collectiontags[collection.tag][indexPath.section].count < 10 {
             return CGSize(width: labelwidth+35, height: 25)
        }else if collectiontags[collection.tag][indexPath.section].count < 15 {
             return CGSize(width: labelwidth+45, height: 25)
        }
        else {
        return CGSize(width: labelwidth+45, height: 25)
        }
    }
    

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, layout
        collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return collectiontags[collection.tag][section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collection.dequeueReusableCell(withReuseIdentifier: "polygonprofileCollection", for: indexPath) as! polygonprofileCollection
        cell.something.backgroundColor = UIColor(displayP3Red: 238/255, green: 238/255, blue: 238/255, alpha: 1)
               cell.something.textColor = UIColor(displayP3Red: 148/255, green: 148/255, blue: 148/255, alpha: 1)
               
               cell.something.layer.cornerRadius = 5
               cell.something.layer.masksToBounds = true
      
        cell.something.text = collectiontags[collection.tag][indexPath.section]

        
           
       

        return cell
  
       
            
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collection.cellForItem(at: indexPath) as! polygonprofileCollection
        
        if maintapnumber < 3 && cell.something.backgroundColor == UIColor(displayP3Red: 238/255, green: 238/255, blue: 238/255, alpha: 1) {
            maintapnumber = maintapnumber + 1
            cell.something.backgroundColor = UIColor(displayP3Red: 162/255, green: 32/255, blue: 58/255, alpha: 1)
            cell.something.textColor = UIColor.white
            
            
        } else if cell.something.backgroundColor == UIColor(displayP3Red: 162/255, green: 32/255, blue: 58/255, alpha: 1){
            maintapnumber = maintapnumber - 1
            cell.something.backgroundColor = UIColor(displayP3Red: 238/255, green: 238/255, blue: 238/255, alpha: 1)
            cell.something.textColor = UIColor(displayP3Red: 148/255, green: 148/255, blue: 148/255, alpha: 1)
        }
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    

    

}
