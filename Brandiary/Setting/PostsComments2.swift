//
//  PostsComments2.swift
//  Brandiary
//
//  Created by young on 17/10/2019.
//  Copyright © 2019 young. All rights reserved.
//

import UIKit

class PostsComments2: UIViewController,UITableViewDelegate,UITableViewDataSource {

    private var bool = [false,false,false,false]
    private let AboutItems: [String] = ["Everyone","People You Follow and Your Followers","People You Follow", "Your Followers"]
      
       private let sections: [String] = ["Select Tags Through Booster Items"]


       func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return AboutItems.count

          
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = table.dequeueReusableCell(withIdentifier: "SettingcheckCell2") as! SettingcheckCell2
       
        if indexPath.row == 0{
        cell.lbl2.text = ""
        }else{
            cell.lbl2.text = "1.2k People"
        }
         if indexPath.section == 0{
            if bool[indexPath.row] == true {
                                              cell.lbl.textColor = UIColor(displayP3Red: 162/255, green: 32/255, blue: 58/255, alpha: 1)
                                              cell.check.isHidden = false
                                          }else{
                                               cell.lbl.textColor = UIColor(displayP3Red: 72/255, green: 72/255, blue: 72/255, alpha: 1)
                                              cell.check.isHidden = true
                            }
        }
           
          if indexPath.section == 0 { cell.lbl.text = "\(AboutItems[indexPath.row])" }
          else if indexPath.section == 1 { cell.lbl.text = "\(AboutItems[indexPath.row])" }
           else if indexPath.section == 2 { cell.lbl.text = "\(AboutItems[indexPath.row])" }
           else if indexPath.section == 3 { cell.lbl.text = "\(AboutItems[indexPath.row])" }
          else { return UITableViewCell() }

           return cell
           
       }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            bool[0] = true
             bool[1] = false
             bool[2] = false
             bool[3] = false
        case 1:
            bool[1] = true
                        bool[0] = false
                        bool[2] = false
                        bool[3] = false
        case 2:
            bool[2] = true
                        bool[1] = false
                        bool[0] = false
                        bool[3] = false
        case 3:
            bool[3] = true
                        bool[1] = false
                        bool[2] = false
                        bool[0] = false
            
        default:
            print("몰라용")
        }
        table.reloadData()
        
        print(indexPath.row)
        
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
               case 2:
                          cell.lbl.text = "\(sections[section])"
               case 3:
                          cell.lbl.text = "\(sections[section])"
               default:
                          cell.lbl.text = "\(sections[section])"
           }
                  return cell
       }
       
       
       
       @IBOutlet weak var table: UITableView!
       override func viewDidLoad() {
           super.viewDidLoad()
        bool[0] = true


           // Do any additional setup after loading the view.
       }
       @IBAction func back(_ sender: Any) {
              dismiss(animated: true, completion: nil)
          }

}
