//
//  AreyousureViewController.swift
//  Brandiary
//
//  Created by young on 13/10/2019.
//  Copyright © 2019 young. All rights reserved.
//

import UIKit

class AreyousureViewController: UIViewController {
    var areyousurereceive : String?
    @IBOutlet weak var sureview: UIView!
    @IBOutlet weak var line: UILabel!
    @IBOutlet weak var okbtn: UIButton!
    @IBOutlet weak var cancel: UIButton!
    @IBOutlet weak var stack: UIStackView!
    @IBOutlet weak var areyousure: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        sureview.layer.cornerRadius = 5
        sureview.layer.masksToBounds = true
        

        // Do any additional setup after loading the view.
    }
    

    @IBAction func ok(_ sender: Any) {
        dismiss(animated: true, completion: nil)
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
