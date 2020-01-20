//
//  SignUp2.swift
//  Brandiary
//
//  Created by young on 15/07/2019.
//  Copyright © 2019 young. All rights reserved.
//

import UIKit
var Signupname = String()
class SignUp2: UIViewController,UITextFieldDelegate {

    
    @IBOutlet weak var youcanlabel: UILabel!
    @IBOutlet weak var xround: UIImageView!
    @IBOutlet weak var Nextbtn: UIButton!
    @IBOutlet weak var Backbtn: UIButton!
    @IBOutlet weak var Valid: UILabel!
    @IBOutlet weak var Text: UITextField!
    @IBOutlet weak var Logo: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        Text.addLeftPadding()
        appdelegate.shouldSupportAllOrientation = false
          xround.isHidden = true
         Nextbtn.backgroundColor = UIColor(red:217/255, green:217/255, blue:217/255, alpha: 1)
        Nextbtn.isEnabled = false
        
        Valid.isHidden = true
        //테두리 주기
        Backbtn.layer.borderColor = UIColor(displayP3Red: 217/255, green: 217/255, blue: 217/255, alpha: 1).cgColor
        Backbtn.layer.borderWidth = 0.5
        //둥글게
        Backbtn.layer.cornerRadius = 5
        Nextbtn.layer.cornerRadius = 5
        
        Text.delegate = self
    let tap = UITapGestureRecognizer(target: self, action: #selector(SignUp2.tapFunction))

               //원하는 버튼에 이 두가지 메소드를 추가해준다.
               xround.isUserInteractionEnabled = true
               xround.addGestureRecognizer(tap)

             
           

             
           }
           
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
           @IBAction func textchange(_ sender: Any) {
            if Text.text == "" {
                      xround.isHidden = true
                }else{
                      xround.isHidden = false
                }
            
            if Text.isEnglish() == true {
                            Nextbtn.backgroundColor = UIColor(red:162/255, green:48/255, blue:56/255, alpha: 1)
                                   Nextbtn.tintColor = UIColor.white
                       Valid.isHidden = true
                       Nextbtn.isEnabled = true
                        }
            else if Text.text! == ""{
                Valid.isHidden = true
                Nextbtn.isEnabled = false
                Nextbtn.backgroundColor = UIColor(red:217/255, green:217/255, blue:217/255, alpha: 1)
                   }
            else{
                 Nextbtn.backgroundColor = UIColor(red:217/255, green:217/255, blue:217/255, alpha: 1)
                Valid.text = "You can’t use this name. You can only use numbers and English."
                    Valid.isHidden = false
                Nextbtn.isEnabled = false
            }
            Signupname = Text.text!
            
            

               if Text.text == "" {
                        
                        xround.isHidden = true
                        
                    }
                    else {
                        xround.isHidden = false
                    }    }
           
           //펑션을 따로 만들어줌
                 @objc
                     func tapFunction(sender:UITapGestureRecognizer) {
                   Text.text = ""
                 }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){

          self.view.endEditing(true)
    }
    @IBAction func Nextbtn(_ sender: Any) {
        
    }

 
}
