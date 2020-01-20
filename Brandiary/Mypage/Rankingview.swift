//
//  Rankingview.swift
//  Brandiary
//
//  Created by young on 04/10/2019.
//  Copyright © 2019 young. All rights reserved.
//

import UIKit

class Rankingview: UIViewController,UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "RankingViewHeaderCell") as! RankingViewHeaderCell
        
        cell.tagscore.text = "1"
        cell.myscore.text = "10000"
        cell.rankingin.text = "100%"
        
        cell.tagscore.textColor = #colorLiteral(red: 0.3536440134, green: 0.3536530137, blue: 0.3536481857, alpha: 1)
         cell.hashtag.textColor = #colorLiteral(red: 0.3536440134, green: 0.3536530137, blue: 0.3536481857, alpha: 1)
         cell.myscore.textColor = #colorLiteral(red: 0.3536440134, green: 0.3536530137, blue: 0.3536481857, alpha: 1)
         cell.rankingin.textColor = #colorLiteral(red: 0.3536440134, green: 0.3536530137, blue: 0.3536481857, alpha: 1)
        return cell
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = table.dequeueReusableCell(withIdentifier: "RankingViewHeaderCell") as! RankingViewHeaderCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 55
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    

    @IBOutlet weak var table: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        table.isScrollEnabled = false

        
    }
    

}
