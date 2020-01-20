//
//  Store.swift
//  Brandiary
//
//  Created by young on 28/07/2019.
//  Copyright © 2019 young. All rights reserved.
//

import UIKit

class Store: UIViewController {
    
    
    
    

    @IBOutlet weak var Myitembtn: UIButton!
    @IBOutlet weak var Exchangebtn: UIButton!
    @IBOutlet weak var Storebtn: UIButton!
    @IBOutlet weak var stack: UIStackView!
    @IBOutlet weak var whiteline: UILabel!
    @IBOutlet weak var MyItem: UIView!
    
    @IBOutlet weak var Store: UIView!
    
    @IBOutlet weak var exchange: UIView!
    
   
    
    @IBOutlet weak var back: UIBarButtonItem!
    @IBAction func back(_ sender: Any) {
          let view = self.storyboard?.instantiateViewController(withIdentifier: "tabbar")
                                              //이동할 때 화면 coverVertical로 보여줘
                                              view?.modalTransitionStyle = UIModalTransitionStyle.coverVertical
                                              self.present(view!, animated: true, completion: nil)
    }
    
   
    @IBAction func myitembtn(_ sender: Any) {
        Store.isHidden = true
               exchange.isHidden = true
               MyItem.isHidden = false
        Myitembtn.backgroundColor = UIColor.white
        Storebtn.backgroundColor = UIColor(displayP3Red: 238/255, green: 238/255, blue: 238/255, alpha: 1)
        Exchangebtn.backgroundColor = UIColor(displayP3Red: 238/255, green: 238/255, blue: 238/255, alpha: 1)
Myitembtn.setTitleColor(UIColor(displayP3Red: 72/255, green: 72/255, blue: 72/255, alpha: 1), for: .normal)
    
    Storebtn.setTitleColor(UIColor(displayP3Red: 148/255, green: 148/255, blue: 148/255, alpha: 1), for: .normal)
Exchangebtn.setTitleColor(UIColor(displayP3Red: 148/255, green: 148/255, blue: 148/255, alpha: 1), for: .normal)
}
    @IBAction func Upgradebtn(_ sender: Any) {
        Store.isHidden = true
                 exchange.isHidden = false
             MyItem.isHidden = true
        
        Exchangebtn.backgroundColor = UIColor.white
         Myitembtn.backgroundColor = UIColor(displayP3Red: 238/255, green: 238/255, blue: 238/255, alpha: 1)
        Storebtn.backgroundColor = UIColor(displayP3Red: 238/255, green: 238/255, blue: 238/255, alpha: 1)
        Exchangebtn.setTitleColor(UIColor(displayP3Red: 72/255, green: 72/255, blue: 72/255, alpha: 1), for: .normal)
            
            Storebtn.setTitleColor(UIColor(displayP3Red: 148/255, green: 148/255, blue: 148/255, alpha: 1), for: .normal)
        Myitembtn.setTitleColor(UIColor(displayP3Red: 148/255, green: 148/255, blue: 148/255, alpha: 1), for: .normal)
    }
    @IBAction func Storebtn(_ sender: Any) {
        Store.isHidden = false
                   exchange.isHidden = true
                   MyItem.isHidden = true
         Myitembtn.backgroundColor = UIColor(displayP3Red: 238/255, green: 238/255, blue: 238/255, alpha: 1)
        Storebtn.backgroundColor = UIColor.white
               Exchangebtn.backgroundColor = UIColor(displayP3Red: 238/255, green: 238/255, blue: 238/255, alpha: 1)
        
        Storebtn.setTitleColor(UIColor(displayP3Red: 72/255, green: 72/255, blue: 72/255, alpha: 1), for: .normal)
            
            Myitembtn.setTitleColor(UIColor(displayP3Red: 148/255, green: 148/255, blue: 148/255, alpha: 1), for: .normal)
        Exchangebtn.setTitleColor(UIColor(displayP3Red: 148/255, green: 148/255, blue: 148/255, alpha: 1), for: .normal)
    }
    
    
           
   
            
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Storebtn.roundedButton()
        Exchangebtn.roundedButton()
        Myitembtn.roundedButton()

        Store.isHidden = false
                          exchange.isHidden = true
                          MyItem.isHidden = true
                Myitembtn.backgroundColor = UIColor(displayP3Red: 238/255, green: 238/255, blue: 238/255, alpha: 1)
               Storebtn.backgroundColor = UIColor.white
                      Exchangebtn.backgroundColor = UIColor(displayP3Red: 238/255, green: 238/255, blue: 238/255, alpha: 1)
               
                   
                   Myitembtn.setTitleColor(UIColor(displayP3Red: 148/255, green: 148/255, blue: 148/255, alpha: 1), for: .normal)
               Exchangebtn.setTitleColor(UIColor(displayP3Red: 148/255, green: 148/255, blue: 148/255, alpha: 1), for: .normal)
        
          Storebtn.backgroundColor = UIColor.white
    Storebtn.setTitleColor(UIColor(displayP3Red: 72/255, green: 72/255, blue: 72/255, alpha: 1), for: .normal)
        
        UISegmentedControl.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: .selected)
        
        UISegmentedControl.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.lightGray], for: .normal)
        
        self.navigationItem.title = "Store"
        
        

    }
   

}

extension UIButton {
   func roundedButton(){
    clipsToBounds = true
    layer.cornerRadius = 10
    layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    layer.borderWidth = 1
    layer.borderColor = UIColor(displayP3Red: 211/255, green: 211/255, blue: 211/255, alpha: 1).cgColor
     
   }
}


