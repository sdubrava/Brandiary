//
//  PostsComments.swift
//  Brandiary
//
//  Created by young on 17/10/2019.
//  Copyright © 2019 young. All rights reserved.
//

import UIKit

class PostsComments: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    private var bool1 = [false,false]
    private var bool2 = [false,false,false]
    private let AboutItems: [String] = ["Off","On"]
    private let CommentItems: [String] = ["Off","From People I Follow","From Everyone"]
    private let sections: [String] = ["About Using Booster Items", "Photos of You"]


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       if section == 0 { return AboutItems.count }
       else if section == 1 { return CommentItems.count }
        else if section == 2 { return CommentItems.count }
        else if section == 3 { return CommentItems.count }
       else { return 0 }

       
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
       else if indexPath.section == 1 { cell.lbl.text = "\(CommentItems[indexPath.row])" }
       else { return UITableViewCell() }
       

        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 55
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        30
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
                      bool2[1] = false
                    bool2[2] = false
            }else if indexPath.row == 1 {
                          bool2[1] = true
                 bool2[0] = false
                bool2[2] = false
            } else {
                bool2[2] = true
                                bool2[0] = false
                               bool2[1] = false
            }
            
            
        default:
            print("몰라용")
        }
        print(indexPath.row)
        table.reloadData()
           
       }
    
    
    
    @IBOutlet weak var table: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        bool1[0] = true
        bool2[0] = true


    }
    @IBAction func back(_ sender: Any) {
           dismiss(animated: true, completion: nil)
       }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
