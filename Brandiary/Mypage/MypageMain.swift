//
//  MypageMain.swift
//  Brandiary
//
//  Created by young on 10/08/2019.
//  Copyright © 2019 young. All rights reserved.
//

import UIKit




class MypageMain: UIViewController,UITableViewDataSource,UITableViewDelegate {

    
  
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    
   
    
    @IBOutlet weak var tableview: UITableView!
    //포스트 업데이트
    func fetchPosts()
    {
        self.posts = Post.fetchPosts()
        tableview.reloadData()
    }
    //포스트 수 대로 보여줘 테이블 뷰에
    func numberOfSections(in tableView: UITableView) -> Int {
        if let posts = posts {
            return posts.count
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
        
    }
    

    //메인셀 정하기
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainCell", for: indexPath) as! MainCell

        
        //섹션 자리에 있는 포스트를 쓸게
        cell.post = self.posts?[indexPath.section]
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
                                            
                                            tableview.reloadData()

                                        case UISwipeGestureRecognizer.Direction.right:
                                            if currentimage == 0 {
                                                currentimage = images.count - 1
                                            }else{
                                                currentimage -= 1
                                            }
                                      
                //                             image1 = images[currentimage]
                                             tableview.reloadData()
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
   func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
           let cell = tableView.dequeueReusableCell(withIdentifier: "MainfooterCell") as! MainfooterCell
           cell.Selectlabel.layer.borderWidth = 1
                  cell.Selectlabel.layer.borderColor = UIColor.lightGray.cgColor
                  
                  cell.Selectlabel.layer.cornerRadius = 5
                  cell.Selectlabel.layer.masksToBounds = true
                  
                  
                  cell.sharebtn.tag = section
                  cell.sharebtn.addTarget(self, action:#selector(Main.share) , for: UIControl.Event.touchUpInside)
                  
                  cell.Boosterbtn.tag = section
                  cell.Boosterbtn.addTarget(self, action:#selector(Main.booster) , for: UIControl.Event.touchUpInside)
           return cell
       }
    
    //헤더셀 정하기
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainheaderCell") as! MainheaderCell
        
        //섹션 자리에 있는 포스트를 쓸게
        cell.post = self.posts?[section]
        cell.backgroundColor = UIColor.white
        cell.dot.tag = section
        cell.dot.addTarget(self, action:#selector(Main.dot) , for: UIControl.Event.touchUpInside)
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
           let height = heightForView(text:self.posts![moreindex].caption!, font: Font, width: 360)
           headerheight = 170 + Int(height)
           headerheights.updateValue(headerheight, forKey: moreindex)
           print(self.posts![moreindex].caption!)
           print(headerheights[moreindex] ?? 215)
           tableview.reloadData()
           }
           }
        
        

    
    func share(alert: UIAlertAction!){
        let items = [URL(string: "https://www.apple.com")!]
                         
                         let share = UIActivityViewController(activityItems: items, applicationActivities: nil)
                         
                         present(share, animated: true, completion: nil)
                   
    }
    func viewselcted(alert: UIAlertAction!){
        let alertservice = BoosteralertService()
        let alert = alertservice.viewselected()
        present(alert,animated: true,completion: nil)
    }
    func statusviewselect(alert: UIAlertAction!){
           let alertservice = BoosteralertService()
           let alert = alertservice.statusviewselect()
           present(alert,animated: true,completion: nil)
       }
     func areyousurehide(alert: UIAlertAction!){
          let alertController = UIAlertController(title: "Are you sure to hide this post?", message: "", preferredStyle: .alert)

          let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in           // do something
          }
          alertController.addAction(cancelAction)

          let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
      }
          OKAction.setValue(UIColor(displayP3Red: 162/255, green: 32/255, blue: 58/255, alpha: 1), forKey: "titleTextColor")
          alertController.addAction(OKAction)
          cancelAction.setValue(UIColor(displayP3Red: 174/255, green: 174/255, blue: 174/255, alpha: 1), forKey: "titleTextColor")
          alertController.view.subviews.first?.subviews.first?.subviews.first?.backgroundColor = UIColor.white
          let attributedString = NSAttributedString(string: "Are you sure to unfollow?", attributes: [
                NSAttributedString.Key.font : UIFont.systemFont(ofSize: 17), //your font here
                NSAttributedString.Key.foregroundColor : UIColor(displayP3Red: 69/255, green: 65/255, blue: 65/255, alpha: 1)
                ])
                alertController.setValue(attributedString, forKey: "attributedTitle")

