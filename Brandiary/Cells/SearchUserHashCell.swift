//
//  SearchUserHashCell.swift
//  Brandiary
//
//  Created by young on 04/12/2019.
//  Copyright © 2019 young. All rights reserved.
//

import UIKit

class SearchUserHashCell: UITableViewCell {

    @IBOutlet weak var userusing: UILabel!
    @IBOutlet weak var number: UILabel!
    @IBOutlet weak var hashlabel: UILabel!
    @IBOutlet weak var Hashimg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
