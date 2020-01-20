//
//  MypageMainCell.swift
//  Brandiary
//
//  Created by young on 21/09/2019.
//  Copyright © 2019 young. All rights reserved.
//

import UIKit

class MypageMainCell: UITableViewCell {

    @IBOutlet weak var postimage: UIImageView!
    @IBOutlet weak var more: UIButton!
    @IBOutlet weak var caption: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