                present(alertController, animated: true)
                }
      func areyousureunfollow(alert: UIAlertAction!){
          let alertController = UIAlertController(title: "Are you sure to unfollow?", message: "", preferredStyle: .alert)

                 let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in           // do something
                 }
                 alertController.addAction(cancelAction)

                 let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in      }
          OKAction.setValue(UIColor(displayP3Red: 162/255, green: 32/255, blue: 58/255, alpha: 1), forKey: "titleTextColor")
          alertController.addAction(OKAction)
          cancelAction.setValue(UIColor(displayP3Red: 174/255, green: 174/255, blue: 174/255, alpha: 1), forKey: "titleTextColor")
          alertController.view.subviews.first?.subviews.first?.subviews.first?.backgroundColor = UIColor.white
         let attributedString = NSAttributedString(string: "Are you sure to unfollow?", attributes: [
          NSAttributedString.Key.font : UIFont.systemFont(ofSize: 17), //your font here
          NSAttributedString.Key.foregroundColor : UIColor(displayP3Red: 69/255, green: 65/255, blue: 65/255, alpha: 1)
          ])
          alertController.setValue(attributedString, forKey: "attributedTitle")

          present(alertController, animated: true)
          }
      func areyousuredelete(alert: UIAlertAction!){
         let alertController = UIAlertController(title: "Are you sure to delete this post?", message: "", preferredStyle: .alert)

          let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in           // do something
          }
          alertController.addAction(cancelAction)

          let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in      }
          OKAction.setValue(UIColor(displayP3Red: 162/255, green: 32/255, blue: 58/255, alpha: 1), forKey: "titleTextColor")
          alertController.addAction(OKAction)
          cancelAction.setValue(UIColor(displayP3Red: 174/255, green: 174/255, blue: 174/255, alpha: 1), forKey: "titleTextColor")
          alertController.view.subviews.first?.subviews.first?.subviews.first?.backgroundColor = UIColor.white
      let attributedString = NSAttributedString(string: "Are you sure to delete?", attributes: [
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 17), //your font here
            NSAttributedString.Key.foregroundColor : UIColor(displayP3Red: 69/255, green: 65/255, blue: 65/255, alpha: 1)
            ])
            alertController.setValue(attributedString, forKey: "attributedTitle")

            present(alertController, animated: true)
            }

    func report(alert: UIAlertAction!){
        let alertservice = alertService()
        let alert = alertservice.Reporttable()
        present(alert,animated: true,completion: nil)
    }
    

    //점 세개
    @objc func dot(_ sender: UIButton){
        //알러트뷰로 했을때
    
        let title = UIAlertController(title: nil , message: nil, preferredStyle: UIAlertController.Style.actionSheet)
        let view = UIAlertAction(title: "View selected tag", style: .default,handler: nil)
        let booster = UIAlertAction(title: "View status of using booster items", style: .default, handler: statusviewselect)
        let Share = UIAlertAction(title: "Share", style: .default, handler: share(alert:))
        let Edit = UIAlertAction(title: "Edit", style: .default, handler: nil)
        let delete = UIAlertAction(title: "Delete", style: .default, handler: areyousuredelete(alert:))
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        title.view.tintColor = UIColor(displayP3Red: 82/255, green: 82/255, blue: 82/255, alpha: 1)
        title.addAction(view)
        title.addAction(booster)
        title.addAction(Share)
        title.addAction(Edit)
        title.addAction(delete)
        title.addAction(cancel)

        self.present(title, animated: true, completion: nil)

        //알럴트 뷰 둥글게
         let backView = title.view.subviews.last?.subviews.first
         backView?.layer.cornerRadius = 14
         backView?.backgroundColor = UIColor.white
        
        
        
        
        
    }
    
    //헤더 길이 정하기
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
for i in morearray{
           if i == section {
               return CGFloat(headerheights[section] ?? 215)
           }
           
        }
       return 215
        

    }
    //푸터 길이 정하기
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
                 205
             }
    //전체 크기 정하기
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 375
        
    }
}
