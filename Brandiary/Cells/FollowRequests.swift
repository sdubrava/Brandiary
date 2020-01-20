//
//  FollowRequests.swift
//  Brandiary
//
//  Created by young on 14/12/2019.
//  Copyright © 2019 young. All rights reserved.
//

import UIKit

class FollowRequests: UITableViewCell {

    @IBOutlet weak var xbtn: UIButton!
    @IBOutlet weak var obtn: UIButton!
    @IBOutlet weak var hashtag: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var profile: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        obtn.layer.cornerRadius = 8
        obtn.layer.masksToBounds = true
        xbtn.layer.cornerRadius = 8
        xbtn.layer.masksToBounds = true
        xbtn.layer.borderColor = UIColor(displayP3Red: 148/255, green: 148/255, blue: 148/255, alpha: 1).cgColor
        xbtn.layer.borderWidth = 1
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
