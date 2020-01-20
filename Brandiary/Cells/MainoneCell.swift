//
//  MainoneCell.swift
//  Brandiary
//
//  Created by young on 2020/01/01.
//  Copyright © 2020 young. All rights reserved.
//

import UIKit
import DGCollectionViewLeftAlignFlowLayout

class MainoneCell: UITableViewCell,UITableViewDataSource,UITableViewDelegate,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    var posts: [Post]?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let labelwidth = posthashtagarray[indexPath.item].widthOfString(usingFont: UIFont.systemFont(ofSize: 10))
        return CGSize(width: labelwidth+labelwidth, height: 25)
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
        8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = table.dequeueReusableCell(withIdentifier: "WriteCell") as! WriteCell
             
             if indexPath.row == 1 {
                 cell.img.image = UIImage(named: "personNon.png")
                 cell.label.text = "with chacha"
             }
             return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        45
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
          let cell = collection.dequeueReusableCell(withReuseIdentifier: "polygonprofileCollection", for: indexPath) as! polygonprofileCollection
              cell.something.backgroundColor = UIColor(displayP3Red: 238/255, green: 238/255, blue: 238/255, alpha: 1)
                     cell.something.textColor = UIColor(displayP3Red: 148/255, green: 148/255, blue: 148/255, alpha: 1)
                     
                     cell.something.layer.cornerRadius = 5
                     cell.something.layer.masksToBounds = true
              
//              cell.something.text = collectiontags[collection.tag][indexPath.item]
        
        return cell
    }

    @IBOutlet weak var captionheight: NSLayoutConstraint!
    @IBOutlet weak var selecttime: UILabel!
    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var boosterbtn: UIButton!
    @IBOutlet weak var selectlabel: UILabel!
    @IBOutlet weak var sharebtn: UIButton!
    @IBOutlet weak var imgnumber: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var hashtag: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var profile: UIImageView!
    @IBOutlet weak var dotbtn: UIButton!
    @IBOutlet weak var morebtn: UIButton!
    @IBOutlet weak var caption: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
       collection.delegate = self
        collection.dataSource = self
        table.delegate = self
        table.dataSource = self
        selectlabel.layer.cornerRadius = 8
        selectlabel.layer.borderColor = UIColor(displayP3Red: 197/255, green: 197/255, blue: 197/255, alpha: 1).cgColor
        selectlabel.layer.masksToBounds = true
        selectlabel.layer.borderWidth = 1
        collection.collectionViewLayout = DGCollectionViewLeftAlignFlowLayout()
        self.fetchPosts()
    }
    
    func fetchPosts()
        {
            self.posts = Post.fetchPosts()
            self.collection.reloadData()
        }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var post: Post! {
           didSet {
               self.updateUI()
           }
       }
       

       func updateUI()
       {
           let receiveurl = post.createdBy.profileImage
           let url = URL(string: receiveurl ?? "https://firebasestorage.googleapis.com/v0/b/brandiary-fad4e.appspot.com/o/photo%403x.png?alt=media&token=600606e4-b3d5-4963-ae42-443e300eb22a")
                               if url != nil{
                                   profile.kf.setImage(with: url)
                               }
           let receive = post.createdBy.hashtag
           profile.layer.cornerRadius = 3
           profile.layer.masksToBounds = true
           
           name.text = post.createdBy.username
           hashtag.text = "\(receive?[0] ?? "") \(receive?[1] ?? "") \(receive?[2] ?? "")"
           caption.text = post.caption
         self.img.image = post.image[0]
           
           
       }
       

}
