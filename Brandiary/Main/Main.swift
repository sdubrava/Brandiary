//
//  Main.swift
//  Brandiary
//
//  Created by young on 15/07/2019.
//  Copyright © 2019 young. All rights reserved.
//

import UIKit
import FirebaseFirestore
var collectiontags = [[String]]()
var alarmbool = Bool()

class Main: UITableViewController {
    
    
    var users = [UserPost]()
    
    var headerheight = Int()
    var headerheights = [Int : Int]()
    var currentImage = 0
    var getindex : IndexPath?
    var moreless = "more"
    var currentimage = 0
    var moreindex = 100
    var morearray = [Int]()
    
   
      var image = UIImage(named: "logoclear.png")
    override func viewDidLoad() {
        super.viewDidLoad()

        FireStoreService.shared.read(from: .posts, returning: UserPost.self) { (users) in self.users = users
            self.tableView.reloadData()
            print(users)
            print("몇개야? \(users.count)")
        }

        
        
            
        appdelegate.shouldSupportAllOrientation = false
    
        //포스트업데이트 실행
       let imageView = UIImageView(frame: CGRect(x: 100, y: 5, width: 90, height: 0))
        imageView.contentMode = .scaleAspectFit
       
            imageView.image = self.image
            self.navigationItem.titleView = imageView
        self.navigationController?.navigationBar.barTintColor = UIColor.white
        
        if alarmbool == false   {
            let customButton = UIButton.init(frame: CGRect.init(x: 100, y: 100, width: 25, height: 0))
            customButton.setImage(UIImage.init(named:"alarmdot@3x.png"), for: .normal)

                self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(customView: customButton)
                       customButton.addTarget(self, action: #selector(custombutton), for: .touchUpInside)
           
        }
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(Main.respondToSwipeGesture(gesture:)))
              swipeRight.direction = UISwipeGestureRecognizer.Direction.right
             

        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(Main.respondToSwipeGesture(gesture:)))
              swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
              
        
        
