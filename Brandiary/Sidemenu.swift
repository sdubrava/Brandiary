//
//  Sidemenu.swift
//  Brandiary
//
//  Created by young on 27/07/2019.
//  Copyright © 2019 young. All rights reserved.
//

import UIKit

class Sidemenu: UIViewController {

    @IBOutlet weak var booklabel: UILabel!
    @IBOutlet weak var settingbtn: UIButton!
    @IBOutlet weak var storebtn: UIButton!
    @IBOutlet weak var questbtn: UIButton!
    @IBOutlet weak var bookmarkbtn: UIButton!
    @IBOutlet weak var communitybtn: UIButton!
    @IBOutlet weak var bookmark: UIImageView!
    @IBOutlet weak var communitylabel: UILabel!
    @IBOutlet weak var community: UIImageView!
    @IBOutlet weak var redline2: UILabel!
    @IBOutlet weak var redline: UILabel!
    @IBOutlet weak var downbtn: UIButton!
    @IBOutlet weak var name: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.barTintColor = UIColor.white
        self.navigationController?.navigationBar.isHidden = true

        // Do any additional setup after loading the view.
    }
    
//    @IBAction func goquest(_ sender: Any) {
//
//        let view = self.storyboard?.instantiateViewController(withIdentifier: "Quest")
//        //이동할 때 화면 coverVertical로 보여줘
//        view?.modalTransitionStyle = UIModalTransitionStyle.coverVertical
//        self.present(view!, animated: true, completion: nil)
//
//
//    }
//
//    @IBAction func gostore(_ sender: Any) {
//
//        let view = self.storyboard?.instantiateViewController(withIdentifier: "store")
//        //이동할 때 화면 coverVertical로 보여줘
//        view?.modalTransitionStyle = UIModalTransitionStyle.coverVertical
//        self.present(view!, animated: true, completion: nil)
//    }
//
//    @IBAction func gobookmark(_ sender: Any) {
//        let view = self.storyboard?.instantiateViewController(withIdentifier: "bookmark")
//        //이동할 때 화면 coverVertical로 보여줘
//        view?.modalTransitionStyle = UIModalTransitionStyle.coverVertical
//        self.present(view!, animated: true, completion: nil)
//    }
//}
}
