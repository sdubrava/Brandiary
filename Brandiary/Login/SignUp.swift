//
//  SignUp.swift
//  Brandiary
//
//  Created by young on 15/07/2019.
//  Copyright © 2019 young. All rights reserved.
//

import UIKit
import FirebaseAuth

var Signupemail = String()

class SignUp: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var backbtn: UIButton!
    @IBOutlet weak var roundx: UIImageView!
    @IBOutlet weak var Nextbtn: UIButton!
    @IBOutlet weak var Description: UILabel!
    @IBOutlet weak var Valid: UILabel!
    @IBOutlet weak var Email: UITextField!
    @IBOutlet weak var Logo: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        Email.addLeftPadding()
        appdelegate.shouldSupportAllOrientation = false
        
        Email.delegate = self
        Nextbtn.layer.cornerRadius = 5
        Valid.isHidden = true
        Nextbtn.backgroundColor = UIColor(red:217/255, green:217/255, blue:217/255, alpha: 1)
        Nextbtn.isEnabled = false
        
        //타겟 설정 텍스트필드
        Email.addTarget(self, action: #selector(textfieldendedit(_:)), for: UIControl.Event.editingChanged)
        roundx.isHidden = true
        
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(SignUp.tapFunction))

        //원하는 버튼에 이 두가지 메소드를 추가해준다.
        roundx.isUserInteractionEnabled = true
        roundx.addGestureRecognizer(tap)

      backbtn.layer.borderColor = UIColor(displayP3Red: 217/255, green: 217/255, blue: 217/255, alpha: 1).cgColor
             backbtn.layer.borderWidth = 0.5
             //둥글게
             backbtn.layer.cornerRadius = 5
    

      
    }
    
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func textchange(_ sender: Any) {
        
        Signupemail = Email.text!

        if Email.text == "" {
                 
                 roundx.isHidden = true
                 
             }
             else {
                 roundx.isHidden = false
             }    }
    
    //펑션을 따로 만들어줌
          @objc
              func tapFunction(sender:UITapGestureRecognizer) {
            Email.text = ""
          }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){

          self.view.endEditing(true)
    }

    
    //텍스트필드가 바꼈니?
    @IBAction func textfieldendedit(_ sender: UITextField) {
        if Email.text == "" {
                  roundx.isHidden = true
            }else{
                  roundx.isHidden = false
            }
        if Email.isValidEmail() == true{
                 Nextbtn.backgroundColor = UIColor(red:162/255, green:48/255, blue:56/255, alpha: 1)
                        Nextbtn.tintColor = UIColor.white
            Valid.isHidden = true
            Nextbtn.isEnabled = true
             }
             else{
            Valid.text = "This is not valid email format."
            Valid.isHidden = false
        }
     
        
    }
    @IBAction func Nextbtn(_ sender: Any) {
        
        if Email.isValidEmail() == false{
            Valid.text = "This is not valid email format."
            Valid.isHidden = false
            Nextbtn.isEnabled = false
        }
        else{
            Nextbtn.isEnabled = true
        
        
    }
    }
    

}

extension UITextField{
    
    func isValidEmail() -> Bool {
           let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
           let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self.text)
       }
    func isEnglish() -> Bool {
           let Englishregex = "[A-Z0-9a-z]{1,}"
           let EnglishTest = NSPredicate(format:"SELF MATCHES %@", Englishregex)
        return EnglishTest.evaluate(with: self.text)
       }
       
    
}

