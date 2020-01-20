//
//  CommunityCell.swift
//  Brandiary
//
//  Created by young on 10/08/2019.
//  Copyright © 2019 young. All rights reserved.
//

import UIKit

class CommunityCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var date: UILabel!
  
    @IBOutlet weak var hashtag: UILabel!
    @IBOutlet weak var profile: UIImageView!
    @IBOutlet weak var cellview: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
