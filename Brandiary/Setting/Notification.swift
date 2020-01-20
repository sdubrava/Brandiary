//
//  Notification.swift
//  Brandiary
//
//  Created by young on 17/10/2019.
//  Copyright © 2019 young. All rights reserved.
//

import UIKit

class Notification: UIViewController {

    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var switchbtn: UISwitch!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var view1: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
      switchbtn.transform = CGAffineTransform(scaleX:0.7, y: 0.6)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(Notification.tapFunction))
              view2.isUserInteractionEnabled = true
              view2.addGestureRecognizer(tap)
        
        let tap2 = UITapGestureRecognizer(target: self, action: #selector(Notification.tapFunction2))
                     view3.isUserInteractionEnabled = true
                     view3.addGestureRecognizer(tap2)

        // Do any additional setup after loading the view.
    }
    @IBAction func back(_ sender: Any) {
           dismiss(animated: true, completion: nil)
       }
    @objc
         func tapFunction(sender:UITapGestureRecognizer) {
             
           let view = self.storyboard?.instantiateViewController(withIdentifier: "PostsComments")
           //이동할 때 화면 coverVertical로 보여줘
           view?.modalTransitionStyle = UIModalTransitionStyle.coverVertical
        view?.modalPresentationStyle = .fullScreen
           self.present(view!, animated: true, completion: nil)
           
             }
    @objc
            func tapFunction2(sender:UITapGestureRecognizer) {
                
              let view = self.storyboard?.instantiateViewController(withIdentifier: "FollowingFollowers")
              //이동할 때 화면 coverVertical로 보여줘
              view?.modalTransitionStyle = UIModalTransitionStyle.coverVertical
        view?.modalPresentationStyle = .fullScreen
              self.present(view!, animated: true, completion: nil)
              
                }


}




