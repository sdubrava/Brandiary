//
//  ReportCell.swift
//  Brandiary
//
//  Created by young on 13/10/2019.
//  Copyright © 2019 young. All rights reserved.
//

import UIKit

class ReportCell: UITableViewCell {

    @IBOutlet weak var celllabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected {
                  DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
                      self.contentView.backgroundColor = UIColor.white
                  })
               self.contentView.backgroundColor = UIColor(displayP3Red: 238/255, green: 238/255, blue: 238/255, alpha: 1)
               }

    }

}
