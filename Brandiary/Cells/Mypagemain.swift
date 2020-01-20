//
//  Mypagemain.swift
//  Brandiary
//
//  Created by young on 2020/01/01.
//  Copyright © 2020 young. All rights reserved.
//

import UIKit


class Mypagemain: UITableViewCell,UITableViewDelegate,UITableViewDataSource {
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = maintable.dequeueReusableCell(withIdentifier: "MainCell", for: indexPath) as! MainCell
//          cell.post = self.posts?[indexPath.section]
                      cell.selectionStyle = .none
               return cell
    }
    
    
    var posts: [Post]?
       var headerheight = 125
       var headerheights = [Int : Int]()
       var currentImage = 0
       var getindex : IndexPath?
       var moreless = "more"
       var currentimage = 0
       var moreindex = 100
       var morearray = [Int]()

    @IBOutlet weak var maintable: UITableView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.fetchPosts()
        maintable.delegate = self
        maintable.dataSource = self
    }
//
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func fetchPosts()
          {
              self.posts = Post.fetchPosts()
              maintable.reloadData()
          }
          //포스트 수 대로 보여줘 테이블 뷰에
          func numberOfSections(in tableView: UITableView) -> Int {
              if let posts = posts {
                  return posts.count
              }

              return 1
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

                                                  maintable.reloadData()

                                              case UISwipeGestureRecognizer.Direction.right:
                                                  if currentimage == 0 {
                                                      currentimage = images.count - 1
                                                  }else{
                                                      currentimage -= 1
                                                  }

                      //                             image1 = images[currentimage]
                                                   maintable.reloadData()
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
                 let cell = maintable.dequeueReusableCell(withIdentifier: "MainfooterCell") as! MainfooterCell
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
               let cell = maintable.dequeueReusableCell(withIdentifier: "MainheaderCell") as! MainheaderCell

            if maintable.tag == 2{
            cell.post = self.posts?[2]
            } else{
                cell.post = self.posts?[0]
            }
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
                                                if i == section{
                                                      cell.morebtn.isHidden = true
                                                        }

                                              }
                                return cell
          }
          @objc func more(sender: UIButton){
            
                 moreindex = sender.tag
                 morearray.append(sender.tag)

             if sender.currentTitle == "more"{
                 let Font = UIFont.systemFont(ofSize: 12)
                 let height = heightForView(text:self.posts![moreindex].caption!, font: Font, width: 360)
                 headerheight = 170 + Int(height)
                 headerheights.updateValue(headerheight, forKey: moreindex)
                 maintable.reloadData()
                 }
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
          //가운데 크기 정하기
          func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

              return 375

          }

}



