//
//  CommunityViewController.swift
//  Brandiary
//
//  Created by young on 10/08/2019.
//  Copyright © 2019 young. All rights reserved.
//

import UIKit

class CommunityViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = table.dequeueReusableCell(withIdentifier: "CommunityCell") as! CommunityCell
        
        cell.cellview.layer.borderWidth = 1
        cell.cellview.layer.borderColor = UIColor(displayP3Red: 245/255, green: 245/255, blue: 245/255, alpha: 1).cgColor
        
        return cell
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = table.dequeueReusableCell(withIdentifier: "CommunityRadarfooter") as! CommunityRadarfooterCell
        return footerView
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = table.dequeueReusableCell(withIdentifier: "CommunityheaderCell") as! CommunityheaderCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 30
    }
    
    

    @IBOutlet weak var anfdmavy: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    

    @IBOutlet weak var table: UITableView!
    

}
