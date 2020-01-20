//
//  ForgotPassword.swift
//  Brandiary
//
//  Created by young on 13/07/2019.
//  Copyright © 2019 young. All rights reserved.
//

import UIKit
import FirebaseAuth

var email:String?

class ForgotPassword: UIViewController,UITextFieldDelegate {
    
    

   
    
    @IBOutlet weak var backbtn: UIButton!
    @IBOutlet weak var Valid: UILabel!
    @IBOutlet weak var Nextbtn: UIButton!
    @IBOutlet weak var Please: UITextField!
    @IBOutlet weak var Logo: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        Please.addLeftPadding()
        appdelegate.shouldSupportAllOrientation = false
        xbtn.isHidden = true
        Please.delegate = self
        
        Nextbtn.layer.cornerRadius = 5
        Valid.isHidden = true
         Nextbtn.isEnabled = false
         Nextbtn.backgroundColor = UIColor(red:217/255, green:217/255, blue:217/255, alpha: 1)
        
        
        
        backbtn.layer.borderColor = UIColor(red:217/255, green:217/255, blue:217/255, alpha: 1).cgColor
             backbtn.layer.borderWidth = 0.5
             //둥글게
             backbtn.layer.cornerRadius = 5
        let tap = UITapGestureRecognizer(target: self, action: #selector(ForgotPassword.tapFunction))

                      //원하는 버튼에 이 두가지 메소드를 추가해준다.
                      xbtn.isUserInteractionEnabled = true
                      xbtn.addGestureRecognizer(tap)
        
   
    }
    @objc
        func tapFunction(sender:UITapGestureRecognizer) {
      Please.text = ""
    }
    @IBOutlet weak var xbtn: UIImageView!
    
    @IBAction func textchange(_ sender: Any) {
        if Please.text == "" {
                              
                              xbtn.isHidden = true
            Valid.isHidden = true
                              
                          }
                          else {
            xbtn.isHidden = false}
        if isValidEmail(testStr: Please.text!) == true{

                          Nextbtn.backgroundColor = UIColor(red:162/255, green:32/255, blue:58/255, alpha: 1)
            Valid.isHidden = true
            Nextbtn.isEnabled = true
        
    }
        else{
            Valid.text = "This is not a valid email format."
            Valid.isHidden = false
        Nextbtn.backgroundColor = UIColor(red:217/255, green:217/255, blue:217/255, alpha: 1)
             Nextbtn.isEnabled = false
        }
    }
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){

           
          self.view.endEditing(true)
    }
  
    @IBAction func Nextbtn(_ sender: Any) {
        
     
        email = Please.text!
        
       
      
        
        if isValidEmail(testStr: Please.text!) == false{
            Valid.isHidden = false
            
            }
    
        else{
            //스토리보드 화면이동
            let view = self.storyboard?.instantiateViewController(withIdentifier: "SentEmail")
            //이동할 때 화면 coverVertical로 보여줘
            view?.modalTransitionStyle = UIModalTransitionStyle.coverVertical
            view?.modalPresentationStyle = .fullScreen
            self.present(view!, animated: true, completion: nil)
            Auth.auth().sendPasswordReset(withEmail: Please.text!) { (error) in
            if error != nil{
                print("fail email")
            }
            else{
                print("send email")
            }

        }
            
    }
    }
    //이메일 형식 맞는지 검사하는 함수
    func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
}
}
