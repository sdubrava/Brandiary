//
//  AlarmheaderCell.swift
//  Brandiary
//
//  Created by young on 14/12/2019.
//  Copyright © 2019 young. All rights reserved.
//

import UIKit

class AlarmheaderCell: UITableViewCell {

    @IBOutlet weak var requestnumber: UILabel!
    @IBOutlet weak var approvelabel: UILabel!
    @IBOutlet weak var followlabel: UILabel!
    @IBOutlet weak var profileimg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        requestnumber.layer.cornerRadius = 7
        requestnumber.layer.masksToBounds = true
        self.contentView.layer.borderWidth = 1
        self.contentView.layer.borderColor = UIColor(displayP3Red: 217/255, green: 217/255, blue: 217/255, alpha: 217/255).cgColor
        self.contentView.layer.cornerRadius = 10
        self.contentView.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
