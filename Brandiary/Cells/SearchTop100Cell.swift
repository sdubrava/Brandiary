//
//  SearchTop100Cell.swift
//  Brandiary
//
//  Created by young on 31/08/2019.
//  Copyright © 2019 young. All rights reserved.
//

import UIKit

class SearchTop100Cell: UITableViewCell {


    @IBOutlet weak var followbtn: UIButton!
    @IBOutlet weak var hashtag: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var photo: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        followbtn.layer.cornerRadius = 5
        followbtn.layer.masksToBounds = true
        followbtn.layer.borderWidth = 1
        followbtn.layer.borderColor = #colorLiteral(red: 0.7031922936, green: 0.2011226714, blue: 0.2912405133, alpha: 1)

        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
