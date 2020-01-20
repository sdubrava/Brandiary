//
//  profilepolygonHeader.swift
//  Brandiary
//
//  Created by young on 31/10/2019.
//  Copyright © 2019 young. All rights reserved.
//

import UIKit

class profilepolygonHeader: UITableViewCell {

    
    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var youusedtag: UILabel!
    @IBOutlet weak var caption: UILabel!
    @IBOutlet weak var representtag: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }

}

extension profilepolygonHeader
    {
        func setCollection <D: UICollectionViewDataSource & UICollectionViewDelegate> (_ DatasourceDelegate : D, forRow row: Int) {
            
            collection.delegate = DatasourceDelegate
            collection.dataSource = DatasourceDelegate
            
            collection.reloadData()
            
            
        }

}
