//
//  FindPassword.swift
//  Brandiary
//
//  Created by young on 17/10/2019.
//  Copyright © 2019 young. All rights reserved.
//

import UIKit

var emaill = String()
class FindPassword: UIViewController,UITextFieldDelegate {

  
    @IBOutlet weak var xbtn: UIButton!
    @IBOutlet weak var Valid: UILabel!
        @IBOutlet weak var Nextbtn: UIButton!
        @IBOutlet weak var Please: UITextField!
        override func viewDidLoad() {
            super.viewDidLoad()
            
            Please.addLeftPadding()
            
            xbtn.isHidden = true
            
            Nextbtn.isEnabled = false
            Please.delegate = self
            
            Nextbtn.layer.cornerRadius = 5
            Valid.isHidden = true
             Nextbtn.backgroundColor = UIColor(red:217/255, green:217/255, blue:217/255, alpha: 1)
       
        }
        
    @IBAction func xbtn(_ sender: Any) {
        Please.text = ""
    }
    @IBAction func back(_ sender: Any) {
            dismiss(animated: true, completion: nil)
        }
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
              self.view.endEditing(true)
        }
      
    @IBAction func textchange(_ sender: Any) {
        if Please.text == "" {
              xbtn.isHidden = true
        }else{
              xbtn.isHidden = false
        }
        
        if isValidEmail(testStr: Please.text!) == true{

            self.Nextbtn.backgroundColor = UIColor(red:162/255, green:32/255, blue:58/255, alpha: 1)
            Nextbtn.isEnabled = true
            Valid.isHidden = true
        
        }else{
            Valid.isHidden = false
        }
    }
    @IBAction func Nextbtn(_ sender: Any) {

            emaill = Please.text!
 
        }
        //이메일 형식 맞는지 검사하는 함수
        func isValidEmail(testStr:String) -> Bool {
            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
            return emailTest.evaluate(with: testStr)
    }
    }

