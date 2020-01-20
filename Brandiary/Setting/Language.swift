//
//  Language.swift
//  Brandiary
//
//  Created by young on 17/10/2019.
//  Copyright © 2019 young. All rights reserved.
//

import UIKit

class Language: UIViewController {

    @IBOutlet weak var check2: UIImageView!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var check1: UIImageView!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var view1: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        label1.textColor = UIColor(displayP3Red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
                  label2.textColor = UIColor(displayP3Red: 72/255, green: 72/255, blue: 72/255, alpha: 1)
                
                  check1.isHidden = false
                  check2.isHidden = true
        
        let tap1 = UITapGestureRecognizer(target: self, action: #selector(Language.tap1))
                         view1.isUserInteractionEnabled = true
                         view1.addGestureRecognizer(tap1)
              let tap2 = UITapGestureRecognizer(target: self, action: #selector(Language.tap2))
                                view2.isUserInteractionEnabled = true
                                view2.addGestureRecognizer(tap2)

    }
    @IBAction func back(_ sender: Any) {
           dismiss(animated: true, completion: nil)
       }
    
    @objc func tap1(sender:UITapGestureRecognizer){
           
           label1.textColor = UIColor(displayP3Red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
           label2.textColor = UIColor(displayP3Red: 72/255, green: 72/255, blue: 72/255, alpha: 1)
         
           check1.isHidden = false
           check2.isHidden = true
           

       }
       @objc func tap2(sender:UITapGestureRecognizer){
             
             label2.textColor = UIColor(displayP3Red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
             label1.textColor = UIColor(displayP3Red: 72/255, green: 72/255, blue: 72/255, alpha: 1)
            
             check2.isHidden = false
             check1.isHidden = true
            

         }
    

}