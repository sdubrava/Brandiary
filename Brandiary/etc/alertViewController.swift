//
//  alertViewController.swift
//  Brandiary
//
//  Created by young on 29/08/2019.
//  Copyright © 2019 young. All rights reserved.
//

import UIKit

class alertViewController: UIViewController, UITableViewDelegate,UITableViewDataSource,UIGestureRecognizerDelegate {
    
     private var tap: UITapGestureRecognizer!
    
    var tabnumber = 0
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "alertboosterCell") as! alertboosterCell
        
        switch indexPath.row {
        case 0:
            cell.booster.image = UIImage(named: "Redbooster@3x.png")
        case 1:
            cell.booster.image = UIImage(named: "o@3x.png")
        case 2:
            cell.booster.image = UIImage(named: "y@3x.png")
        case 3:
            cell.booster.image = UIImage(named: "p@3x.png")
        case 4:
           cell.booster.image = UIImage(named: "bluethunder.png")
        default:
            cell.booster.image = UIImage(named: "g@3x.png")
        }
        
       

        return cell
    }
    
    @objc func close() {
          
          dismiss(animated: true, completion: nil)
          
      }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if touch.view?.isDescendant(of: self.table) == true { //테이블 빼줘
            return false
        }
        return true
    }
    
    
    @IBOutlet weak var storebtn: UIButton!
    @IBOutlet weak var usebtn: UIButton!
    @IBOutlet weak var cancelbtn: UIButton!
    @IBOutlet weak var boosterlabel: UILabel!
    @IBOutlet weak var cellview: UIView!
    @IBOutlet weak var table: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tap = UITapGestureRecognizer(target: self, action: #selector(alertViewController.close))
        self.tap.delegate = self
        self.view.addGestureRecognizer(self.tap)
        tap.numberOfTapsRequired = 1
   
        usebtn.isEnabled = false
    
        View1.layer.cornerRadius = 10
        View1.layer.masksToBounds = true
         usebtn.setTitleColor(
                  #colorLiteral(red: 0.3536440134, green: 0.3536530137, blue: 0.3536481857, alpha: 1) , for: .normal)
        usebtn.isEnabled = false

    }

    @IBOutlet weak var View1: UIView!
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! alertboosterCell
        if  cell.checkbox.image ==  UIImage(named: "checkboxOn@3x.png"){
            cell.checkbox.image = UIImage(named: "checkboxNon.png")
                   cell.contentView.backgroundColor = UIColor.white
            tabnumber = tabnumber - 1
        }
        else{
            cell.checkbox.image = UIImage(named: "checkboxOn@3x.png")
            cell.contentView.backgroundColor = UIColor(displayP3Red: 238/255, green: 238/255, blue: 238/255, alpha: 1)
            tabnumber = tabnumber + 1
        }
        if tabnumber > 0 {
               usebtn.isEnabled = true
              usebtn.setTitleColor(#colorLiteral(red: 0.5807122588, green: 0.08386839181, blue: 0.1550715864, alpha: 1)
                  , for: .normal)
              }
              else{
             usebtn.isEnabled = false
                  usebtn.setTitleColor(
                                                    #colorLiteral(red: 0.3536440134, green: 0.3536530137, blue: 0.3536481857, alpha: 1) , for: .normal)
              }
        print(tabnumber)
        
    }
    
    
  
   
    
    @IBAction func Use(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func Cancel(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
   
    //storyboard에서 transition style cross dissolve
    //presentation over full screen 으로 변경
    //백그라운드 컬러에서 반드시 opacity 35%로 조정해야한다.

}

