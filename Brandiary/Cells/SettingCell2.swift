//
//  SettingCell2.swift
//  Brandiary
//
//  Created by young on 17/10/2019.
//  Copyright © 2019 young. All rights reserved.
//

import UIKit

class SettingCell2: UITableViewCell {

    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var hashtag: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var profile: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0, execute: {
                self.contentView.backgroundColor = UIColor.white
            })
             let colorView = UIView()
                      colorView.backgroundColor = UIColor(displayP3Red: 238/255, green: 238/255, blue: 238/255, alpha: 1)

                      self.selectedBackgroundView = colorView
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
