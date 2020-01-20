//
//  SearchTop100HashCell.swift
//  Brandiary
//
//  Created by young on 31/08/2019.
//  Copyright © 2019 young. All rights reserved.
//

import UIKit

class SearchTop100HashCell: UITableViewCell {

    @IBOutlet weak var scorenumber: UILabel!
    @IBOutlet weak var hashtag: UILabel!
    
    @IBOutlet weak var upordownnumber: UILabel!
    @IBOutlet weak var number: UILabel!
    
    @IBOutlet weak var userusing: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
