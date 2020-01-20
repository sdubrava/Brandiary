//
//  EditprofileViewContoller.swift
//  Brandiary
//
//  Created by young on 05/10/2019.
//  Copyright © 2019 young. All rights reserved.
//

import UIKit
import FirebaseStorage
import Firebase


class EditprofileViewContoller: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBAction func back(_ sender: Any) {
       self.navigationController?.popViewController(animated: true)
    }
    
    @IBOutlet weak var whiteline: UILabel!
    @IBOutlet weak var namevalid: UILabel!
    @IBOutlet weak var informview: UIView!
    @IBOutlet weak var polygonview: UIView!
    @IBOutlet weak var stack1: UIStackView!
    @IBOutlet weak var switchbtn: UISwitch!
    @IBOutlet weak var document: UILabel!
    @IBOutlet weak var privateaccount: UILabel!
    @IBOutlet weak var line2: UILabel!
    @IBOutlet weak var Emailtext: UITextField!
    @IBOutlet weak var Email: UILabel!
    @IBOutlet weak var line1: UILabel!
    @IBOutlet weak var nametext: UITextField!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var Changeprofile: UIButton!
    @IBOutlet weak var profileimage: UIImageView!
    @IBOutlet weak var informbtn: UIButton!
    @IBOutlet weak var polygonbtn: UIButton!
    @IBOutlet weak var Personbtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        informbtn.roundedButton()
               polygonbtn.roundedButton()
               Personbtn.roundedButton()
        namevalid.isHidden = true
        let url = URL(string: UserDefaults.standard.string(forKey: "profile") ?? "")
              if url != nil{
              profileimage.kf.setImage(with: url)
              }
        
        Emailtext.isEnabled = false
        nametext.text = "fomagran"
        Emailtext.text = "fomagran6@naver.com"
//        nametext.text = UserDefaults.standard.string(forKey: "name")
//        Emailtext.text = UserDefaults.standard.string(forKey: "email")
        profileimage.layer.cornerRadius = 5
        profileimage.layer.masksToBounds = true
        
        switchbtn.transform = CGAffineTransform(scaleX:0.7, y: 0.6)
        
        Personbtn.backgroundColor = UIColor.white
            polygonbtn.backgroundColor = UIColor(displayP3Red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
            informbtn.backgroundColor = UIColor(displayP3Red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
           

        polygonview.isHidden = true
        informview.isHidden = true
        
       
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){

          self.view.endEditing(true)
        
    }
    
    @IBAction func Done(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        
//        let db = Firestore.firestore()
//        let ref = db.collection("users").document(UserDefaults.standard.string(forKey: "email") ?? "")
//        ref.updateData(["profile" : UserDefaults.standard.string(forKey:"profile") ?? ""])
        
    }
    
    @IBAction func personbtn(_ sender: Any) {
        polygonview.isHidden = true
               informview.isHidden = true
       Personbtn.backgroundColor = UIColor.white
          polygonbtn.backgroundColor = UIColor(displayP3Red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
          informbtn.backgroundColor = UIColor(displayP3Red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
  
        
        Personbtn.setImage(UIImage(named: "defaultOn.png"), for: .normal)
              polygonbtn.setImage(UIImage(named: "myoctagonNon@3x.png.png"), for: .normal)
              informbtn.setImage(UIImage(named: "informNon.png"), for: .normal)
    }
    
    @IBAction func polygonbtn(_ sender: Any) {
        polygonview.isHidden = false
        informview.isHidden = true
        
        polygonbtn.backgroundColor = UIColor.white
          Personbtn.backgroundColor = UIColor(displayP3Red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
          informbtn.backgroundColor = UIColor(displayP3Red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        
          
        
          Personbtn.setImage(UIImage(named: "defaultNon.png"), for: .normal)
               polygonbtn.setImage(UIImage(named: "myoctagonOn@3x.png"), for: .normal)
               informbtn.setImage(UIImage(named: "informNon.png"), for: .normal)
    }
    
    @IBAction func changeprofile(_ sender: Any) {
        let picker = UIImagePickerController()
                picker.delegate = self
               picker.sourceType = .photoLibrary
               picker.allowsEditing = true
               present(picker, animated: true, completion: nil)
        
    }
    internal func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
           if let editedImage = info[.editedImage] as? UIImage{
            profileimage.image = editedImage
            let username =  UserDefaults.standard.string(forKey: "name")
            let storageRef = Storage.storage().reference().child("profile/\(username!)")
            let imgdata = editedImage.jpegData(compressionQuality: 0.5)!
                   let metadata = StorageMetadata()
                   metadata.contentType = "image/jpeg"
                   storageRef.putData(imgdata, metadata: metadata,completion: { (metadata,error) in
                       if error == nil {
                       print("Success")
                           storageRef.downloadURL { (url, error) in
                            print(url!)
                            UserDefaults.standard.set("\(url!)"
                                , forKey: "profile")
                           }
                       return
                       }
                       else{
                           print("error")
                       }
                       
                   })
               picker.dismiss(animated: false)
           }
         
       }
    @IBAction func informbtn(_ sender: Any) {
        informview.isHidden = false
        polygonview.isHidden = true
        
        informbtn.backgroundColor = UIColor.white
          polygonbtn.backgroundColor = UIColor(displayP3Red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
          Personbtn.backgroundColor = UIColor(displayP3Red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
         

        Personbtn.setImage(UIImage(named: "defaultNon.png"), for: .normal)
              polygonbtn.setImage(UIImage(named: "myoctagonNon@3x.png.png"), for: .normal)
              informbtn.setImage(UIImage(named: "informOn.png"), for: .normal)
    }
    func isEnglish(text:String) -> Bool {
        let Englishregex = "[A-Z0-9a-z]{1,}"
        let EnglishTest = NSPredicate(format:"SELF MATCHES %@", Englishregex)
        return EnglishTest.evaluate(with: text)
    }

    @IBAction func nametextchange(_ sender: Any) {
        if isEnglish(text: nametext.text!) == true {
                                  
          namevalid.isHidden = true
                
                              }
             else if nametext.text! == ""{
             namevalid.isHidden = true
        }
                  else {
                      namevalid.isHidden = false
             
                         }
    }
    
}

extension UISwitch {

    func set(width: CGFloat, height: CGFloat) {

        let standardHeight: CGFloat = 31
        let standardWidth: CGFloat = 49

        let heightRatio = height / standardHeight
        let widthRatio = width / standardWidth

        transform = CGAffineTransform(scaleX: widthRatio, y: heightRatio)
    }
}
