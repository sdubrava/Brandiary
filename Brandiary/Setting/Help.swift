//
//  Help.swift
//  Brandiary
//
//  Created by young on 17/10/2019.
//  Copyright © 2019 young. All rights reserved.
//

import UIKit

var reportbool = true

class Help: UIViewController {
    
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var view1: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func back(_ sender: Any) {
           dismiss(animated: true, completion: nil)
       }

  

}
