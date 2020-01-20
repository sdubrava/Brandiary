//
//  Bookmark.swift
//  Brandiary
//
//  Created by young on 06/08/2019.
//  Copyright © 2019 young. All rights reserved.
//

import UIKit

class Bookmark: UIViewController {

    @IBOutlet weak var back: UIBarButtonItem!
    @IBOutlet weak var bookmarktable: UIView!
    @IBOutlet weak var bookmarkmain: UIView!
    @IBOutlet weak var collectionview: UIBarButtonItem!
    @IBOutlet weak var table: UIBarButtonItem!
    @IBOutlet weak var mainview: UIBarButtonItem!
    @IBOutlet weak var bookmarkcollection: UIView!
    @IBOutlet weak var plus: UIButton!
    @IBOutlet weak var all: UIButton!
    @IBOutlet weak var segment: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()

       segment.isHidden = true
        bookmarktable.isHidden = true
        bookmarkcollection.isHidden = true
        
        
    }
    @IBAction func back(_ sender: Any) {
        let view = self.storyboard?.instantiateViewController(withIdentifier: "tabbar")
        //이동할 때 화면 coverVertical로 보여줘
        view?.modalTransitionStyle = UIModalTransitionStyle.coverVertical
        self.present(view!, animated: true, completion: nil)
        
    }
    
    @IBAction func plus(_ sender: Any) {
        
        segment.isHidden = false
        all.isHidden = true
        
        segment.frame = CGRect(x: 0, y: 64, width: 210, height: 50)
        plus.frame = CGRect(x: 210, y: 64 , width: 35 , height: 50)
    }
    
    @IBAction func mainview(_ sender: Any) {
        
        bookmarkmain.isHidden = false
        bookmarktable.isHidden = true
        bookmarkcollection.isHidden = true
        
    }
    
    @IBAction func tableview(_ sender: Any) {
        bookmarkmain.isHidden = true
        bookmarktable.isHidden = false
        bookmarkcollection.isHidden = true
    }
    
    @IBAction func collectionview(_ sender: Any) {
        bookmarkmain.isHidden = true
        bookmarktable.isHidden = true
        bookmarkcollection.isHidden = false
    }
}
