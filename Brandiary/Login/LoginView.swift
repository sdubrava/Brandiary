//
//  LoginView.swift
//  Brandiary
//
//  Created by young on 13/07/2019.
//  Copyright © 2019 young. All rights reserved.
//

import UIKit
import FirebaseCore
import GoogleSignIn
import Firebase
import FBSDKLoginKit
import FBSDKCoreKit
import TwitterKit
import AuthenticationServices

var users = [String : String]()
let twitterkey = "SfzVDI0EhcJhGB9I8u56d4azK"
let twittersecret = "JTchzxCr5N9OFGTYjaU2NCBQesWidV9IY0zj56WWIWHWRbudBO"



@available(iOS 13.0, *)
class LoginView: UIViewController,UITextFieldDelegate,LoginButtonDelegate{

    var email = String()
    

    @IBAction func apple(_ sender: Any) {
        let provider = ASAuthorizationAppleIDProvider()
                let request = provider.createRequest()
                request.requestedScopes = [.fullName, .email]
            let controller = ASAuthorizationController(authorizationRequests: [request])
                controller.delegate = self
                controller.performRequests()
      
         }
    
    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
        print("성공")
    }
    
    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
        print("logout")
    }
    

    
 
    
    @IBAction func googleSignin(_ sender: Any) {
        GIDSignIn.sharedInstance()?.presentingViewController = self
               GIDSignIn.sharedInstance().signIn()
    }


    
    
    
    @IBOutlet weak var apple: UIButton!
    @IBOutlet weak var eyebtn: UIButton!
    @IBOutlet weak var Valid: UILabel!
    @IBOutlet weak var SignUp: UIButton!
    @IBOutlet weak var FindPassword: UIButton!
    @IBOutlet weak var twitter: UIButton!
    @IBOutlet weak var google: GIDSignInButton!
    @IBOutlet weak var facebook: FBLoginButton!
    @IBOutlet weak var Password: UITextField!
    @IBOutlet weak var Email: UITextField!
    @IBOutlet weak var Logo: UIImageView!
    @IBOutlet weak var Signinbtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        appdelegate.shouldSupportAllOrientation = false
        apple.layer.borderWidth = 1
        apple.layer.borderColor = UIColor(displayP3Red: 217/255, green: 217/255, blue: 217/255, alpha: 1).cgColor
        apple.layer.cornerRadius = 5
        apple.layer.masksToBounds = true

        //버튼 모서리 둥글게
        Signinbtn.layer.cornerRadius = 5
        //글씨 숨기기
        Valid.isHidden = true
        
        //이미지 넣기
        addtextimage2(text: Email, image: UIImage(named: "message@3x.png")!)
        addtextimage1(text: Password, image: UIImage(named: "passwordOn@3x.png")!)
        
        
        users.updateValue("dksdudgns156!", forKey: "fomagran6@naver.com")
        users.updateValue("dudgns156!", forKey: "defelllo6@gmail.com")
        
        Password.isSecureTextEntry = true
        
        Signinbtn.backgroundColor = UIColor(red:217/255, green:217/255, blue:217/255, alpha: 1)
        
        Email.delegate = self
        
        
        
        
        
    }
    
  
    
   
    func isValidEmail(testStr:String) -> Bool {
                let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
                let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
                return emailTest.evaluate(with: testStr)
        }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
         
           self.view.endEditing(true)

    }
    
    @IBAction func FindPassword(_ sender: Any) {
        
        let view = self.storyboard?.instantiateViewController(withIdentifier: "ForgotPassword")
                                           //이동할 때 화면 coverVertical로 보여줘
                                           view?.modalTransitionStyle = UIModalTransitionStyle.coverVertical
                                           self.present(view!, animated: true, completion: nil)
    }
    
    @IBAction func textchange(_ sender: Any) {
        if Email.text! != "" && Password.text! != ""{
                           
                           Signinbtn.backgroundColor = UIColor(red:162/255, green:32/255, blue:58/255, alpha: 1)
                    }
                       else{
                            Signinbtn.backgroundColor = UIColor(red:217/255, green:217/255, blue:217/255, alpha: 1)
                       }
    }
    //텍스트필드안에 이미지 넣기
    func addtextimage(text: UITextField,image:UIImage) {
        let leftimage = UIImageView(frame: CGRect(x: 0, y: 0, width: image.size.width, height: image.size.height))
        leftimage.image = image
        text.leftView = leftimage
        text.leftViewMode = .always
    }//addtextimage
    
    func addrighttextimage(text: UITextField,image:UIImage) {
        let leftimage = UIImageView(frame: CGRect(x: 0, y: 0, width: image.size.width, height: image.size.height))
        leftimage.image = image
        text.rightView = leftimage
        text.rightViewMode = .always
    }//addtextimage
    
    //텍스트필드 이미지에 패딩 넣기
    func addtextimage1(text: UITextField,image:UIImage) {
        let padding = 10
        let ypadding = 2
        //오른쪽에 패딩넣으려면 이거 width를 늘려주면 된다.
        let leftimage = UIView(frame: CGRect(x: 0, y: 0, width: 37, height: 30))
        let paddingimage = UIImageView(frame: CGRect(x: padding, y: ypadding, width: 25, height: 25))
        paddingimage.image = image
        leftimage.addSubview(paddingimage)
        text.leftView = leftimage
        text.leftViewMode = .always
    }//addtextimage
    func addtextimage2(text: UITextField,image:UIImage) {
           let padding = 12
           let ypadding = 7
           //오른쪽에 패딩넣으려면 이거 width를 늘려주면 된다.
           let leftimage = UIView(frame: CGRect(x: 0, y: 0, width: 37, height: 30))
           let paddingimage = UIImageView(frame: CGRect(x: padding, y: ypadding, width: 20, height: 15))
           paddingimage.image = image
           leftimage.addSubview(paddingimage)
           text.leftView = leftimage
           text.leftViewMode = .always
       }//addtextimage
    @IBAction func eye(_ sender: Any) {
        if Password.isSecureTextEntry == true {
            self.eyebtn.setImage(UIImage(named:"eyeOn@3x.png"), for: .normal)
            Password.isSecureTextEntry = false
        }
        else {
             self.eyebtn.setImage(UIImage(named:"noeye.png"), for: .normal)
             Password.isSecureTextEntry = true
        }
        
    }
    
    
    
    @IBAction func Signin(_ sender: Any) {
        tabbarindex = 0
        
        var email = String()
        
        Auth.auth().signIn(withEmail: Email.text!, password: Password.text!) { (user, error) in
                    
            email = self.Email.text!
                    if user != nil{
                        
                        let view = self.storyboard?.instantiateViewController(withIdentifier: "tabbar")
                                    //이동할 때 화면 coverVertical로 보여줘
                                    view?.modalTransitionStyle = UIModalTransitionStyle.coverVertical
                        view?.modalPresentationStyle = .fullScreen
                                    self.present(view!, animated: true, completion: nil)
                        print("login success")
                        
                        
                        
                                //파이어스토어 데이터 읽기
                        let db = Firestore.firestore()
                        let ref = db.collection("users").document(email)
                        
                        ref.getDocument(source: .cache) { (document, error) in
                            if let document = document{
                                let name = document.get("name")
                                let email = document.get("email")
                                 let profile = document.get("profile")
                                print("이름이뭐에요?\(name!)")
                                print(email!)
                                UserDefaults.standard.set(name, forKey: "name")
                                UserDefaults.standard.set(email, forKey: "email")
                                if profile != nil{
                                UserDefaults.standard.set(profile, forKey: "profile")
                                }
                                else{ UserDefaults.standard.set("https://firebasestorage.googleapis.com/v0/b/brandiary-fad4e.appspot.com/o/photo%403x.png?alt=media&token=600606e4-b3d5-4963-ae42-443e300eb22a", forKey: "profile")
                                }
                            }else{
                                print(error!)
                            }
                        }
                        
                        UserDefaults.standard.set(true, forKey: "Login")
                        
                    }

                    else{

                        self.Valid.isHidden = false

                    }
    
        }
        
        

    
        
        
    }
    
    @IBAction func twitter(_ sender: Any) {
        
        TWTRTwitter.sharedInstance().logIn { (session, error) in
            if session != nil{
                print("success","\(session?.userID ?? "")","\(session?.userName ?? "")")
                let view = self.storyboard?.instantiateViewController(withIdentifier: "tabbar")
                                   //이동할 때 화면 coverVertical로 보여줘
                                   view?.modalTransitionStyle = UIModalTransitionStyle.coverVertical
                                   self.present(view!, animated: true, completion: nil)
                
            }
            else{
                print("fail")
            }
        }
        
      
    }
    
        
    @IBAction func facebook(_ sender: Any) {
        
        let fbmanager : LoginManager = LoginManager()
        fbmanager.logIn(permissions: ["email"], from: self) { (result, error) in
            if (error == nil){
                let fbloginresult:LoginManagerLoginResult = result!
                if fbloginresult.grantedPermissions != nil {
                    if(fbloginresult.grantedPermissions.contains("email")){
                        print("userdata")
                    }
                }
            }
        }
        
    }
    
}

class UnderlinedLabel: UILabel {

override var text: String? {
    didSet {
        guard let text = text else { return }
        let textRange = NSMakeRange(0, text.count)
        let attributedText = NSMutableAttributedString(string: text)
        attributedText.addAttribute(NSAttributedString.Key.underlineStyle , value: NSUnderlineStyle.single.rawValue, range: textRange)
        // Add other attributes if needed
        self.attributedText = attributedText
        }
    }
}


//애플 로그인 익스텐션
@available(iOS 13.0, *)
extension LoginView : ASAuthorizationControllerDelegate {
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print("apple error")
    }
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        switch authorization.credential {
        case let credentials as ASAuthorizationAppleIDCredential:
            print(credentials.user,credentials.fullName ?? "",credentials.email ?? "")
            break
        default : break
        }
    }

    }

@available(iOS 13.0, *)
extension LoginView :ASAuthorizationControllerPresentationContextProviding {
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return view.window!
    }

}


