//
//  SearchExchangeTag.swift
//  Brandiary
//
//  Created by young on 11/10/2019.
//  Copyright © 2019 young. All rights reserved.
//

import UIKit

class SearchExchangeTag: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    var tabnumber = 0
    var follownumber = 0
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 10
    }
  
   


    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tabnumber == 0{
            let cell = table.dequeueReusableCell(withIdentifier: "SearchTop100Cell") as! SearchTop100Cell
            let colorView = UIView()
                                              colorView.backgroundColor = UIColor(displayP3Red: 238/255, green: 238/255, blue: 238/255, alpha: 1)
                    cell.selectedBackgroundView = colorView
            
              cell.followbtn.addTarget(self, action:#selector(SearchExchangeTag.follow(sender:)) , for: UIControl.Event.touchUpInside)
                   return cell
            
            
        }
        else{
            let cell = table.dequeueReusableCell(withIdentifier: "SearchUserHashCell") as! SearchUserHashCell
         
            return cell
            
        }
       
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tabnumber == 1{
        if indexPath.row == 0 {
            typesomethingview.isHidden = false
            
        }else{
            typesomethingview.isHidden = true
            }
        
        }
       
            
        

    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 65
        
    }
    
    @IBOutlet weak var stack: UIStackView!
    
    @IBOutlet weak var whiteline: UILabel!
    @IBOutlet weak var typesomethingview: UIView!
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var Tagbtn: UIButton!
    @IBOutlet weak var Exchangebtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(SearchExchangeTag.notifiactionFired(_:)), name: NSNotification.Name("Notification"), object: nil)
        
        typesomethingview.isHidden = true
        Exchangebtn.roundedButton()
        Tagbtn.roundedButton()
        
    }
    @objc func notifiactionFired(_ notification:Notification) {
        
        typesomethingview.isHidden = true
        Exchangebtn.backgroundColor = UIColor.white
               
               Tagbtn.backgroundColor = #colorLiteral(red: 0.9467939734, green: 0.9468161464, blue: 0.9468042254, alpha: 1)
                Exchangebtn.setTitleColor(#colorLiteral(red: 0.3803921569, green: 0.3803921569, blue: 0.3803921569, alpha: 1), for: .normal)
                Tagbtn.setTitleColor(#colorLiteral(red: 0.7370592952, green: 0.7370767593, blue: 0.7370672822, alpha: 1), for: .normal)
               
               tabnumber = 0
               typesomethingview.isHidden = true
               self.table.reloadData()
                Exchangebtn.layer.borderWidth = 1
                Tagbtn.layer.borderWidth = 0
        

        }
    
    @IBAction func exchangetap(_ sender: Any) {
       
        Exchangebtn.backgroundColor = UIColor.white
        
        Tagbtn.backgroundColor = #colorLiteral(red: 0.9467939734, green: 0.9468161464, blue: 0.9468042254, alpha: 1)
         Exchangebtn.setTitleColor(#colorLiteral(red: 0.3803921569, green: 0.3803921569, blue: 0.3803921569, alpha: 1), for: .normal)
         Tagbtn.setTitleColor(#colorLiteral(red: 0.7370592952, green: 0.7370767593, blue: 0.7370672822, alpha: 1), for: .normal)
        
        tabnumber = 0
        typesomethingview.isHidden = true
        self.table.reloadData()
         Exchangebtn.layer.borderWidth = 1
         Tagbtn.layer.borderWidth = 0
        
        
    }
    
    @IBAction func tagtap(_ sender: Any) {
        Tagbtn.layer.borderWidth = 1
        Tagbtn.layer.borderColor = UIColor(red:217/255, green:217/255, blue:217/255, alpha: 1).cgColor
        Exchangebtn.layer.borderWidth = 0
        
        Tagbtn.backgroundColor = UIColor.white
        Exchangebtn.backgroundColor =  #colorLiteral(red: 0.9467939734, green: 0.9468161464, blue: 0.9468042254, alpha: 1)
        
        Tagbtn.setTitleColor(#colorLiteral(red: 0.3803921569, green: 0.3803921569, blue: 0.3803921569, alpha: 1), for: .normal)
        Exchangebtn.setTitleColor(#colorLiteral(red: 0.7370592952, green: 0.7370767593, blue: 0.7370672822, alpha: 1), for: .normal)
        tabnumber = 1
        
        self.table.reloadData()
    }
    
    @objc
       func follow(sender:UIButton) {
        if follownumber == 0 {
            
            sender.backgroundColor = .white
            sender.setTitleColor(#colorLiteral(red: 0.7031922936, green: 0.2011226714, blue: 0.2912405133, alpha: 1), for: .normal)
            sender.setTitle("Follow", for: .normal)
            
            table.reloadData()
            
            follownumber = 1
            
        }
        else{
        sender.backgroundColor = #colorLiteral(red: 0.7031922936, green: 0.2011226714, blue: 0.2912405133, alpha: 1)
        sender.setTitleColor(.white, for: .normal)
        sender.setTitle("Following", for: .normal)
            
            follownumber = 0
            
            
            table.reloadData()
        }
        
        
        
           
         
           
           
               
           }


}
extension UIButton {
    func roundCorners(corners: UIRectCorner, radius: Int = 8) {
        let maskPath1 = UIBezierPath(roundedRect: bounds,
                                     byRoundingCorners: corners,
                                     cornerRadii: CGSize(width: radius, height: radius))
        let maskLayer1 = CAShapeLayer()
        maskLayer1.frame = bounds
        maskLayer1.path = maskPath1.cgPath
        layer.mask = maskLayer1
    }
}
