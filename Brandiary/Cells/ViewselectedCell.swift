//
//  ViewselectedCell.swift
//  Brandiary
//
//  Created by young on 05/10/2019.
//  Copyright © 2019 young. All rights reserved.
//

import UIKit

class ViewselectedCell: UITableViewCell {

    @IBOutlet weak var number: UILabel!
    @IBOutlet weak var tagprogress: UIProgressView!
    @IBOutlet weak var hashtag: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
