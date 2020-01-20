//
//  MypageAffiliated.swift
//  Brandiary
//
//  Created by young on 10/08/2019.
//  Copyright © 2019 young. All rights reserved.
//

import UIKit

class MypageAffiliated: UIViewController,UITextViewDelegate {

    @IBOutlet weak var textview: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
         NotificationCenter.default.addObserver(self, selector: #selector(MypageAffiliated.notifiactionFired(_:)), name: NSNotification.Name("informtext"), object: nil)
        textview.delegate = self

        // Do any additional setup after loading the view.
    }
    @objc func notifiactionFired(_ notification:Notification) {
           
        if UserDefaults.standard.string(forKey: "\(UserDefaults.standard.string(forKey: "name") ?? "")inform") == nil {
               }else{
                   textview.text = UserDefaults.standard.string(forKey: "\(UserDefaults.standard.string(forKey: "name") ?? "")inform")
               }
           

           }
    
    
}
