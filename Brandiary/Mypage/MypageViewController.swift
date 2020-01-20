//
//  MypageViewController.swift
//  Brandiary
//
//  Created by young on 09/08/2019.
//  Copyright © 2019 young. All rights reserved.
//

import UIKit
import FirebaseStorage
import FirebaseFirestore
import Kingfisher

var profileimage = UIImage()
class MypageViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

      var headerheight = Int()
      var headerheights = [Int : Int]()
      var currentImage = 0
      var getindex : IndexPath?
      var moreless = "more"
      var currentimage = 0
      var moreindex = 100
      var morearray = [Int]()
    var posts: [Post]?
    private var btntap = Int()

    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if btntap == 3{
            
        if let posts = posts {
           return posts.count
       }
        }
       
       return 1

    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if btntap == 4 {
        if indexPath.row == 0{
              
                      let collectioncell = table.dequeueReusableCell(withIdentifier: "MypageCollection") as! MypageCollection
            

                              return collectioncell
        }
        }
    
    
        let cell = table.dequeueReusableCell(withIdentifier: "MainoneCell") as! MainoneCell
        cell.selectlabel.layer.borderWidth = 1
             cell.selectlabel.layer.borderColor = UIColor.lightGray.cgColor
             cell.selectlabel.layer.cornerRadius = 5
             cell.selectlabel.layer.masksToBounds = true
        cell.sharebtn.tag = indexPath.row
        cell.sharebtn.addTarget(self, action:#selector(MypageViewController.share(_:)) , for: UIControl.Event.touchUpInside)
        cell.boosterbtn.tag = indexPath.row
        cell.boosterbtn.addTarget(self, action:#selector(MypageViewController.booster(_sender:)) , for: UIControl.Event.touchUpInside)
        cell.collection.tag = indexPath.row
        collectiontags.append(self.posts![indexPath.row].tags)

        cell.post = self.posts?[indexPath.section]
              cell.imgnumber.backgroundColor = #colorLiteral(red: 0.3536440134, green: 0.3536530137, blue: 0.3536481857, alpha: 1)
              cell.imgnumber.text = "\(currentimage)" + "/" + "\(images.count - 1)"
              cell.selectionStyle = .none
        cell.post = self.posts?[indexPath.row]
               cell.backgroundColor = UIColor.white
        cell.dotbtn.tag = indexPath.row
               cell.dotbtn.addTarget(self, action:#selector(MypageViewController.dot) , for: UIControl.Event.touchUpInside)
               cell.profile.layer.cornerRadius = 3
               cell.profile.layer.masksToBounds = true
               cell.caption.numberOfLines = 0
               cell.caption.sizeToFit()
               cell.morebtn.addTarget(self, action:#selector(MypageViewController.more(sender:)) , for: UIControl.Event.touchUpInside)
        cell.morebtn.tag = indexPath.row
        for i in morearray{
                  if i == indexPath.row {
                      cell.morebtn.isHidden = true
            }
                }
        
        return cell

    }


    @objc func dot(_ sender: UIButton){
           //알러트뷰로 했을때
       
           let title = UIAlertController(title: nil , message: nil, preferredStyle: UIAlertController.Style.actionSheet)
           let view = UIAlertAction(title: "View selected tag", style: .default,handler: viewselcted(alert:))
           let status = UIAlertAction(title: "View status of using booster items", style: .default, handler: statusviewselect(alert:))
           let share = UIAlertAction(title: "Share", style: .default, handler: sharealert(alert:))
           let Edit = UIAlertAction(title: "Edit", style: .default, handler: edit(alert:))
           let Delete = UIAlertAction(title: "Delete", style: .default, handler: areyousuredelete(alert:))
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
          func edit(alert: UIAlertAction!){
              let alertController = UIAlertController(title: "Are you sure to edit this post??", message: "", preferredStyle: .alert)

                     let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in           // do something
                     }
                     alertController.addAction(cancelAction)

                     let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in      }
              OKAction.setValue(UIColor(displayP3Red: 162/255, green: 32/255, blue: 58/255, alpha: 1), forKey: "titleTextColor")
              alertController.addAction(OKAction)
              cancelAction.setValue(UIColor(displayP3Red: 174/255, green: 174/255, blue: 174/255, alpha: 1), forKey: "titleTextColor")
              alertController.view.subviews.first?.subviews.first?.subviews.first?.backgroundColor = UIColor.white
             let attributedString = NSAttributedString(string: "Are you sure to\n edit this post?", attributes: [
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
          let attributedString = NSAttributedString(string: "Are you sure to\n delete this post?", attributes: [
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
    func sharealert(alert: UIAlertAction!){
       let items = [URL(string: "https://www.apple.com")!]
           
               let share = UIActivityViewController(activityItems: items, applicationActivities: nil)
               
               present(share, animated: true, completion: nil)
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
    @objc func booster(_sender: UIButton){
           
           let alertservice = alertService()
           let alert = alertservice.alert()
           present(alert,animated: true,completion: nil)
           
       }
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
           headerheight = 735+Int(height)
           headerheights.updateValue(headerheight, forKey: moreindex)
           table.reloadData()
           }
           }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = table.dequeueReusableCell(withIdentifier: "MypageheaderCell") as! MypageheaderCell
        print(btntap)
        switch btntap {
        case 1:
             cell.radarbtn.backgroundColor = UIColor.white
                       cell.informbtn.backgroundColor = UIColor(displayP3Red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
                       cell.twoviewbtn.backgroundColor = UIColor(displayP3Red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
            case 2:
            cell.informbtn.backgroundColor = UIColor.white
                       cell.radarbtn.backgroundColor = UIColor(displayP3Red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
                       cell.twoviewbtn.backgroundColor = UIColor(displayP3Red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
                       case 3:
                        cell.twoviewbtn.setImage(UIImage(named: "bookcardNon@3x.png"), for: .normal)
                        cell.twoviewbtn.tintColor = UIColor.black
                                   cell.twoviewbtn.backgroundColor = UIColor.white
                                             cell.informbtn.backgroundColor = UIColor(displayP3Red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
                                             cell.radarbtn.backgroundColor = UIColor(displayP3Red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        case 4:
            cell.twoviewbtn.setImage(UIImage(named: "bookgalleryOn@3x.png"), for: .normal)
            cell.twoviewbtn.backgroundColor = UIColor.white
            cell.informbtn.backgroundColor = UIColor(displayP3Red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
            cell.radarbtn.backgroundColor = UIColor(displayP3Red: 245/255, green: 245/255, blue: 245/255, alpha: 1)

            
        default:
            print("마이페이지뷰컨트롤러 헤더부분 오류")
        }
                    
                     return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        155
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         for i in morearray{
            if i == indexPath.row {
                return CGFloat(headerheights[indexPath.row] ?? 780)
                   }
                   
                }
               return 780
    }
    
  
    

   
    
  

    @IBOutlet weak var table: UITableView!
    
    @IBOutlet weak var storeitem: UIBarButtonItem!
 
    @IBOutlet weak var hideview: UIView!
    @IBOutlet weak var doubleup: UIButton!
    @IBOutlet weak var rankingview: UIView!
    @IBOutlet weak var doubledown: UIButton!
 
    @IBOutlet weak var Radarchart: UIView!
    @IBOutlet weak var MypageAffiliated: UIView!


     override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.barTintColor = UIColor.white
        
        self.fetchPosts()
        
         NotificationCenter.default.addObserver(self, selector: #selector(MypageViewController.twoviewcollection), name: NSNotification.Name("twoviewcollection"), object: nil)
         NotificationCenter.default.addObserver(self, selector: #selector(MypageViewController.inform), name: NSNotification.Name("inform"), object: nil)
         NotificationCenter.default.addObserver(self, selector: #selector(MypageViewController.radar), name: NSNotification.Name("radar"), object: nil)
        
  
    
        MypageAffiliated.isHidden = true
        doubleup.isHidden = true
        rankingview.isHidden = true
        hideview.isHidden = true
        rankingview.layer.borderWidth = 1
        rankingview.layer.borderColor = UIColor(displayP3Red: 211/255, green: 211/255, blue: 211/255, alpha: 1).cgColor
        rankingview.layer.cornerRadius = 10
        rankingview.layer.masksToBounds = true
         self.navigationController?.navigationBar.topItem?.title = "Fomagran"
//        self.navigationController?.navigationBar.topItem?.title = UserDefaults.standard.string(forKey: "name")

        let titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        UISegmentedControl.appearance().setTitleTextAttributes(titleTextAttributes, for: .normal)

    }
    func fetchPosts()
             {
                self.posts = Post.fetchPosts()
             }
    
    @objc func inform(){
        btntap = 2
        doubledown.isHidden = true
        Radarchart.isHidden = true
        MypageAffiliated.isHidden = false
    }
    @objc func radar(){
        btntap = 1
         doubledown.isHidden = false
              Radarchart.isHidden = false
              MypageAffiliated.isHidden = true
    }
  
    
    @objc func twoviewcollection(){
        if btntap == 3 {
        btntap = 4
        doubledown.isHidden = true
        MypageAffiliated.isHidden = true
        Radarchart.isHidden = true
        table.reloadData()
        }else{
            btntap = 3
            doubledown.isHidden = true
                   MypageAffiliated.isHidden = true
                   Radarchart.isHidden = true
                   table.reloadData()
        }
    }
 
 
    @IBAction func store(_ sender: Any) {
        if storeitem.image == UIImage(named: "back1.png"){
                        storeitem.image = UIImage(named: "store.png")
                        
                    }else{
                        tabbarindex = 4
                        let view = self.storyboard?.instantiateViewController(withIdentifier: "Store")
                                                                     //이동할 때 화면 coverVertical로 보여줘
                                                                     view?.modalTransitionStyle = UIModalTransitionStyle.coverVertical
            view?.modalPresentationStyle = .fullScreen
                                                                     self.present(view!, animated: true, completion: nil)
                        
                    }
    }
    @IBOutlet weak var settingbtn: UIBarButtonItem!
    @IBAction func setting(_ sender: Any) {
        let view = self.storyboard?.instantiateViewController(withIdentifier: "Setting")
                                                    //이동할 때 화면 coverVertical로 보여줘
                                                    view?.modalTransitionStyle = UIModalTransitionStyle.coverVertical
         view?.modalPresentationStyle = .fullScreen
                                                    self.present(view!, animated: true, completion: nil)
        tabbarindex = 4
    }
    
    @IBAction func doubleup(_ sender: Any) {
        doubledown.isHidden = false
        rankingview.isHidden = true
        doubleup.isHidden = true
        hideview.isHidden = true
    }
    @IBAction func doubledown(_ sender: Any) {
        doubleup.isHidden = false
        doubledown.isHidden = true
        rankingview.isHidden = false
        hideview.isHidden = false
        
       self.view.layoutIfNeeded()
        
    }
    
    }


