//
//  ReportCell2.swift
//  Brandiary
//
//  Created by young on 2020/01/05.
//  Copyright © 2020 young. All rights reserved.
//

import UIKit

class ReportCell2: UITableViewCell {

    @IBOutlet weak var lbl: UILabel!
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
