//
//  BoosteralertService.swift
//  Brandiary
//
//  Created by young on 21/09/2019.
//  Copyright © 2019 young. All rights reserved.
//

import UIKit

class BoosteralertService: UIViewController {

    func alert() ->BoosterItemViewController {
        let storyboard = UIStoryboard(name: "BoosterItem", bundle: .main)
        let alert = storyboard.instantiateViewController(withIdentifier: "BoosterItemViewController") as! BoosterItemViewController
        
        return alert
    }
    
    func viewselected() ->ViewselectedtagsViewController {
           let storyboard = UIStoryboard(name: "BoosterItem", bundle: .main)
           let alert = storyboard.instantiateViewController(withIdentifier: "ViewselectedtagsViewController") as! ViewselectedtagsViewController
           
           return alert
       }
    func statusviewselect() ->StatusViewSelect {
        let storyboard = UIStoryboard(name: "BoosterItem", bundle: .main)
        let alert = storyboard.instantiateViewController(withIdentifier: "Statusviewselect") as! StatusViewSelect
        
        return alert
    }
}
