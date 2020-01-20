//
//  WriteColletionCell.swift
//  Brandiary
//
//  Created by young on 30/08/2019.
//  Copyright © 2019 young. All rights reserved.
//

import UIKit

class WriteCollectionCell: UITableViewCell {
    
    

    @IBOutlet weak var collection: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
//이런 식으로 작성하면 다른 뷰에 콜렉션을 쓸 수 있음. write에서 씀
extension WriteCollectionCell
    {
        func setCollection <D: UICollectionViewDataSource & UICollectionViewDelegate> (_ DatasourceDelegate : D, forRow row: Int) {
            
            collection.delegate = DatasourceDelegate
            collection.dataSource = DatasourceDelegate
            collection.reloadData()
            
        }

}



