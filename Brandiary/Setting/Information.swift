//
//  Information.swift
//  Brandiary
//
//  Created by young on 17/10/2019.
//  Copyright © 2019 young. All rights reserved.
//

import UIKit

class Information: UIViewController {

    @IBOutlet weak var community: UILabel!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var termofuser: UILabel!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var privacy: UILabel!
    @IBOutlet weak var view1: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap1 = UITapGestureRecognizer(target: self, action: #selector(Information.tap1))
                          view1.isUserInteractionEnabled = true
                          view1.addGestureRecognizer(tap1)
               let tap2 = UITapGestureRecognizer(target: self, action: #selector(Information.tap2))
                                 view2.isUserInteractionEnabled = true
                                 view2.addGestureRecognizer(tap2)
               let tap3 = UITapGestureRecognizer(target: self, action: #selector(Information.tap3))
                                 view3.isUserInteractionEnabled = true
                                 view3.addGestureRecognizer(tap3)
        privacy.text = "Operation Policy"
    }
    @IBAction func back(_ sender: Any) {
           dismiss(animated: true, completion: nil)
       }
    @objc func tap1(sender:UITapGestureRecognizer){
        let Url = NSURL(string:"http://www.brandiary.co.kr/Eng_PP")! as URL
        UIApplication.shared.open(Url, options: [:], completionHandler: nil)

    }
    @objc func tap2(sender:UITapGestureRecognizer){
        let settingsUrl = NSURL(string:"http://brandiary.co.kr/Eng_ToU")! as URL
               UIApplication.shared.open(settingsUrl, options: [:], completionHandler: nil)
    

      }
    @objc func tap3(sender:UITapGestureRecognizer){
        let settingsUrl = NSURL(string:"http://brandiary.co.kr/Eng_OP")! as URL
                     UIApplication.shared.open(settingsUrl, options: [:], completionHandler: nil)
      }
 
    
    
    }
