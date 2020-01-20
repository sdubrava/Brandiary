//
//  SentEmail.swift
//  Brandiary
//
//  Created by young on 13/07/2019.
//  Copyright © 2019 young. All rights reserved.
//

import UIKit

class SentEmail: UIViewController {
    
    var email2 : String?

    

    
    @IBOutlet weak var emaillabel: UILabel!
    @IBOutlet weak var Please: UITextField!
    @IBOutlet weak var Backbtn: UIButton!
    @IBOutlet weak var valid: UILabel!
    
    @IBOutlet weak var Logo: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        appdelegate.shouldSupportAllOrientation = false
      
        email2 = email
        emaillabel.text = email2
      
        Backbtn.layer.cornerRadius = 5
        
        
       

        // Do any additional setup after loading the view.
    }
   


    @IBAction func backtosignin(_ sender: Any) {
        let view = self.storyboard?.instantiateViewController(withIdentifier: "LoginView")
                                         //이동할 때 화면 coverVertical로 보여줘
                                         view?.modalTransitionStyle = UIModalTransitionStyle.coverVertical
         view?.modalPresentationStyle = .fullScreen
                                         self.present(view!, animated: true, completion: nil)
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



