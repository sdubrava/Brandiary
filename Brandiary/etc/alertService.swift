//
//  alertService.swift
//  Brandiary
//
//  Created by young on 29/08/2019.
//  Copyright © 2019 young. All rights reserved.
//

import UIKit

class alertService {

    func alert() ->alertViewController {
        let storyboard = UIStoryboard(name: "alertstoryboard", bundle: .main)
        let alert = storyboard.instantiateViewController(withIdentifier: "alertViewController") as! alertViewController
        
        return alert
    }
    
    func alert1() ->dotViewController {
          let storyboard = UIStoryboard(name: "alertstoryboard", bundle: .main)
          let alert = storyboard.instantiateViewController(withIdentifier: "dotViewController") as! dotViewController
          
          return alert
      }
    
    func Reporttable() ->ReportTableViewController {
        let storyboard = UIStoryboard(name: "alertstoryboard", bundle: .main)
        let alert = storyboard.instantiateViewController(withIdentifier: "ReportTableViewController") as! ReportTableViewController
        
        return alert
    }
    
    func areyousure()->AreyousureViewController {
        let storyboard = UIStoryboard(name: "alertstoryboard", bundle: .main)
        let alert = storyboard.instantiateViewController(withIdentifier: "AreyousureViewController") as! AreyousureViewController
        
        return alert
    }

}
