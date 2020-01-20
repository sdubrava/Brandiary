//
//  FollowingFollowers.swift
//  Brandiary
//
//  Created by young on 17/10/2019.
//  Copyright © 2019 young. All rights reserved.
//

import UIKit

class FollowingFollowers: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    private var bool1 = [false,false]
    private var bool2 = [false,false]
    private let AboutItems: [String] = ["Off","On"]
         
          private let sections: [String] = ["New Followers", "Accepted Follow Requests"]


          func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           
           return AboutItems.count

             
          }
          
          func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
              let cell = table.dequeueReusableCell(withIdentifier: "SettingcheckCell") as! SettingcheckCell
           

             if indexPath.section == 0{
                     
                     if bool1[indexPath.row] == true {
                                       cell.lbl.textColor = UIColor(displayP3Red: 162/255, green: 32/255, blue: 58/255, alpha: 1)
                                       cell.checkimg.isHidden = false
                                   }else{
                                        cell.lbl.textColor = UIColor(displayP3Red: 72/255, green: 72/255, blue: 72/255, alpha: 1)
                                       cell.checkimg.isHidden = true
                     }
                     } else{
                         if bool2[indexPath.row] == true {
                                                     cell.lbl.textColor = UIColor(displayP3Red: 162/255, green: 32/255, blue: 58/255, alpha: 1)
                                                     cell.checkimg.isHidden = false
                                                 }else{
                                                      cell.lbl.textColor = UIColor(displayP3Red: 72/255, green: 72/255, blue: 72/255, alpha: 1)
                                                     cell.checkimg.isHidden = true
                         
                     }
            }
              
             if indexPath.section == 0 { cell.lbl.text = "\(AboutItems[indexPath.row])" }
             else if indexPath.section == 1 { cell.lbl.text = "\(AboutItems[indexPath.row])" }
             else { return UITableViewCell() }

              return cell
              
          }
       func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
          switch indexPath.section {
                      case 0:
                          if indexPath.row == 0{
                          bool1[0] = true
                          bool1[1] = false
                          }else {
                              bool1[1] = true
                     bool1[0] = false
                          }
                      case 1:
                          if indexPath.row == 0{
                                    bool2[0] = true
                            bool2[1] = false}
                            else {
                              bool2[1] = true
                                              bool2[0] = false
                                          
                          }
                          
                          
                      default:
                          print("몰라용")
                      }
        table.reloadData()
           
       }

          func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
              return 45
          }
          func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
              40
          }
          
          
          func numberOfSections(in tableView: UITableView) -> Int {
              return sections.count
          }
              
          func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
               let cell = table.dequeueReusableCell(withIdentifier: "SettingcheckHeaderCell") as! SettingcheckHeaderCell
                     
              switch section{
              case 0:
                  cell.lbl.text = "\(sections[section])"
                  case 1:
                             cell.lbl.text = "\(sections[section])"

                  default:
                             cell.lbl.text = "\(sections[section])"
              }
                     return cell
          }
          
          
          
          @IBOutlet weak var table: UITableView!
          override func viewDidLoad() {
              super.viewDidLoad()
            bool1[0] = true
                 bool2[0] = true

              // Do any additional setup after loading the view.
          }
          @IBAction func back(_ sender: Any) {
                 dismiss(animated: true, completion: nil)
             }

    }


