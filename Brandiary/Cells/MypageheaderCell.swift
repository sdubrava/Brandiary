//
//  MypageheaderCell.swift
//  Brandiary
//
//  Created by young on 2019/12/29.
//  Copyright © 2019 young. All rights reserved.
//

import UIKit

class MypageheaderCell: UITableViewCell {
    
    private var tap = 0

    @IBOutlet weak var twoviewbtn: UIButton!
    @IBOutlet weak var informbtn: UIButton!
    @IBOutlet weak var radarbtn: UIButton!
    @IBOutlet weak var stack: UIStackView!
    @IBOutlet weak var whitelabel: UILabel!
    @IBOutlet weak var editprofilebtn: UIButton!
    @IBOutlet weak var followers: UILabel!
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var ranking: UILabel!
    @IBOutlet weak var rankingnumber: UILabel!
    @IBOutlet weak var followersnumber: UILabel!
    @IBOutlet weak var scorenumber: UILabel!
    @IBOutlet weak var hashtag: UILabel!
    @IBOutlet weak var profile: UIImageView!
    @IBOutlet weak var profileview: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
           twoviewbtn.roundedButton()
             informbtn.roundedButton()
             radarbtn.roundedButton()
             
             hashtag.text = "#Designer #UI/UX #Brandiary"
             let url = URL(string: UserDefaults.standard.string(forKey: "profile") ?? "")
             if url != nil{
             profile.kf.setImage(with: url)
             }
             
             editprofilebtn.layer.cornerRadius = 5
             editprofilebtn.layer.masksToBounds = true
             editprofilebtn.layer.borderWidth = 1
             editprofilebtn.layer.borderColor = UIColor(displayP3Red: 174/255, green: 174/255, blue: 174/255, alpha: 1).cgColor
        
        radarbtn.backgroundColor = UIColor.white
              informbtn.backgroundColor = UIColor(displayP3Red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
              twoviewbtn.backgroundColor = UIColor(displayP3Red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
             
              
              radarbtn.tintColor = UIColor.black
              informbtn.tintColor = UIColor.darkGray
              twoviewbtn.tintColor = UIColor.darkGray
          
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //액션이 있어야 스토리보드상에서 show할 때 에러가 안 생긴다.
    @IBAction func editprofile(_ sender: Any) {
    }
    @IBAction func twoview(_ sender: Any) {
           radarbtn.backgroundColor = UIColor(displayP3Red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
           informbtn.backgroundColor = UIColor(displayP3Red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
           twoviewbtn.backgroundColor = UIColor.white
           
           radarbtn.tintColor = UIColor.darkGray
           informbtn.tintColor = UIColor.darkGray
           twoviewbtn.tintColor = UIColor.black
           

            informbtn.setImage(UIImage(named : "informNon@3x.png"), for: .normal)
             radarbtn.setImage(UIImage(named : "myoctagonNon@3x.png"), for: .normal)
           if tap == 0 {
               NotificationCenter.default.post(name: NSNotification.Name("twoviewcollection"), object: nil)

               tap = 1
            twoviewbtn.setImage(UIImage(named: "bookcardNon@3x.png"), for: .normal)
                         twoviewbtn.tintColor = UIColor.black
               
           }
           else if tap == 1 {
            NotificationCenter.default.post(name: NSNotification.Name("twoviewmain"), object: nil)
    twoviewbtn.setImage(UIImage(named: "bookgalleryOn@3x.png"), for: .normal)

         
               
               tap = 0
           }
       
 
       }
       @IBAction func inform(_ sender: Any) {
        NotificationCenter.default.post(name: NSNotification.Name("inform"), object: nil)
           radarbtn.backgroundColor = UIColor(displayP3Red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
           informbtn.backgroundColor = UIColor.white
           twoviewbtn.backgroundColor = UIColor(displayP3Red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
           
           radarbtn.tintColor = UIColor.darkGray
           informbtn.tintColor = UIColor.black
           twoviewbtn.tintColor = UIColor.darkGray

                 informbtn.setImage(UIImage(named : "informOn@3x.png"), for: .normal)
             radarbtn.setImage(UIImage(named : "myoctagonNon@3x.png"), for: .normal)
            twoviewbtn.setImage(UIImage(named: "bookgalleryNon@3x.png"), for: .normal)
       }
       @IBAction func radar(_ sender: Any) {
           NotificationCenter.default.post(name: NSNotification.Name("radar"), object: nil)
           radarbtn.backgroundColor = UIColor.white
           informbtn.backgroundColor = UIColor(displayP3Red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
           twoviewbtn.backgroundColor = UIColor(displayP3Red: 245/255, green: 245/255, blue: 245/255, alpha: 1)

           radarbtn.tintColor = UIColor.black
           informbtn.tintColor = UIColor.darkGray
           twoviewbtn.tintColor = UIColor.darkGray

             radarbtn.setImage(UIImage(named : "myoctagonOn@3x.png"), for: .normal)
            informbtn.setImage(UIImage(named : "informNon@3x.png"), for: .normal)
            twoviewbtn.setImage(UIImage(named: "bookgalleryNon@3x.png"), for: .normal)
 
       }

}
