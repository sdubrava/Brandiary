//
//  ContactsSyncing.swift
//  Brandiary
//
//  Created by young on 17/10/2019.
//  Copyright © 2019 young. All rights reserved.
//

import UIKit

class ContactsSyncing: UIViewController {

    @IBOutlet weak var caption: UILabel!
    @IBOutlet weak var switchbtn: UISwitch!
    @IBOutlet weak var label1: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
      switchbtn.transform = CGAffineTransform(scaleX:0.7, y: 0.6)

        // Do any additional setup after loading the view.
    }
    @IBAction func back(_ sender: Any) {
           dismiss(animated: true, completion: nil)
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
