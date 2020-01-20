//
//  WritefirstCell.swift
//  Brandiary
//
//  Created by young on 2019/12/27.
//  Copyright © 2019 young. All rights reserved.
//

import UIKit

class WritefirstCell: UITableViewCell{

    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var textview: UITextView!
    @IBOutlet weak var profile: UIImageView!
    @IBOutlet weak var hashtag: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var line2: UILabel!
    @IBOutlet weak var line1: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()

    }



    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)


    }

}
extension WritefirstCell
    {
        func setCollection <D: UICollectionViewDataSource & UICollectionViewDelegate> (_ DatasourceDelegate : D, forRow row: Int) {
            
            collection.delegate = DatasourceDelegate
            collection.dataSource = DatasourceDelegate
            collection.reloadData()
            
        }

}

