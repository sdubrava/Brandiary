//
//  TableViewCell.swift
//  Brandiary
//
//  Created by young on 27/10/2019.
//  Copyright © 2019 young. All rights reserved.
//

import UIKit

class ExchangeCell2: UITableViewCell {

    @IBOutlet weak var cellview: UIView!
    @IBOutlet weak var Upgradebtn: GradientButton!
    @IBOutlet weak var thunderpercent: UILabel!
    @IBOutlet weak var thunder2: UIImageView!
    @IBOutlet weak var equal: UILabel!
    @IBOutlet weak var Xnumber: UILabel!
    @IBOutlet weak var myitemnumber: UILabel!
    @IBOutlet weak var thunder1: UIImageView!
    @IBOutlet weak var thunderview: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
