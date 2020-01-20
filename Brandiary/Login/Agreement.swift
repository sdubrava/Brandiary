//
//  Agreement.swift
//  Brandiary
//
//  Created by young on 30/11/2019.
//  Copyright © 2019 young. All rights reserved.
//

import UIKit

class Agreement: UIViewController {

    @IBOutlet weak var agreementimg: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        appdelegate.shouldSupportAllOrientation = false
        kororeng.title = "Kor"
        
        let imageView = UIImageView(frame: CGRect(x: 100, y: 0, width: 300, height: 30))
              imageView.contentMode = .scaleAspectFit
             
              imageView.image = UIImage(named: "logo1.png")
              navigationItem.titleView = imageView
        
        agreementimg.image = UIImage(named: "agreement.jpg")

       
    }
    @IBAction func kororeng(_ sender: Any) {
        
        if kororeng.title == "Kor" {
            kororeng.title = "Eng"
            agreementimg.image = UIImage(named: "agreement.jpg")
        }else{
            kororeng.title = "Kor"
            agreementimg.image = UIImage(named: "agreementkor.jpg")
        }
        
    }
    
    @IBOutlet weak var kororeng: UIBarButtonItem!
    
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }


}
