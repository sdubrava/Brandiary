//
//  SelecttagCell.swift
//  Brandiary
//
//  Created by young on 16/10/2019.
//  Copyright © 2019 young. All rights reserved.
//

import UIKit

class SelecttagCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
  
    }

    @IBAction func bell(_ sender: Any) {
    }
    @IBOutlet weak var morebtn: UIButton!
    @IBOutlet weak var photonumber: UILabel!
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var caption: UILabel!
    @IBOutlet weak var tag3: PaddingLabel!
    @IBOutlet weak var tag2: PaddingLabel!
    @IBOutlet weak var tag1: PaddingLabel!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
