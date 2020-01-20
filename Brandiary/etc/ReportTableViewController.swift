//
//  ReportTableViewController.swift
//  Brandiary
//
//  Created by young on 13/10/2019.
//  Copyright © 2019 young. All rights reserved.
//

import UIKit

class ReportTableViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,UIGestureRecognizerDelegate {
    @IBOutlet weak var nextbtn: UIButton!
    
    private var tap: UITapGestureRecognizer!
    
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 4
    }
    
    
    @IBAction func next(_ sender: Any) {

       dismiss(animated: true, completion: nil)
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "ReportCell") as! ReportCell
        
       if indexPath.row == 0 {
            cell.celllabel.text = "I’m not interested in this post."
        }
       else if indexPath.row == 1 {
                  cell.celllabel.text = "It’s abusive or harmful."
              }
       else if indexPath.row == 2 {
                  cell.celllabel.text = "It’s a sensitive image."
              }
       else if indexPath.row == 3 {
         let cell = table.dequeueReusableCell(withIdentifier: "ReportCell2") as! ReportCell2
        return cell
                 
              }
      
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dismiss(animated: true, completion: nil)

          if indexPath.row == 3 {
            reportbool = true
              }


    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = table.dequeueReusableCell(withIdentifier: "ReportHeaderCell") as! ReportHeaderCell
       
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let cell = table.dequeueReusableCell(withIdentifier: "ReportFooterCell") as! ReportFooterCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 60
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 60
        
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        return 60
    }
    @objc func close() {
              
       dismiss(animated: true, completion: nil)
              
          }
    
    override func viewDidLoad() {
        super.viewDidLoad()
         nextbtn.isEnabled = false

        nextbtn.layer.cornerRadius = 15
        nextbtn.layer.masksToBounds = true
        table.layer.cornerRadius = 15
        table.layer.masksToBounds = true
        
        nextbtn.backgroundColor = UIColor.white
        nextbtn.setTitleColor(UIColor(displayP3Red: 162/255, green: 32/255, blue: 58/255, alpha: 1), for: .normal)
        self.tap = UITapGestureRecognizer(target: self, action: #selector(ReportTableViewController.close))
          self.tap.delegate = self
          self.view.addGestureRecognizer(self.tap)
        tap.numberOfTapsRequired = 1
        

    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if touch.view?.isDescendant(of: self.table) == true {
            return false
        }
        return true
    }

    @IBOutlet weak var table: UITableView!
    // MARK: - Table view data source




}
