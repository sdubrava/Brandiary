//
//  FindPassword2.swift
//  Brandiary
//
//  Created by young on 13/11/2019.
//  Copyright © 2019 young. All rights reserved.
//

import UIKit

class FindPassword2: UIViewController {

    var email2 : String?

       

       
       @IBOutlet weak var emaillabel: UILabel!
       @IBOutlet weak var Please: UITextField!
       @IBOutlet weak var Backbtn: UIButton!
       @IBOutlet weak var valid: UILabel!
       
       @IBOutlet weak var Logo: UIImageView!
       

    @IBAction func backtosignin(_ sender: Any) {
        let view = self.storyboard?.instantiateViewController(withIdentifier: "Password")
                   //이동할 때 화면 coverVertical로 보여줘
                   view?.modalTransitionStyle = UIModalTransitionStyle.coverVertical
        view?.modalPresentationStyle = .fullScreen
                   self.present(view!, animated: true, completion: nil)
    }
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var back: UIBarButtonItem!
    override func viewDidLoad() {
           super.viewDidLoad()
         
           email2 = emaill
           emaillabel.text = email2
         
           Backbtn.layer.cornerRadius = 5
           
          

           // Do any additional setup after loading the view.
       }

}
