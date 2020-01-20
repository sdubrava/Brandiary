//
//  ReportsureViewController.swift
//  Brandiary
//
//  Created by young on 13/10/2019.
//  Copyright © 2019 young. All rights reserved.
//

import UIKit

class ReportsureViewController: UIViewController {

    @IBOutlet weak var reportview: UIView!
    @IBOutlet weak var donebtn: UIButton!
    @IBOutlet weak var thankyou: UILabel!
    @IBOutlet weak var reportlabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        reportview.layer.cornerRadius = 15
        reportview.layer.masksToBounds = true

        // Do any additional setup after loading the view.
    }
    
    @IBAction func done(_ sender: Any) {
        
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
