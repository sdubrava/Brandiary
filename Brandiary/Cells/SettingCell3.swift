//
//  SettingCell3.swift
//  Brandiary
//
//  Created by young on 17/10/2019.
//  Copyright © 2019 young. All rights reserved.
//

import UIKit

class SettingCell3: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        followbtn.layer.cornerRadius = 8
        followbtn.layer.masksToBounds = true
        followbtn.layer.borderColor = #colorLiteral(red: 0.7031922936, green: 0.2011226714, blue: 0.2912405133, alpha: 1)
        followbtn.layer.borderWidth = 1
    }
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var followbtn: UIButton!
    @IBAction func followbtn(_ sender: Any) {
    }
    @IBOutlet weak var hashtag: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var profile: UIImageView!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
