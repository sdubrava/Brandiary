//
//  QuestCell.swift
//  Brandiary
//
//  Created by young on 03/08/2019.
//  Copyright © 2019 young. All rights reserved.
//

import UIKit

class QuestCell: UITableViewCell {

    @IBOutlet weak var reward: UILabel!
    @IBOutlet weak var xnumber: UILabel!
    @IBOutlet weak var wall: UILabel!
    @IBOutlet weak var thunder: UIButton!
    @IBOutlet weak var progressbar: UIProgressView!
    @IBOutlet weak var progresslabel: UILabel!
    @IBOutlet weak var Upload: UILabel!
    @IBOutlet weak var cellview: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
