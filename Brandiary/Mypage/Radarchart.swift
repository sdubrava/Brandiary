//
//  Radarchart.swift
//  Brandiary
//
//  Created by young on 10/08/2019.
//  Copyright © 2019 young. All rights reserved.
//

import UIKit
import TKRadarChart


class Radarchart: UIViewController,TKRadarChartDataSource, TKRadarChartDelegate, UITableViewDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let text = "# startup"
//
//        let attributedString = NSMutableAttributedString(string: text)
//
//
//
//        attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.blue, range: (text as NSString).range(of:"#"))




        
        let w = view.bounds.width
        let chart = TKRadarChart(frame: CGRect(x: 0, y: 0, width: w, height: w))
        chart.configuration.radius = w/3
        chart.dataSource = self
        chart.delegate = self
        chart.reloadData()
        chart.configuration.showPoint = false
        chart.configuration.showBorder = true
        chart.configuration.fillArea = false
        chart.configuration.lindWidth = 0
        chart.configuration.borderWidth = 1
        chart.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(chart)
        
        
        chart.widthAnchor.constraint(equalToConstant: w).isActive = true
        chart.heightAnchor.constraint(equalToConstant: w).isActive = true
        chart.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        chart.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }
    
    func numberOfStepForRadarChart(_ radarChart: TKRadarChart) -> Int {
        return 6
    }
    func numberOfRowForRadarChart(_ radarChart: TKRadarChart) -> Int {
        return 8
    }
    func numberOfSectionForRadarChart(_ radarChart: TKRadarChart) -> Int {
        return 1    }
    
    func titleOfRowForRadarChart(_ radarChart: TKRadarChart, row: Int) -> String {
        return "# "
    }
    
    func valueOfSectionForRadarChart(withRow row: Int, section: Int) -> CGFloat {
        if section == 0 {
            return CGFloat(max(min(row + 1, 4), 3))
        } else {
            return 3
        }
    }
    
    func colorOfTitleForRadarChart(_ radarChart: TKRadarChart) -> UIColor {
        return UIColor.lightGray
    }
    
    func colorOfLineForRadarChart(_ radarChart: TKRadarChart) -> UIColor {
        return UIColor(displayP3Red: 197/255, green: 197/255, blue: 197/255, alpha: 1)
    }
    
    func colorOfFillStepForRadarChart(_ radarChart: TKRadarChart, step: Int) -> UIColor {
        switch step {
        case 1:
            return UIColor.white
        case 2:
            return UIColor.white
        case 3:
            return UIColor.white
        case 4:
            return UIColor.white
        default:
            return UIColor.white
        }
    }
    
    func colorOfSectionFillForRadarChart(_ radarChart: TKRadarChart, section: Int) -> UIColor {
        if section == 0 {
            return UIColor(red:162/255,  green:32/255,  blue:58/255, alpha:0.4)
        } else {
            return UIColor(red:162/255,  green:32/255,  blue:58/255, alpha:0.4)
        }
    }
    
    func colorOfSectionBorderForRadarChart(_ radarChart: TKRadarChart, section: Int) -> UIColor {
        if section == 0 {
            return UIColor(red:162/255,  green:32/255,  blue:58/255, alpha:1)
        } else {
            return UIColor(red:255/255,  green:255/255,  blue:255/255, alpha:1)
        }
    }
    
    func fontOfTitleForRadarChart(_ radarChart: TKRadarChart) -> UIFont {
        return UIFont.systemFont(ofSize: 12)
}
}





