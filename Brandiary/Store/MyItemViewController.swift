//
//  MyItemViewController.swift
//  
//
//  Created by young on 02/08/2019.
//

import UIKit

var BoosterColor = UIColor()
var BoosterImage = UIImage()
var BoosterText = String()
var BoosterCaption = String()
var BoosterSource = String()

class MyItemViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collection.dequeueReusableCell(withReuseIdentifier: "myitemcell", for: indexPath) as! MyItemcell
        
        
        cell.contentView.layer.borderWidth = 3
        cell.contentView.layer.borderColor = UIColor(red:222/255, green:225/255, blue:227/255, alpha: 1).cgColor
        cell.contentView.layer.cornerRadius = 10
        cell.contentView.layer.masksToBounds = true
        
        switch indexPath.row {
        case 0:
            cell.booster.text = "Red Booster"
            cell.thunder.image = UIImage(named: "boostR@3x.png")
            cell.booster.textColor = UIColor(displayP3Red: 186/255, green: 53/255, blue: 53/255, alpha: 1)
            case 1:
                cell.booster.text = "Orange Booster"
                      cell.thunder.image = UIImage(named: "o@3x.png")
                      cell.booster.textColor = UIColor(displayP3Red: 228/255, green: 126/255, blue: 58/255, alpha: 1)
            case 2:
                cell.booster.text = "Yellow Booster"
                      cell.thunder.image = UIImage(named: "y@3x.png")
                      cell.booster.textColor = UIColor(displayP3Red: 244/255, green: 206/255, blue: 57/255, alpha: 1)
            case 3:
                cell.booster.text = "Purple Booster"
                      cell.thunder.image = UIImage(named: "p@3x.png")
                      cell.booster.textColor = UIColor(displayP3Red: 92/255, green: 66/255, blue: 183/255, alpha: 1)
            case 4:
                cell.booster.text = "Blue Booster"
                      cell.thunder.image = UIImage(named: "bluethunder.png")
                      cell.booster.textColor = UIColor(displayP3Red: 87/255, green: 155/255, blue: 207/255, alpha: 1)
            case 5:
                cell.booster.text = "Green Booster"
                      cell.thunder.image = UIImage(named: "g@3x.png")
                      cell.booster.textColor = UIColor(displayP3Red: 116/255, green: 161/255, blue: 69/255, alpha: 1)
        
        default:
            print("df")
        }
        
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            BoosterSource = "Source : Upgrade"
            BoosterCaption = "If you use this item\n to your posts,\n 100k people can choose tags\n in your posts"
            BoosterText = "Red Booster"
            BoosterColor = UIColor(displayP3Red: 186/255, green: 53/255, blue: 53/255, alpha: 1)
            BoosterImage = UIImage(named: "boostR@3x.png")!
            let alertservice = BoosteralertService()
            let alert = alertservice.alert()
            present(alert,animated: true,completion: nil)

        }
        else if indexPath.row == 1{
            BoosterSource = "Source : Upgrade"
            BoosterCaption = "If you use this item\n to your posts,\n 15k people can choose tags\n in your posts"
            BoosterText = "Orange Booster"
            BoosterColor = UIColor(displayP3Red: 228/255, green: 126/255, blue: 58/255, alpha: 1)
                       BoosterImage = UIImage(named: "o@3x.png")!
            let alertservice = BoosteralertService()
            let alert = alertservice.alert()
            present(alert,animated: true,completion: nil)
           
        }
        else if indexPath.row == 2{
            BoosterSource = "Source : Upgrade"
            BoosterCaption = "If you use this item\n to your posts,\n 2.5k people can choose tags\n in your posts"
            BoosterText = "Yellow Booster"
            BoosterColor = UIColor(displayP3Red: 244/255, green: 206/255, blue: 57/255, alpha: 1)
                       BoosterImage = UIImage(named: "y@3x.png")!
                   let alertservice = BoosteralertService()
                   let alert = alertservice.alert()
                   present(alert,animated: true,completion: nil)
                  
               }
        else if indexPath.row == 3{
            BoosterSource = "Source : Store, Upgrade"
            BoosterCaption = "If you use this item\n to your posts,\n 400 people can choose tags\n in your posts"
            BoosterText = "Purple Booster"
            BoosterColor = UIColor(displayP3Red: 92/255, green: 66/255, blue: 183/255, alpha: 1)
                       BoosterImage = UIImage(named: "p@3x.png")!
                   let alertservice = BoosteralertService()
                   let alert = alertservice.alert()
                   present(alert,animated: true,completion: nil)
                  
               }
        else if indexPath.row == 4{
            BoosterSource = "Source : Store, Upgrade"
            BoosterCaption = "If you use this item\n to your posts,\n 60 people can choose tags\n in your posts"
            BoosterText = "Blue Booster"
            BoosterColor = UIColor(displayP3Red: 87/255, green: 155/255, blue: 207/255, alpha: 1)
                       BoosterImage = UIImage(named: "bluethunder.png")!
                   let alertservice = BoosteralertService()
                   let alert = alertservice.alert()
                   present(alert,animated: true,completion: nil)
                  
               }
        else if indexPath.row == 5{
            BoosterSource = "Source : Store"
            BoosterCaption = "If you use this item\n to your posts,\n 10 people can choose tags\n in your posts"
            BoosterText = "Green Booster"
            BoosterColor = UIColor(displayP3Red: 116/255, green: 161/255, blue: 69/255, alpha: 1)
                       BoosterImage = UIImage(named: "g@3x.png")!
                   let alertservice = BoosteralertService()
                   let alert = alertservice.alert()
                   present(alert,animated: true,completion: nil)
                  
               }
    }
    

    
    @IBOutlet weak var collection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collection.isScrollEnabled = false
    }
    

}



extension MyItemViewController : UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
            }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: (self.view.frame.size.width-25)/2, height: (self.view.frame.size.width-25)/2-10)
    }


    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}

