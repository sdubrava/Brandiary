//
//  SelecttagFooterCell.swift
//  Brandiary
//
//  Created by young on 16/10/2019.
//  Copyright © 2019 young. All rights reserved.
//

import UIKit
import DGCollectionViewLeftAlignFlowLayout

var selecttapnumber = 0

class SelecttagFooterCell: UITableViewCell,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        8
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        if indexPath.item == 0{
            let l = "#asfdsafsdafsadfsadfsadf"
            let labelwidth = l.widthOfString(usingFont: UIFont.systemFont(ofSize: 10))
            return CGSize(width: labelwidth+60, height: 25)
        }else if indexPath.item == 1{
            let l = "#startup"
            let labelwidth = l.widthOfString(usingFont: UIFont.systemFont(ofSize: 10))
            return CGSize(width: labelwidth+30, height: 25)
        }else{
            let l = "#Brandiary"
            let labelwidth = l.widthOfString(usingFont: UIFont.systemFont(ofSize: 10))
            return CGSize(width: labelwidth+40, height: 25)
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
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         let cell = collection.dequeueReusableCell(withReuseIdentifier: "polygonprofileCollection", for: indexPath) as! polygonprofileCollection
        switch indexPath.item {
        case 0:
            cell.something.text = "#asfdsafsdafsadfsadfsadf"
            case 1:
            cell.something.text = "#startup"
        default:
            cell.something.text = "#Brandiary"
        }
        cell.something.backgroundColor = UIColor(displayP3Red: 238/255, green: 238/255, blue: 238/255, alpha: 1)
        cell.something.textColor = UIColor(displayP3Red: 148/255, green: 148/255, blue: 148/255, alpha: 1)
        
        cell.something.layer.cornerRadius = 5
        cell.something.layer.masksToBounds = true
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
          let cell = collection.cellForItem(at: indexPath) as! polygonprofileCollection
               
                   if selecttapnumber < 3 && cell.something.backgroundColor == UIColor(displayP3Red: 238/255, green: 238/255, blue: 238/255, alpha: 1) {
                     selecttapnumber = selecttapnumber + 1
        cell.something.backgroundColor = UIColor(displayP3Red: 162/255, green: 32/255, blue: 58/255, alpha: 1)
                     cell.something.textColor = UIColor.white
                    

                   } else if cell.something.backgroundColor == UIColor(displayP3Red: 162/255, green: 32/255, blue: 58/255, alpha: 1){
                     selecttapnumber = selecttapnumber - 1
                       cell.something.backgroundColor = UIColor(displayP3Red: 238/255, green: 238/255, blue: 238/255, alpha: 1)
                        cell.something.textColor = UIColor(displayP3Red: 148/255, green: 148/255, blue: 148/255, alpha: 1)
        }


    }

    

    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var nextbtn: UIButton!
  

    @IBOutlet weak var select: UILabel!
    override func awakeFromNib() {
   
        super.awakeFromNib()
        collection.delegate = self
        collection.dataSource = self
        collection.collectionViewLayout = DGCollectionViewLeftAlignFlowLayout()
        
    }

   
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension String {
func widthOfString(usingFont font: UIFont) -> CGFloat {
      let fontAttributes = [NSAttributedString.Key.font: font]
      let size = self.size(withAttributes: fontAttributes)
      return size.width
  }
}
