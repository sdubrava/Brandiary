//
//  WriteUserCell.swift
//  Brandiary
//
//  Created by young on 21/09/2019.
//  Copyright © 2019 young. All rights reserved.
//

import UIKit

class WriteUserCell: UITableViewCell {

    @IBOutlet weak var hashtag: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var profile: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
         
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
