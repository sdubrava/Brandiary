//
//  bookmarktableCell.swift
//  Brandiary
//
//  Created by young on 06/08/2019.
//  Copyright © 2019 young. All rights reserved.
//

import UIKit

class bookmarktableCell: UITableViewCell {

   
    @IBOutlet weak var mainimg: UIImageView!
    
    @IBOutlet weak var commentnumber: UILabel!
    @IBOutlet weak var commentimg: UIImageView!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var caption: UILabel!
    @IBOutlet weak var line: UILabel!
    @IBOutlet weak var hashtag: UILabel!
    @IBOutlet weak var name: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
