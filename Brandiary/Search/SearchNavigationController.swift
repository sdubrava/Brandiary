//
//  SearchNavigationController.swift
//  Brandiary
//
//  Created by young on 2020/01/17.
//  Copyright © 2020 young. All rights reserved.
//

import UIKit

class SearchNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("하이용")
        NotificationCenter.default.post(name: NSNotification.Name("Search"), object: nil)

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
