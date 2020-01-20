//
//  MainheaderCell.swift
//  Brandiary
//
//  Created by young on 22/07/2019.
//  Copyright © 2019 young. All rights reserved.
//

import UIKit

class MainheaderCell: UITableViewCell,UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        table.delegate = self
        table.dataSource = self
        height.constant = 90
    }

    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var morebtn: UIButton!
    @IBOutlet weak var caption: UILabel!
    @IBOutlet weak var profile: UIImageView!
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var hashtag: UILabel!
    @IBOutlet weak var dot: UIButton!
    
    @IBOutlet weak var height: NSLayoutConstraint!
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
       
}
}
