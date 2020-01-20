//
//  CommunityRadarViewController.swift
//  Brandiary
//
//  Created by young on 10/08/2019.
//  Copyright © 2019 young. All rights reserved.
//
import UIKit
import DDSpiderChart

class CommunityRadarViewController : UIViewController,UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = table.dequeueReusableCell(withIdentifier: "CommunityCell") as! CommunityCell
        
        cell.cellview.layer.borderWidth = 1
        cell.cellview.layer.borderColor = UIColor(red:222/255, green:225/255, blue:227/255, alpha: 1).cgColor
        cell.cellview.layer.cornerRadius = 5
        cell.cellview.layer.masksToBounds = true
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = table.dequeueReusableCell(withIdentifier: "CommunityRadarfooter") as! CommunityRadarfooterCell
        return footerView
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 0
    }
    
    
    

    
    


    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var spiderChartView: DDSpiderChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        spiderChartView.color = #colorLiteral(red: 0.8797392845, green: 0.8797599673, blue: 0.8797488809, alpha: 1)
        spiderChartView.axes = ["Young", "IosDeveloper", "Fomagran"].map { attributedAxisLabelSample1($0) }
        spiderChartView.addDataSet(values: [0.6, 0.8, 1.0], color: .yellow)
      
    }
    

    
    // Custom font with custom size & color example
    func attributedAxisLabelSample1(_ label: String) -> NSAttributedString {
        let attributedString = NSMutableAttributedString()
        attributedString.append(NSAttributedString(string: label, attributes: [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: UIFont(name: "AvenirNextCondensed-Bold", size: 16)!]))
        return attributedString
    }
    
    func attributedAxisLabelSample2(_ label: String) -> NSAttributedString {
        let attributedString = NSMutableAttributedString()
        attributedString.append(NSAttributedString(string: label, attributes: [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont(name: "AvenirNextCondensed-Bold", size: 16)!]))
        return attributedString
    }
    
  
}
