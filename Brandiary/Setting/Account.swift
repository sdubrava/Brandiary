//
//  Account.swift
//  Brandiary
//
//  Created by young on 17/10/2019.
//  Copyright © 2019 young. All rights reserved.
//

import UIKit

class Account: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "SettingCell") as! SettingCell
        let colorView = UIView()
                                                  colorView.backgroundColor = UIColor(displayP3Red: 238/255, green: 238/255, blue: 238/255, alpha: 1)
                        cell.selectedBackgroundView = colorView
        
        if indexPath.row == 0 {
            cell.settinglabel.text = "Password"
              }
              else if indexPath.row == 1 {
             cell.settinglabel.text = "Language"
                 
              }
              else if indexPath.row == 2 {
             cell.settinglabel.text = "Linked Accounts"
                 
              }
              else if indexPath.row == 3 {
             cell.settinglabel.text = "Deactivate Account"
                
              }
              
              
              return cell
        

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           if indexPath.row == 0 {
               let view = self.storyboard?.instantiateViewController(withIdentifier: "Password")
                         //이동할 때 화면 coverVertical로 보여줘
                         view?.modalTransitionStyle = UIModalTransitionStyle.coverVertical
            view?.modalPresentationStyle = .fullScreen
                         self.present(view!, animated: true, completion: nil)
               
           }
           else if indexPath.row == 1 {
               let view = self.storyboard?.instantiateViewController(withIdentifier: "Language")
                                    //이동할 때 화면 coverVertical로 보여줘
                                    view?.modalTransitionStyle = UIModalTransitionStyle.coverVertical
            view?.modalPresentationStyle = .fullScreen
                                    self.present(view!, animated: true, completion: nil)
               
           }
           else if indexPath.row == 2 {
       let view = self.storyboard?.instantiateViewController(withIdentifier: "LinkedAccounts")
                            //이동할 때 화면 coverVertical로 보여줘
                            view?.modalTransitionStyle = UIModalTransitionStyle.coverVertical
            view?.modalPresentationStyle = .fullScreen
                            self.present(view!, animated: true, completion: nil)
           } else if indexPath.row == 3 {
             let alertController = UIAlertController(title: "Are you sure to Log out ?", message: "", preferredStyle: .alert)

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
                   let attributedString = NSAttributedString(string: "Are you sure to deactivate account?", attributes: [
                                     NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 17), //your font here
                                NSAttributedString.Key.foregroundColor : UIColor(displayP3Red: 69/255, green: 65/255, blue: 65/255, alpha: 1)
                                     ])
                                     alertController.setValue(attributedString, forKey: "attributedTitle")
                         }
       }
       
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBOutlet weak var table: UITableView!
    @IBAction func back(_ sender: Any) {
             let view = self.storyboard?.instantiateViewController(withIdentifier: "Setting")
                            //이동할 때 화면 coverVertical로 보여줘
                            view?.modalTransitionStyle = UIModalTransitionStyle.coverVertical
        view?.modalPresentationStyle = .fullScreen
                            self.present(view!, animated: true, completion: nil)
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
