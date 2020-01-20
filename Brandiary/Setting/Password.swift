//
//  Password.swift
//  Brandiary
//
//  Created by young on 17/10/2019.
//  Copyright © 2019 young. All rights reserved.
//

import UIKit

class Password: UIViewController {
    var newpassword = String()
    @IBOutlet weak var donebtn: UIBarButtonItem!
    @IBOutlet weak var newagainvalid: UILabel!
    @IBOutlet weak var eye3: UIImageView!
    @IBOutlet weak var newagaintext: UITextField!
    @IBOutlet weak var newagain: UILabel!
    @IBOutlet weak var newvalid: UILabel!
    @IBOutlet weak var barimg: UIImageView!
    @IBOutlet weak var currentvalid: UILabel!
    @IBOutlet weak var eye2: UIImageView!
    @IBOutlet weak var eye1: UIImageView!
    @IBOutlet weak var newpasswordtext: UITextField!
    @IBOutlet weak var new: UILabel!
    @IBOutlet weak var currentpasswordtext: UITextField!
    @IBOutlet weak var forgetimg: UIImageView!
    @IBOutlet weak var forgetbtn: UIButton!
    @IBOutlet weak var Current: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        newvalid.isHidden = true
        currentvalid.isHidden = true
        newagainvalid.isHidden = true
        barimg.isHidden = true
        currentpasswordtext.addLeftPadding()
        newpasswordtext.addLeftPadding()
        newagaintext.addLeftPadding()
          let tap = UITapGestureRecognizer(target: self, action: #selector(Password.tapFunction1))
                  eye1.isUserInteractionEnabled = true
              eye1.addGestureRecognizer(tap)
        let tap2 = UITapGestureRecognizer(target: self, action: #selector(Password.tapFunction2))
            eye2.isUserInteractionEnabled = true
        eye2.addGestureRecognizer(tap2)
        let tap3 = UITapGestureRecognizer(target: self, action: #selector(Password.tapFunction3))
            eye3.isUserInteractionEnabled = true
        eye3.addGestureRecognizer(tap3)
    }
    @objc
                  func tapFunction1(sender:UITapGestureRecognizer) {
         if currentpasswordtext.isSecureTextEntry == true {
                      self.eye1.image = UIImage(named:"noeye.png")
                      currentpasswordtext.isSecureTextEntry = false
                  }
                  else {
                        self.eye1.image = UIImage(named:"eyeOn@3x.png")
                       currentpasswordtext.isSecureTextEntry = true
                  }
       }
    @objc
                     func tapFunction2(sender:UITapGestureRecognizer) {
            if newpasswordtext.isSecureTextEntry == true {
                         self.eye2.image = UIImage(named:"noeye.png")
                         newpasswordtext.isSecureTextEntry = false
                     }
                     else {
                           self.eye2.image = UIImage(named:"eyeOn@3x.png")
                          newpasswordtext.isSecureTextEntry = true
                     }
          }
    @objc
                     func tapFunction3(sender:UITapGestureRecognizer) {
            if newagaintext.isSecureTextEntry == true {
                         self.eye3.image = UIImage(named:"noeye.png")
                         newagaintext.isSecureTextEntry = false
                     }
                     else {
                           self.eye3.image = UIImage(named:"eyeOn@3x.png")
                          newagaintext.isSecureTextEntry = true
                     }
          }
    @IBAction func back(_ sender: Any) {
           let view = self.storyboard?.instantiateViewController(withIdentifier: "Account")
                            //이동할 때 화면 coverVertical로 보여줘
                            view?.modalTransitionStyle = UIModalTransitionStyle.coverVertical
        view?.modalPresentationStyle = .fullScreen
                            self.present(view!, animated: true, completion: nil)
       }
    
    @IBAction func done(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func Currenttextchange(_ sender: Any) {
        if currentpasswordtext.text != "dksdudgns156!" && currentpasswordtext.text != ""{
            currentvalid.isHidden = false
        }
        else{
           currentvalid.isHidden = true
        }
    }
    
    @IBAction func newagaintextchange(_ sender: Any) {
        if newagaintext.text == ""{
            newagainvalid.isHidden = true
        }
        else if newagaintext.text != newpassword {
            newagainvalid.isHidden = false
        }
        else{
            newagainvalid.isHidden = true
        }
        
        if newagaintext!.text != "" && currentpasswordtext.text != "" && newpasswordtext.text != "" && newagainvalid.isHidden == true && currentvalid.isHidden == true{
            
            self.donebtn.tintColor = UIColor(displayP3Red: 162/255, green: 32/255, blue: 58/255, alpha: 1)
            donebtn.isEnabled = true
            
        }
        else{
            self.donebtn.tintColor = UIColor(displayP3Red: 72/255, green: 72/255, blue: 72/255, alpha: 1)
            donebtn.isEnabled = false
        }
        
    }
    @IBAction func newpasswordchange(_ sender: Any) {
        if newpasswordtext.text != ""{
            newpassword = newpasswordtext.text!
                   
                  newvalid.isHidden = false
                  barimg.isHidden = false
               }
               else {
                  
                  newvalid.isHidden = true
                  barimg.isHidden = true
                   
               }
               
                if ValidGreen(testStr: newpasswordtext.text!) == true {
                                                           
                        newvalid.text = "The security of this password is good.\nWe recommend this password."
                                                           newvalid.textColor = UIColor(displayP3Red: 123/255, green: 198/255, blue: 43/255, alpha: 1)
                                                           barimg.image = UIImage(named: "greenbar.png")
                        
                  
                                                           
                                                       }
                else if ValidYellow(testStr: newpasswordtext.text!) == true{
                          newvalid.text = "The security of this password is normal.\nYou can use this password."
                                                           newvalid.textColor = UIColor(displayP3Red: 234/255, green: 170/255, blue: 0/255, alpha: 1)
                                                           barimg.image = UIImage(named:"yellowbar.png.png")
                                                       }
                                                       else{
                         newvalid.text = "The security of this password is bad.\nYou can not use this password."
                                                           newvalid.textColor = UIColor(displayP3Red: 224/255, green: 32/255, blue: 32/255, alpha: 1)
                                                           barimg.image = UIImage(named: "redbar.png")
                     
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

extension UITextField {
  func addLeftPadding() {
    let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: self.frame.height))
    self.leftView = paddingView
    self.leftViewMode = ViewMode.always
  }
}
