//
//  Writefinal.swift
//  Brandiary
//
//  Created by young on 16/10/2019.
//  Copyright © 2019 young. All rights reserved.
//

import UIKit
import FirebaseFirestore
import FirebaseStorage

class Writefinal:UIViewController,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate {
    var textarray = ["","",""]
    var plusviewtapnumber = 0
    var textfieldtext = String()
    var caption = String()
    var writeimagearray = [UIImage]()
    var map = String()
    var withperson = String()
    var hashtag = [String]()
    var count1 = 0
    var count2 = 0
    var plusviewheight = 65
    
    
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 3 + plusviewtapnumber
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "WritefinalCell") as! WritefinalCell
        cell.xbtn.tag = indexPath.row
        cell.tagtext.addTarget(self, action: #selector(Writefinal.text(_:)), for: .editingChanged)
           cell.tagtext.text = textarray[indexPath.row]
           cell.tagtext.delegate = self
           cell.tagtext.tag = indexPath.row
        cell.xbtn.addTarget(self, action: #selector(Writefinal.xbtn), for: UIControl.Event.touchUpInside)
        for i in 0...textarray.count-1 {
            if textarray[i] != "" {
                if indexPath.row == i {
                    cell.xbtn.setImage(UIImage(named: "x@3x.png"), for: .normal)
                }
            } else {
                if indexPath.row == i {
                    cell.xbtn.setImage(UIImage(named: "garyx@3x.png"), for: .normal)
                }
            }
        }
     

        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let cell = table.dequeueReusableCell(withIdentifier: "WritefinalfooterCell") as! WritefinalfooterCell
        
        let tap1: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(Writefinal.plusviewtap))
        cell.cellview.addGestureRecognizer(tap1)
        

        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 65
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        CGFloat(plusviewheight)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        table.contentSize.height = 200
   
    }
  
      @objc func xbtn(_ sender: UIButton) {
        plusviewheight = 65
        if plusviewtapnumber > 0 {
            textarray.remove(at: sender.tag)
            plusviewtapnumber = plusviewtapnumber-1
             
        } else{
            textarray[sender.tag] = ""
            sender.setImage(UIImage(named: "grayx@3x"), for: .normal)
            self.donebtn.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.968627451, alpha: 1)
                                  self.donebtn.setTitleColor(#colorLiteral(red: 0.7370592952, green: 0.7370767593, blue: 0.7370672822, alpha: 1), for: .normal)
                                   self.donebtn.isEnabled = false
        }
        table.reloadData()
    
      }
    @IBAction func text(_ sender: UITextField) {
         textarray[sender.tag] = sender.text!
        
         print(textarray)
        
     for i in 0...textarray.count-1{
                  if textarray[i] == "" {
                     count2 = count2 + 1
        }
         }
        if count2 == 0{
            self.donebtn.backgroundColor = UIColor(displayP3Red: 162/255, green: 32/255, blue: 58/255, alpha: 1)
            self.donebtn.setTitleColor(UIColor.white, for: .normal)
            self.donebtn.isEnabled = true
        } else{
            self.donebtn.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.968627451, alpha: 1)
            self.donebtn.setTitleColor(#colorLiteral(red: 0.7370592952, green: 0.7370767593, blue: 0.7370672822, alpha: 1), for: .normal)
             self.donebtn.isEnabled = false
        }
        count2 = 0
      
        }
        
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
         let currentText = textField.text ?? ""
           guard let stringRange = Range(range, in: currentText) else { return false }
        
           let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
        
           return updatedText.count <= 16
    }
    @IBAction func done(_ sender:UIButton){
        tabbarindex = 0
        writeimagesarray.removeAll()
        writeimages.removeAll()
        nextlocation = false
        nextperson = false
        nextalbum = false
        writetextsarray.removeAll()
        
        add { user in
            print("뭐냐 캡션아\(user.caption)")
               }
        let view = self.storyboard?.instantiateViewController(withIdentifier: "tabbar")
                  view?.modalTransitionStyle = UIModalTransitionStyle.coverVertical
         view?.modalPresentationStyle = .fullScreen
        self.present(view!, animated: true, completion: nil)
        writecaption = ""
       
        
    }
    
     func add(completion: @escaping (UserPost) -> Void) {
        let name = "Fomagran"
        let hashtag = ["Brandiary","sdfds","asdf"]
         let profile = "https://firebasestorage.googleapis.com/v0/b/brandiary-fad4e.appspot.com/o/profile%2Ffomagran?alt=media&token=393bfceb-7af2-4860-ba98-a672b0535833"
        let place = "Some Place"
        let withperson = "With Fomagran"
        let post = writeimageurl
        let posttags = textarray
        
       let userPost = UserPost(name: name, hashtag: hashtag, profile: profile, caption: writecaption, place: place, withperson: withperson, post: post, posttags: posttags)
        
         
          completion(userPost)
        FireStoreService.shared.create(for: userPost, in: .posts)
      
      }
    
    
    
    @IBOutlet weak var donebtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(Writefinal.close))
            view.addGestureRecognizer(tap)
        
        self.donebtn.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.968627451, alpha: 1)
               self.donebtn.setTitleColor(#colorLiteral(red: 0.7370592952, green: 0.7370767593, blue: 0.7370672822, alpha: 1), for: .normal)
        table.isScrollEnabled = false
    
        
        if writeimages.count != 0 {
        for i in 0...writeimages.count - 1{
        let storageRef = Storage.storage().reference().child("post/\(writeimagename[i])")
                  let imgdata = writeimages[i].jpegData(compressionQuality: 0.5)!
                  let metadata = StorageMetadata()
                  metadata.contentType = "image/jpeg"
                  storageRef.putData(imgdata, metadata: metadata,completion: { (metadata,error) in
                      if error == nil {
                          print("Success")
                          storageRef.downloadURL { (url, error) in
                              writeimageurl.append("\(url!)")
                            print("\(url!)")
                          }
                          return
                      }
                      else{
                          print("error")
                      }
                  })
        }
        }
        writeimagename.removeAll()
    }
    
    
    @objc func plusviewtap() {
        print(textarray)
        if plusviewtapnumber == 4{
            plusviewheight = 0
        }
        if plusviewtapnumber >= 5 {
            plusviewtapnumber = 5
        }
        else {
            textarray.append("")
            plusviewtapnumber += 1
            self.donebtn.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.968627451, alpha: 1)
                       self.donebtn.setTitleColor(#colorLiteral(red: 0.7370592952, green: 0.7370767593, blue: 0.7370672822, alpha: 1), for: .normal)
                        self.donebtn.isEnabled = false
            
        }
        print(plusviewtapnumber)
    
        table.reloadData()
       }
    @objc func close() {
        self.table.endEditing(true)
    }
    
    @IBAction func back(_ sender: Any) {
        NotificationCenter.default.post(name: NSNotification.Name("back"), object: nil)
        dismiss(animated: true, completion: nil)
       
    }
    @IBOutlet weak var table: UITableView!
    
  

}