        tableView.addGestureRecognizer(swipeLeft)
        tableView.addGestureRecognizer(swipeRight)
        
 
    
    }
    @objc func custombutton(){
        
        let view = self.storyboard?.instantiateViewController(withIdentifier: "Alarm")
                                                                         //이동할 때 화면 coverVertical로 보여줘
                                                                         view?.modalTransitionStyle = UIModalTransitionStyle.coverVertical
                       view?.modalPresentationStyle = .fullScreen
                                                                         self.present(view!, animated: true, completion: nil)
    }
    @IBAction func store(_ sender: Any) {
        print("aaaa")
        tabbarindex = 0
        let view = self.storyboard?.instantiateViewController(withIdentifier: "Store")
                                                                     //이동할 때 화면 coverVertical로 보여줘
                                                                     view?.modalTransitionStyle = UIModalTransitionStyle.coverVertical
                   view?.modalPresentationStyle = .fullScreen
                                                                     self.present(view!, animated: true, completion: nil)
    }
    
    @IBOutlet weak var storebtn: UIBarButtonItem!
    
   
    //포스트 수 대로 보여줘 테이블 뷰에
    override func numberOfSections(in tableView: UITableView) -> Int {
        print("섹션\(users)")
        print(users.count)
        return users.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return 1

    }
    

    //메인셀 정하기
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainCell") as! MainCell
        let user = users[indexPath.section]
        print("유저포스트 \(user.post)")
        let receiveurl = user.post[0]
        let url = URL(string: receiveurl)
                                  if url != nil{
                                    cell.postimg.kf.setImage(with: url)
                                  }
        cell.photonumber.backgroundColor = #colorLiteral(red: 0.3536440134, green: 0.3536530137, blue: 0.3536481857, alpha: 1)
        cell.photonumber.text = "\(currentimage)" + "/" + "\(images.count - 1)"
        cell.selectionStyle = .none

        
        
        return cell
    }
    
  @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {
                    

                    if let swipeGesture = gesture as? UISwipeGestureRecognizer {


                        switch swipeGesture.direction {
                        case UISwipeGestureRecognizer.Direction.left:
                            if currentimage == images.count - 1 {
                                currentimage = 0
    
                            }else{
                                currentimage += 1
                            }
//                            image1 = images[currentimage]
                            
                            tableView.reloadData()

                        case UISwipeGestureRecognizer.Direction.right:
                            if currentimage == 0 {
                                currentimage = images.count - 1
                            }else{
                                currentimage -= 1
                            }
                      
//                             image1 = images[currentimage]
                             tableView.reloadData()
                        default:
                            break
                        }
                    }
    }
   
 
    
    @objc
    func tapFunction(sender:UITapGestureRecognizer) {
        
        let hash:UILabel = (sender.view as! UILabel)
        
        if hash.backgroundColor == UIColor(displayP3Red: 162/255, green: 32/255, blue: 58/255, alpha: 1)
        {
            hash.backgroundColor = UIColor.groupTableViewBackground
                       hash.textColor = UIColor.lightGray
        }
    
            
        else{
            hash.backgroundColor = UIColor(displayP3Red: 162/255, green: 32/255, blue: 58/255, alpha: 1)
                   hash.textColor = UIColor.white
        }
       
        
       
    }
    
    //헤더셀 정하기
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainheaderCell") as! MainheaderCell
        let user = users[section]
        cell.caption.text = user.caption
        if user.caption.count < 100 {
            if section == section {
            cell.morebtn.isHidden = true
        }
        }
        cell.hashtag.text = "\(user.hashtag[0]) \(user.hashtag[2]) \(user.hashtag[2])"
        cell.name.text = user.name
          let receiveurl = user.profile
              let url = URL(string: receiveurl)
                                        if url != nil{
                                          cell.profile.kf.setImage(with: url)
                                        }
        cell.backgroundColor = UIColor.white
        cell.dot.tag = section
        cell.dot.addTarget(self, action:#selector(Main.minedot(_:)) , for: UIControl.Event.touchUpInside)
        cell.profile.layer.cornerRadius = 3
        cell.profile.layer.masksToBounds = true
        cell.caption.numberOfLines = 0
        cell.caption.sizeToFit()
        cell.morebtn.addTarget(self, action:#selector(Main.more(sender:)) , for: UIControl.Event.touchUpInside)
        cell.morebtn.tag = section

        
        for i in morearray{
            if i == section {
                cell.morebtn.isHidden = true
                  }
            
        }
      
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let user = users[section]
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainfooterCell") as! MainfooterCell
        cell.Selectlabel.layer.borderWidth = 1
        cell.Selectlabel.layer.borderColor = UIColor.lightGray.cgColor
        cell.Selectlabel.layer.cornerRadius = 5
        cell.Selectlabel.layer.masksToBounds = true
        cell.sharebtn.tag = section
        cell.sharebtn.addTarget(self, action:#selector(Main.share) , for: UIControl.Event.touchUpInside)
        cell.Boosterbtn.tag = section
        cell.Boosterbtn.addTarget(self, action:#selector(Main.booster) , for: UIControl.Event.touchUpInside)
        cell.collection.tag = section
        collectiontags.append(user.posttags)
        print("콜렉션태그 \(collectiontags)")
        
        return cell
    }
    //부스터
    @objc func booster(_sender: UIButton){
        
        let alertservice = alertService()
        let alert = alertservice.alert()
        present(alert,animated: true,completion: nil)
        
    }
    
    //공유
    @objc func share(_ sender: UIButton){
        let items = [URL(string: "https://www.apple.com")!]
        
        let share = UIActivityViewController(activityItems: items, applicationActivities: nil)
        
        present(share, animated: true, completion: nil)
        
    }
    
    @objc func more(sender: UIButton){
        
        moreindex = sender.tag
        morearray.append(sender.tag)

    if sender.currentTitle == "more"{
        let Font = UIFont.systemFont(ofSize: 12)
        let height = heightForView(text:self.users[moreindex].caption,font: Font, width: 360)
        headerheight = 150 + Int(height)
        headerheights.updateValue(headerheight, forKey: moreindex)
        print(headerheights[moreindex] ?? 215)
        tableView.reloadData()
        }
        }

    func viewselcted(alert: UIAlertAction!){
        let alertservice = BoosteralertService()
        let alert = alertservice.viewselected()
        present(alert,animated: true,completion: nil)
    }
    func areyousurehide(alert: UIAlertAction!){
        present(self.alertcontroller(string: "Are you sure to hide this post?", fontsize: 17, color: UIColor(displayP3Red: 69/255, green: 65/255, blue: 65/255, alpha: 1)), animated: true)
                 }
    func areyousureunfollow(alert: UIAlertAction!){
        present(self.alertcontroller(string: "Are you sure to unfollow?", fontsize: 17, color: UIColor(displayP3Red: 69/255, green: 65/255, blue: 65/255, alpha: 1)), animated: true)
        }
    func areyousuredelete(alert: UIAlertAction!){
        present(self.alertcontroller(string: "Are you sure to delete this post?", fontsize: 17, color: UIColor(displayP3Red: 69/255, green: 65/255, blue: 65/255, alpha: 1)), animated: true)
          }

    func report(alert: UIAlertAction!){
        let alertservice = alertService()
        let alert = alertservice.Reporttable()
        present(alert,animated: true,completion: nil)
    }
    func sharealert(alert: UIAlertAction!){
           let items = [URL(string: "https://www.apple.com")!]
                  
                  let share = UIActivityViewController(activityItems: items, applicationActivities: nil)
                  
                  present(share, animated: true, completion: nil)
       }
    func Edit(index:Int){
        let user = self.users[index]
        self.update(user) { updateUser in
                FireStoreService.shared.update(for: updateUser, in: .posts)
                  }
    }
    
    func update(_ user: UserPost, completion: @escaping (UserPost) -> Void) {
          let alert = UIAlertController(title: "update\(user.name)", message: nil, preferredStyle: .alert)
          
           
          
          alert.addTextField { (ageTF) in
              ageTF.placeholder = "Name"
              ageTF.keyboardType = .alphabet
              ageTF.text = user.name
          }
          let update = UIAlertAction(title: "Update", style: .default) { _ in
              guard let name = alert.textFields?.last?.text else { return }
              var updateduser = user
            updateduser.name = name
              
             completion(updateduser)
          }
          alert.addAction(update)
          present(alert, animated: true)
      }
    func statusviewselect(alert: UIAlertAction!){
                  let alertservice = BoosteralertService()
                  let alert = alertservice.statusviewselect()
             present(alert,animated: true,completion: nil)
              }
    func attributedString(string:String,fontsize:Int,color:UIColor) -> NSAttributedString{
        return NSAttributedString(string:string, attributes: [
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: CGFloat(fontsize)), //your font here
                        NSAttributedString.Key.foregroundColor : color
                        ])
    }
    func alertcontroller(string:String,fontsize:Int,color:UIColor) -> UIAlertController{
        let alertController = UIAlertController(title: "", message: "", preferredStyle: .alert)

                      let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in           // do something
                      }
                      alertController.addAction(cancelAction)

        let OKAction = UIAlertAction(title: "OK", style: .default,handler:nil)
               OKAction.setValue(UIColor(displayP3Red: 162/255, green: 32/255, blue: 58/255, alpha: 1), forKey: "titleTextColor")
               alertController.addAction(OKAction)
               cancelAction.setValue(UIColor(displayP3Red: 174/255, green: 174/255, blue: 174/255, alpha: 1), forKey: "titleTextColor")
               alertController.view.subviews.first?.subviews.first?.subviews.first?.backgroundColor = UIColor.white
                   alertController.setValue(self.attributedString(string: string, fontsize: fontsize, color: color), forKey: "attributedTitle")
        return alertController
    }

    

    //점 세개
    @objc func dot(_ sender: UIButton){
      
        let title = UIAlertController(title: nil , message: nil, preferredStyle: UIAlertController.Style.actionSheet)
        let view = UIAlertAction(title: "View selected tag", style: .default,handler: viewselcted(alert:))
        let copy = UIAlertAction(title: "Share", style: .default, handler: sharealert(alert:))
        let Report = UIAlertAction(title: "Share", style: .default, handler: report(alert:))
        let unfollow = UIAlertAction(title: "Unfollow", style: .default, handler: areyousureunfollow(alert:))
        let hide = UIAlertAction(title: "Hide this contents", style: .default, handler: areyousurehide(alert:))
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        title.view.tintColor = UIColor(displayP3Red: 72/255, green: 72/255, blue: 72/255, alpha: 1)
        title.addAction(view)
        title.addAction(copy)
        title.addAction(Report)
        title.addAction(unfollow)
        title.addAction(hide)
        title.addAction(cancel)

        self.present(title, animated: true, completion: nil)

        //알럴트 뷰 둥글게
         let backView = title.view.subviews.last?.subviews.first
         backView?.layer.cornerRadius = 14
         backView?.backgroundColor = UIColor.white
    }
    @objc func minedot(_ sender: UIButton){
              //알러트뷰로 했을때
          
              let title = UIAlertController(title: nil , message: nil, preferredStyle: UIAlertController.Style.actionSheet)
              let view = UIAlertAction(title: "View selected tag", style: .default,handler: viewselcted(alert:))
              let status = UIAlertAction(title: "View status of using booster items", style: .default, handler: statusviewselect(alert:))
              let share = UIAlertAction(title: "Share", style: .default, handler: sharealert(alert:))
                     let Edit = UIAlertAction(title: "Edit", style: .default, handler: {action in  let user = self.users[sender.tag]
                          self.update(user) { updateUser in
                                  FireStoreService.shared.update(for: updateUser, in: .posts)
                                    }})
        let Delete = UIAlertAction(title: "Delete", style: .default, handler: {action in   let alertController = UIAlertController(title: "Are you sure to delete this post?", message: "", preferredStyle: .alert)

               let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in           // do something
               }
               alertController.addAction(cancelAction)

               let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in let user = self.users[sender.tag]
                                    FireStoreService.shared.delete(user, in: .users)      }
               OKAction.setValue(UIColor(displayP3Red: 162/255, green: 32/255, blue: 58/255, alpha: 1), forKey: "titleTextColor")
               alertController.addAction(OKAction)
               cancelAction.setValue(UIColor(displayP3Red: 174/255, green: 174/255, blue: 174/255, alpha: 1), forKey: "titleTextColor")
               alertController.view.subviews.first?.subviews.first?.subviews.first?.backgroundColor = UIColor.white
            alertController.setValue(self.attributedString(string: "Are you sure to delete this post?", fontsize: 17, color: UIColor(displayP3Red: 69/255, green: 65/255, blue: 65/255, alpha: 1)), forKey: "attributedTitle")

            self.present(alertController, animated: true)})
        
              let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
              
              title.view.tintColor = UIColor(displayP3Red: 72/255, green: 72/255, blue: 72/255, alpha: 1)
              title.addAction(view)
              title.addAction(status)
              title.addAction(share)
              title.addAction(Edit)
              title.addAction(Delete)
              title.addAction(cancel)

              self.present(title, animated: true, completion: nil)

              //알럴트 뷰 둥글게
               let backView = title.view.subviews.last?.subviews.first
               backView?.layer.cornerRadius = 14
               backView?.backgroundColor = UIColor.white
          }
    
    //헤더 길이 정하기
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        for i in morearray{
            if i == section {
                return CGFloat(headerheights[section] ?? 195)
            }
            
         }
        return 195
        
    }
    
    //푸터 길이 정하기
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        205
    }

      

    //가운데 셀 길이 정하기
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 375
        
    }
}







