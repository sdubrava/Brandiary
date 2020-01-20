//
//  SignUp3.swift
//  Brandiary
//
//  Created by young on 08/08/2019.
//  Copyright © 2019 young. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

var Signuppassword = String()
let appdelegate = UIApplication.shared.delegate as! AppDelegate
class SignUp3: UIViewController,UITextFieldDelegate {
   

    @IBOutlet weak var caption: UILabel!
    @IBOutlet weak var validbar: UIImageView!
    @IBOutlet weak var valid: UILabel!
    @IBOutlet weak var xbtn: UIButton!
    @IBOutlet weak var nextbtn: UIButton!
    @IBOutlet weak var back: UIButton!
    @IBOutlet weak var eye: UIImageView!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var logo: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        password.layer.cornerRadius = 10
        password.layer.masksToBounds = true
        password.addLeftPadding()
        appdelegate.shouldSupportAllOrientation = false
        xbtn.isHidden = true
        nextbtn.backgroundColor = UIColor(red:217/255, green:217/255, blue:217/255, alpha: 1)
        nextbtn.setTitleColor(UIColor.white, for: .normal)
               nextbtn.isEnabled = false
        
        valid.isHidden = true
        
        password.delegate = self
        
        back.layer.borderColor = UIColor(red:217/255, green:217/255, blue:217/255, alpha: 1).cgColor
               back.layer.borderWidth = 1
               //둥글게
               back.layer.cornerRadius = 8
               nextbtn.layer.cornerRadius = 10
        
        xbtn.isHidden = true
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(SignUp3.tapFunction))

        //원하는 버튼에 이 두가지 메소드를 추가해준다.
            eye.isUserInteractionEnabled = true
        eye.addGestureRecognizer(tap)
        
       
       
        
       
    }
    
    @IBAction func Signup(_ sender: Any) {
        Auth.auth().createUser(withEmail: Signupemail, password: Signuppassword) { (user, error) in

            if error == nil{
             //         파이어스토어 데이터 추가
                     let db = Firestore.firestore()
             db.collection("users").document(Signupemail).setData(["email" : Signupemail,"name" : Signupname ])


            }
        }
        
        let alert = UIAlertController(title: "Welcome!!", message: "Sign up is complete.Branding yourself with Brandiary!!", preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "Back to Sign in", style: .default) { (action) in         let view = self.storyboard?.instantiateViewController(withIdentifier: "LoginView")
        //이동할 때 화면 coverVertical로 보여줘
        view?.modalTransitionStyle = UIModalTransitionStyle.coverVertical
        self.present(view!, animated: true, completion: nil)     }
         OKAction.setValue(UIColor(displayP3Red: 162/255, green: 32/255, blue: 58/255, alpha: 1), forKey: "titleTextColor")
               alert.addAction(OKAction)

            let attributedString = NSAttributedString(string: "Welcome!!", attributes: [
                     NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 17), //your font here
                NSAttributedString.Key.foregroundColor : UIColor.black
                     ])
                     alert.setValue(attributedString, forKey: "attributedTitle")
        let messageString  = "Sign up is complete.\nBranding yourself with Brandiary!!"
        var myMutableString = NSMutableAttributedString()
        myMutableString = NSMutableAttributedString(string: messageString as String, attributes: [NSAttributedString.Key.font:UIFont.systemFont(ofSize: 14)])
        myMutableString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.black, range: NSRange(location:0,length:messageString.count))
        alert.setValue(myMutableString, forKey: "attributedMessage")
        alert.view.subviews.last?.subviews.first?.backgroundColor = UIColor.white
        alert.view.subviews.last?.subviews.first?.layer.cornerRadius = 15

             
        self.present(alert, animated: true, completion: nil)

    
    }
    @IBAction func xbtn(_ sender: Any) {
        if password.text == ""{
            xbtn.isHidden = true
        }else{
        xbtn.isHidden = false
        }
    }
    @objc
               func tapFunction(sender:UITapGestureRecognizer) {
      if password.isSecureTextEntry == true {
                   self.eye.image = UIImage(named:"noeye.png")
                   password.isSecureTextEntry = false
               }
               else {
                     self.eye.image = UIImage(named:"eyeOn@3x.png")
                    password.isSecureTextEntry = true
               }
    }
    
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func textchange(_ sender: Any) {
        if password.text == "" {
                            xbtn.isHidden = true
                      }else{
                            xbtn.isHidden = false
                      }
        
        Signuppassword = password.text!
        
        if password.text != "" {
            
            xbtn.isHidden = false
            valid.isHidden = false
            validbar.isHidden = false
            
        }
        else {
            xbtn.isHidden = true
            valid.isHidden = true
             validbar.isHidden = false
        }
        
        if ValidGreen(testStr: password.text!) == true {
                                               
            valid.text =   "The security of this password is good.\nWe recommend this password."
                                               valid.textColor = UIColor(displayP3Red: 123/255, green: 198/255, blue: 43/255, alpha: 1)
                                               validbar.image = UIImage(named: "greenbar.png")
            
            nextbtn.backgroundColor = UIColor(red:162/255, green:32/255, blue:58/255, alpha: 1)
                   nextbtn.isEnabled = true
                                               
                                           }
                                           else if ValidYellow(testStr: password.text!) == true{
              valid.text = "The security of this password is normal.\nYou can use this password."
                                               valid.textColor = UIColor(displayP3Red: 234/255, green: 170/255, blue: 0/255, alpha: 1)
                                               validbar.image = UIImage(named: "yellowbar.png.png")
            nextbtn.backgroundColor = UIColor(red:217/255, green:217/255, blue:217/255, alpha: 1)
            nextbtn.isEnabled = true
                                           }
                                           else{
             valid.text = "The security of this password is bad.\nYou can not use this password."
          
                                               valid.textColor = UIColor(displayP3Red: 224/255, green: 32/255, blue: 32/255, alpha: 1)
                                               validbar.image = UIImage(named: "redbar.png")
            nextbtn.backgroundColor = UIColor(red:217/255, green:217/255, blue:217/255, alpha: 1)
            nextbtn.isEnabled = false
                                           }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
            
              
              self.view.endEditing(true)

       }
    
   
       
    
    
      func ValidYellow(testStr:String) -> Bool {
            
             let passwordRegex = "^(?=.*\\d{1,50})(?=.*[~`!@#$%\\^&*()-+=]{1,50})(?=.*[a-zA-Z]{2,50}).{8,50}$"
                    return NSPredicate(format: "SELF MATCHES %@", passwordRegex).evaluate(with: testStr) || testStr.count >= 10
         }
    
    func ValidGreen(testStr:String) -> Bool {
           let passwordRegex = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{10,}$"
           return NSPredicate(format: "SELF MATCHES %@", passwordRegex).evaluate(with: testStr)
       }
    


}
