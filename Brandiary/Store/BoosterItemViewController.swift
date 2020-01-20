//
//  BoosterItemViewController.swift
//  Brandiary
//
//  Created by young on 21/09/2019.
//  Copyright © 2019 young. All rights reserved.
//

import UIKit

class BoosterItemViewController: UIViewController {
    
    var receivecolor = BoosterColor
    var receiveimage = BoosterImage
    var receiveText = BoosterText
    var receiveCaption = BoosterCaption
    var receiveSource = BoosterSource

    @IBOutlet weak var boosterview: UIView!
    @IBOutlet weak var Ifyouusethis: UILabel!
    @IBOutlet weak var Source: UILabel!
    @IBOutlet weak var Boosterlabel: UILabel!
    @IBOutlet weak var Boosterimage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.Source.text = receiveSource
        self.Ifyouusethis.text = receiveCaption
        self.Boosterlabel.text = receiveText
        self.Boosterimage.image = receiveimage
        self.Boosterlabel.textColor = receivecolor
        self.boosterview.layer.borderWidth = 4
        self.boosterview.layer.borderColor = receivecolor.cgColor
        self.boosterview.layer.cornerRadius = 8
        self.boosterview.layer.masksToBounds = true
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(BoosterItemViewController.close))
        
        
        view.addGestureRecognizer(tap)
        
        
        
        
        
    }
    
    @objc func close() {
        
        dismiss(animated: true, completion: nil)
        
    }

        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


