//
//  Setting1.swift
//  Brandiary
//
//  Created by young on 17/10/2019.
//  Copyright © 2019 young. All rights reserved.
//

import UIKit

class Setting1: UIViewController {

    @IBOutlet weak var back: UIBarButtonItem!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view1: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(Setting1.tapFunction))
             view1.isUserInteractionEnabled = true
             view1.addGestureRecognizer(tap)
        // Do any additional setup after loading the view.
    }
    

    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @objc
      func tapFunction(sender:UITapGestureRecognizer) {
          
        let view = self.storyboard?.instantiateViewController(withIdentifier: "FindPeople")
        //이동할 때 화면 coverVertical로 보여줘
        view?.modalTransitionStyle = UIModalTransitionStyle.coverVertical
        self.present(view!, animated: true, completion: nil)
        
          }
 

}
