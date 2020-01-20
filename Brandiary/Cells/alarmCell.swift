//
//  alarmCell.swift
//  Brandiary
//
//  Created by young on 27/07/2019.
//  Copyright © 2019 young. All rights reserved.
//

import UIKit

class alarmCell: UITableViewCell {
    
    @IBOutlet weak var profile: UIImageView!
    
    @IBOutlet weak var alarm1: UILabel!
    
    
    @IBOutlet weak var photo: UIImageView!
    
    var alarm: alarmstruct! {
        didSet {
            self.updateUI()
        }
    }
     override func awakeFromNib() {
          let wholeStr1 = "aaaaaaaaaaaaaaaaaaaa taged you on his post. 30mins ago"
       
    let attributedStr = NSMutableAttributedString(string: wholeStr1)

    // text의 range 중에서 "Bonus"라는 글자는 UIColor를 blue로 변경
        attributedStr.addAttribute(.font, value: UIFont.systemFont(ofSize: 14),range: (wholeStr1 as NSString).range(of: "taged you on his post."))
    // text의 range 중에서 "Point"라는 글자는 UIColor를 orange로 변경
    attributedStr.addAttribute(.foregroundColor, value: UIColor(displayP3Red: 163/255, green: 163/255, blue: 163/255, alpha: 1), range: (wholeStr1 as NSString).range(of: "30mins ago"))

    // 설정이 적용된 text를 label의 attributedText에 저장
    alarm1.attributedText = attributedStr




        

    }

    func updateUI()
    {

        self.profile.image = alarm.profileimage
        self.alarm1.text = alarm.mainlabel
        self.photo.image = alarm.photo
    }
    
    
    
    
}
