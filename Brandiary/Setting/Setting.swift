//
//  Setting.swift
//  Brandiary
//
//  Created by young on 19/08/2019.
//  Copyright © 2019 young. All rights reserved.
//

import UIKit
var tabbarindex = Int()
class Setting: UIViewController,UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 6
    }
    @IBAction func back(_ sender: Any) {
        let view = self.storyboard?.instantiateViewController(withIdentifier: "tabbar")
                                        //이동할 때 화면 coverVertical로 보여줘
                                        view?.modalTransitionStyle = UIModalTransitionStyle.coverVertical
        view?.modalPresentationStyle = .fullScreen
                                        self.present(view!, animated: true, completion: nil)


    }
    
    @IBOutlet weak var Logout: UIButton!
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let colorView = UIView()
                             colorView.backgroundColor = UIColor(displayP3Red: 238/255, green: 238/255, blue: 238/255, alpha: 1)

       
        let cell = table.dequeueReusableCell(withIdentifier: "SettingCell") as! SettingCell
         cell.selectedBackgroundView = colorView
        
        if indexPath.row == 0 {
            cell.settingimage.image =  UIImage(named: "inviteNon@3x.png")
            cell.settinglabel.text = "Invite friends"
        }
        else if indexPath.row == 1 {
            cell.settingimage.image =  UIImage(named: "alarmNon@3x.png")
            cell.settinglabel.text = "Notification"
        }
        else if indexPath.row == 2 {
            cell.settingimage.image =  UIImage(named: "passwordNon@3x.png")
            cell.settinglabel.text = "Privacy"
        }
        else if indexPath.row == 3 {
            cell.settingimage.image =  UIImage(named: "account@3x.png")
            cell.settinglabel.text = "Account"
        }
        else if indexPath.row == 4 {
            
           cell.settingimage.image =  UIImage(named: "help@3x.png")
            cell.settinglabel.text = "Help"
        }
        else if indexPath.row == 5 {
            cell.settingimage.image =  UIImage(named: "informOn@3x.png")
            cell.settinglabel.text = "information"
        }
        
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 65
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
             let items = [URL(string: "https://www.apple.com")!]
                  
                  let share = UIActivityViewController(activityItems: items, applicationActivities: nil)
                  
                  present(share, animated: true, completion: nil)
            
        }
        else if indexPath.row == 1 {
            let view = self.storyboard?.instantiateViewController(withIdentifier: "Notification")
                                 //이동할 때 화면 coverVertical로 보여줘
                                 view?.modalTransitionStyle = UIModalTransitionStyle.coverVertical
            view?.modalPresentationStyle = .fullScreen
                                 self.present(view!, animated: true, completion: nil)
            
        }
        else if indexPath.row == 2 {
        let view = self.storyboard?.instantiateViewController(withIdentifier: "Privacy")
                             //이동할 때 화면 coverVertical로 보여줘
                             view?.modalTransitionStyle = UIModalTransitionStyle.coverVertical
            view?.modalPresentationStyle = .fullScreen
                             self.present(view!, animated: true, completion: nil)
        
    }else if indexPath.row == 3 {
    let view = self.storyboard?.instantiateViewController(withIdentifier: "Account")
                         //이동할 때 화면 coverVertical로 보여줘
                         view?.modalTransitionStyle = UIModalTransitionStyle.coverVertical
            view?.modalPresentationStyle = .fullScreen
                         self.present(view!, animated: true, completion: nil)
        } else if indexPath.row == 4 {
            reportbool = false
          let view = self.storyboard?.instantiateViewController(withIdentifier: "ReportTextViewController")
            //이동할 때 화면 coverVertical로 보여줘
            view?.modalTransitionStyle = UIModalTransitionStyle.coverVertical
            self.present(view!, animated: true, completion: nil)
            
        } else{
            let view = self.storyboard?.instantiateViewController(withIdentifier: "Information")
                       //이동할 때 화면 coverVertical로 보여줘
                       view?.modalTransitionStyle = UIModalTransitionStyle.coverVertical
                       view?.modalPresentationStyle = .fullScreen
                       self.present(view!, animated: true, completion: nil)
        }
    }
    

    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func Logout(_ sender: Any) {
       let alertController = UIAlertController(title: "", message: "", preferredStyle: .alert)

        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in           // do something
        }
        alertController.addAction(cancelAction)

        let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in  let view = self.storyboard?.instantiateViewController(withIdentifier: "LoginView")
                                    //이동할 때 화면 coverVertical로 보여줘
                                    view?.modalTransitionStyle = UIModalTransitionStyle.coverVertical
            view?.modalPresentationStyle = .fullScreen
                                    self.present(view!, animated: true, completion: nil)
            UserDefaults.standard.set(false, forKey: "Login")
        }
        OKAction.setValue(UIColor(displayP3Red: 162/255, green: 32/255, blue: 58/255, alpha: 1), forKey: "titleTextColor")
        alertController.addAction(OKAction)
        cancelAction.setValue(UIColor(displayP3Red: 174/255, green: 174/255, blue: 174/255, alpha: 1), forKey: "titleTextColor")

        present(alertController, animated: true)
        let attributedString = NSAttributedString(string: "Are you sure to Log out ?", attributes: [
                          NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 17), //your font here
                     NSAttributedString.Key.foregroundColor : UIColor(displayP3Red: 69/255, green: 65/255, blue: 65/255, alpha: 1)
                          ])
                          alertController.setValue(attributedString, forKey: "attributedTitle")
        
              }
        
    }
    

