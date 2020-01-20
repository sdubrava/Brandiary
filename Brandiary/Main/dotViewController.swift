//
//  3dotViewController.swift
//  Brandiary
//
//  Created by young on 10/10/2019.
//  Copyright © 2019 young. All rights reserved.
//

import UIKit

class dotViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    
    @IBOutlet weak var table: UITableView!
    
     let alertservice = alertService()
    
    @IBOutlet weak var cancelbtn: UIButton!
    @IBAction func cancelbtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
          super.viewDidLoad()
          
          table.layer.cornerRadius = 15
          table.layer.masksToBounds = true
          cancelbtn.layer.cornerRadius = 15
        cancelbtn.layer.masksToBounds = true
          

      }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "dotCell") as! dotCell
        
        if indexPath.row == 0 {
                  cell.celllabel.text = "View select tag"
               }
               else if indexPath.row == 1 {
                  cell.celllabel.text = "Share"
               }
               else if indexPath.row == 2 {
                  cell.celllabel.text = "Report"
               }
               else if indexPath.row == 3 {
                   cell.celllabel.text = "Unfollow"
               }
               else {
                   
                    cell.celllabel.text = "Hide this post"
               }
        return cell
    }
    
    
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        if indexPath.row == 0 {
            
            let alertservice = BoosteralertService()
            let alert = alertservice.viewselected()
             present(alert,animated: true,completion: nil)
            
            
            
                        
        }
            else if indexPath.row == 1 {
            let items = [URL(string: "https://www.apple.com")!]
                             
                             let share = UIActivityViewController(activityItems: items, applicationActivities: nil)
                             
                             present(share, animated: true, completion: nil)
                       

                     
                   }
        else if indexPath.row == 2 {
            
        
            
           let view = self.storyboard?.instantiateViewController(withIdentifier: "ReportTableViewController")
                                                //이동할 때 화면 coverVertical로 보여줘
                                                view?.modalTransitionStyle = UIModalTransitionStyle.coverVertical
                                                self.present(view!, animated: true, completion: nil)

            dismiss(animated: true, completion: nil)
        }
        else if indexPath.row == 3 {
            let view = self.storyboard?.instantiateViewController(withIdentifier: "AreyousureViewController")
                                                //이동할 때 화면 coverVertical로 보여줘
                                                view?.modalTransitionStyle = UIModalTransitionStyle.coverVertical
                                                self.present(view!, animated: true, completion: nil)
        }
        else if indexPath.row == 4 {
                  let view = self.storyboard?.instantiateViewController(withIdentifier: "AreyousureViewController")
                                                      //이동할 때 화면 coverVertical로 보여줘
                                                      view?.modalTransitionStyle = UIModalTransitionStyle.coverVertical
                                                      self.present(view!, animated: true, completion: nil)
              }
        
    }
    

}
