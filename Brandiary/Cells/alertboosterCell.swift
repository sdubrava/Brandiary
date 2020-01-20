//
//  alertboosterCell.swift
//  Brandiary
//
//  Created by young on 29/08/2019.
//  Copyright © 2019 young. All rights reserved.
//

import UIKit

class alertboosterCell: UITableViewCell {

    @IBOutlet weak var checkbox: UIImageView!
    @IBOutlet weak var xnumber: UILabel!
    @IBOutlet weak var booster: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
