//
//  RankingViewCell.swift
//  Brandiary
//
//  Created by young on 05/10/2019.
//  Copyright © 2019 young. All rights reserved.
//

import UIKit

class RankingViewCell: UITableViewCell {


    @IBOutlet weak var tagscore: UILabel!

  
    @IBOutlet weak var myscore: UILabel!
    
    
    @IBOutlet weak var rankingin: UILabel!
    @IBOutlet weak var tag1: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
