//
//  CommentViewController.swift
//  Brandiary
//
//  Created by young on 10/10/2019.
//  Copyright © 2019 young. All rights reserved.
//

import UIKit

class CommentViewController: UIViewController {

    @IBOutlet weak var messagebtn: UIButton!
    @IBOutlet weak var plusbtn: UIButton!
    @IBOutlet weak var text: UITextField!
    @IBOutlet weak var commentlabel: UILabel!
    @IBOutlet weak var commentimg: UIImageView!
    @IBOutlet weak var stack: UIStackView!
    override func viewDidLoad() {
        super.viewDidLoad()
        appdelegate.shouldSupportAllOrientation = false

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
