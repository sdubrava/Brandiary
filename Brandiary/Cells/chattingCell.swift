//
//  chattingCell.swift
//  Brandiary
//
//  Created by young on 27/07/2019.
//  Copyright © 2019 young. All rights reserved.
//

import UIKit

class chattingCell: UITableViewCell {

    @IBOutlet weak var newmessage: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var say: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var profile: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
