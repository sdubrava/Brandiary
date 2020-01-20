//
//  WritefooterCell.swift
//  Brandiary
//
//  Created by young on 2019/12/27.
//  Copyright © 2019 young. All rights reserved.
//

import UIKit

class WritefooterCell: UITableViewCell {

//    @IBOutlet weak var footertable: UITableView!
    override func awakeFromNib() {
        super.awakeFromNib()
//        footertable.delegate = self
//        footertable.dataSource = self
    }
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        2
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = footertable.dequeueReusableCell(withIdentifier: "WriteCellx") as! WriteCellx
//        return cell
//    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
//extension WritefooterCell
//    {
//        func setTable <D: UITableViewDelegate & UITableViewDataSource> (_ DatasourceDelegate : D, forRow row: Int) {
//
//            footertable.delegate = DatasourceDelegate
//            footertable.dataSource = DatasourceDelegate
//            footertable.reloadData()
//
//        }
//
//}
