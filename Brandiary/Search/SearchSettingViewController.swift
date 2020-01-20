//
//  SearchSettingViewController.swift
//  Brandiary
//
//  Created by young on 10/10/2019.
//  Copyright © 2019 young. All rights reserved.
//

import UIKit

class SearchSettingViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    var plustapnumber = 0
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        plustapnumber
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collection.dequeueReusableCell(withReuseIdentifier: "SettingSearchCell", for: indexPath) as! SettingSearchCell
        
        cell.label.layer.borderWidth = 1
        cell.label.layer.borderColor = UIColor(displayP3Red: 217/255, green: 217/255, blue: 217/255, alpha: 1).cgColor
        cell.label.layer.cornerRadius = 4
        cell.label.layer.masksToBounds = true
        cell.xbtn.addTarget(self, action:#selector(SearchSettingViewController.xbtn(_sender:)) , for: UIControl.Event.touchUpInside)
        return cell
    }
    
    @IBAction func textchange(_ sender: Any) {
        if tagSearchbar.text == "" {
             plusbtn.setImage(UIImage(named: "justplus.png"), for: .normal)
            plusbtn.isEnabled = false
        }else{
             addtextimage(text: tagSearchbar, image: UIImage(named: "icons8-keyboard.png")!)
             plusbtn.setImage(UIImage(named: "plusOn@3x.png"), for: .normal)
            plusbtn.isEnabled = true
        }
    }
    @objc func xbtn(_sender : UIButton){
        
        if plustapnumber > 0{
        plustapnumber = plustapnumber - 1
        collection.reloadData()
        }
        
    }

    @IBAction func back(_ sender: Any) {
    dismiss(animated: true, completion: nil)

    }


    //uislider 고정하기
    @IBAction func valuechange(_ sender: Any) {
        if tagbar.value < 0.1 {
            tagbar.value = 0.1
        }else if tagbar.value>0.9{
            tagbar.value = 0.9
        }
    }
    
    
    @IBOutlet weak var collection: UICollectionView!
    
  
   
    @IBOutlet weak var plusbtn: UIButton!
  
    @IBOutlet weak var youareintersted: UILabel!
    @IBOutlet weak var tentag: UILabel!
    @IBOutlet weak var youare: UILabel!
    @IBOutlet weak var tagSearchbar: UITextField!
    @IBOutlet weak var settheinterested: UILabel!
    @IBOutlet weak var newtag: UILabel!
    @IBOutlet weak var interstedtag: UILabel!
    @IBOutlet weak var tagbar: UISlider!
    @IBOutlet weak var interested: UILabel!
    @IBOutlet weak var SettingSearch: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        plusbtn.setImage(UIImage(named: "justplus.png"), for: .normal)
        plusbtn.isEnabled = false
        if tagbar.value < 0.1 {
            tagbar.isEnabled = false
        }

       
        
        let imageView = UIImageView(frame: CGRect(x: 80, y: 0, width: 300, height: 30))
           imageView.contentMode = .scaleAspectFit
           let image = UIImage(named: "logo1.png")
           imageView.image = image
           navigationItem.titleView = imageView
           
           self.navigationController?.navigationBar.barTintColor = UIColor.white
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){

          self.view.endEditing(true)
    }
    
 
    @IBAction func plus(_ sender: Any) {
        if plustapnumber <= 9{
        plustapnumber = plustapnumber + 1
            tagSearchbar.text = ""
        collection.reloadData()
        }
    }
    
    func addtextimage(text: UITextField,image:UIImage) {
          let padding = 7
          //오른쪽에 패딩넣으려면 이거 width를 늘려주면 된다.
          let leftimage = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 18))
          let paddingimage = UIImageView(frame: CGRect(x: padding, y: 0, width: 15, height: 17))
          paddingimage.image = image
          leftimage.addSubview(paddingimage)
          text.leftView = leftimage
          text.leftViewMode = .always
      }

    
    func cornerRadius(view: UIView){
        view.layer.cornerRadius = 4
        view.layer.masksToBounds = true
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(red:217/255, green:217/255, blue:217/255, alpha: 1).cgColor
    }
    

}
