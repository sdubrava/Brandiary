//
//  StatusViewSelect.swift
//  Brandiary
//
//  Created by young on 2019/12/23.
//  Copyright © 2019 young. All rights reserved.
//

import UIKit

class StatusViewSelect: UIViewController {

    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var cancelbtn: UIButton!
    @IBOutlet weak var number: UILabel!
    @IBOutlet weak var progressbar: UIProgressView!
    @IBOutlet weak var grayline: UILabel!
    @IBOutlet weak var lbl1: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        view1.layer.cornerRadius = 10
        view1.layer.masksToBounds = true
    }
    
    @IBAction func cancel(_ sender: Any) {
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
