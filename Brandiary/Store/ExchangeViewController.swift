//
//  ExchangeViewController.swift
//  Brandiary
//
//  Created by young on 02/08/2019.
//  Copyright © 2019 young. All rights reserved.
//

import UIKit


class ExchangeViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    var item1 = 10
    var item2 = 10
    var item3 = 10
    var item4 = 10
    var item5 = 10
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            let cell = table.dequeueReusableCell(withIdentifier: "ExchangeCell2") as! ExchangeCell2
            if item1 == 0 {
                cell.Upgradebtn.topGradientColor = UIColor(displayP3Red: 217/255, green: 217/255, blue: 217/255, alpha: 1)
                 cell.Upgradebtn.bottomGradientColor = UIColor(displayP3Red: 174/255, green: 174/255, blue: 174/255, alpha: 1)
                cell.Upgradebtn.isEnabled = false
            }
            cell.myitemnumber.text = "My item :" + "\(item1)"
            cell.cellview.layer.borderWidth = 2
            cell.cellview.layer.borderColor = UIColor(red:222/255, green:225/255, blue:227/255, alpha: 1).cgColor
            cell.cellview.layer.cornerRadius = 8
            cell.cellview.layer.masksToBounds = true
            
            cell.thunderview.backgroundColor = UIColor(displayP3Red: 249/255, green: 255/255, blue: 236/255, alpha: 0.5)
            cell.thunder1.image = UIImage(named: "g@3x.png")
            cell.thunder2.image = UIImage(named: "bluethunder.png")
            cell.Upgradebtn.addTarget(self, action:#selector(ExchangeViewController.Upgrade(sender:)) , for: UIControl.Event.touchUpInside)
            
            return cell
        }
        else {
        
        let cell = table.dequeueReusableCell(withIdentifier: "exchangecell") as! exchangecell
            cell.cellview.layer.borderWidth = 2
                   cell.cellview.layer.borderColor = UIColor(red:222/255, green:225/255, blue:227/255, alpha: 1).cgColor
                   cell.cellview.layer.cornerRadius = 8
                   cell.cellview.layer.masksToBounds = true
                   
                   //셀선택했을 때 화면
                   let backgroundView = UIView()
                   backgroundView.backgroundColor = UIColor.white
                   cell.selectedBackgroundView = backgroundView

                   
                    cell.exchange.addTarget(self, action:#selector(ExchangeViewController.Upgrade(sender:)) , for: UIControl.Event.touchUpInside)
                   
                   switch indexPath.row {
                       case 1:
                        cell.myitemnumber.text = "My item :" + "\(item2)"
                           cell.thunderview.backgroundColor = UIColor(displayP3Red: 242/255, green: 252/255, blue: 255/255, alpha: 0.5)
                                  cell.thunder1.image = UIImage(named: "bluethunder.png")
                                  cell.thunder2.image = UIImage(named: "p@3x.png")
                                  cell.thunder3.image = UIImage(named: "bluethunder.png")
                       case 2:
                            cell.myitemnumber.text = "My item :" + "\(item3)"
                                  cell.thunderview.backgroundColor = UIColor(displayP3Red: 247/255, green: 245/255, blue: 255/255, alpha: 0.5)
                                  cell.thunder1.image = UIImage(named: "p@3x.png")
                                  cell.thunder2.image = UIImage(named: "y@3x.png")
                                  cell.thunder3.image = UIImage(named: "p@3x.png")
                       case 3:
                        cell.myitemnumber.text = "My item :" + "\(item4)"
                                  cell.thunderview.backgroundColor = UIColor(displayP3Red: 255/255, green: 249/255, blue: 235/255, alpha: 0.5)
                                  cell.thunder1.image = UIImage(named: "y@3x.png")
                                  cell.thunder2.image = UIImage(named: "o@3x.png")
                                  cell.thunder3.image = UIImage(named: "y@3x.png")
                       case 4:
                        cell.myitemnumber.text = "My item :" + "\(item5)"
                                  cell.thunderview.backgroundColor = UIColor(displayP3Red: 255/255, green: 245/255, blue: 248/255, alpha: 0.5)
                                  cell.thunder1.image = UIImage(named: "o@3x.png")
                                  cell.thunder2.image = UIImage(named: "redbooster.png")
                                  cell.thunder3.image = UIImage(named: "o@3x.png")
             
                       
                   default:
                       print("dd")
                   }
            return cell
        }
        
        //뷰 둥글게 및 테두리 굵기 정하기
       
    
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
     
       
    }
    @objc
          func Upgrade(sender:GradientButton) {
        
    
         
        
        let alertController = UIAlertController(title: "Are you sure to upgrade ?", message: "", preferredStyle: .alert)

              let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in           // do something
              }
              alertController.addAction(cancelAction)

              let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
                if self.item1 > 0 {
                    self.item1 = self.item1 - 1
                       }
                self.table.reloadData()
              }
              OKAction.setValue(UIColor(displayP3Red: 162/255, green: 32/255, blue: 58/255, alpha: 1), forKey: "titleTextColor")
              alertController.addAction(OKAction)
              cancelAction.setValue(UIColor(displayP3Red: 174/255, green: 174/255, blue: 174/255, alpha: 1), forKey: "titleTextColor")

              present(alertController, animated: true)
        
        alertController.view.subviews.first?.subviews.first?.subviews.first?.backgroundColor = UIColor.white
        let attributedString = NSAttributedString(string: "Are you sure to upgrade ?", attributes: [
         NSAttributedString.Key.font : UIFont.systemFont(ofSize: 17), //your font here
         NSAttributedString.Key.foregroundColor : UIColor(displayP3Red: 69/255, green: 65/255, blue: 65/255, alpha: 1)
         ])
         alertController.setValue(attributedString, forKey: "attributedTitle")
                    }


        
    
          
    @IBOutlet weak var table: UITableView!
    
  

}

@IBDesignable
class GradientButton: UIButton {
    let gradientLayer = CAGradientLayer()
    
    @IBInspectable
    var topGradientColor: UIColor? {
        didSet {
            setGradient(topGradientColor: topGradientColor, bottomGradientColor: bottomGradientColor)
        }
    }
    
    @IBInspectable
    var bottomGradientColor: UIColor? {
        didSet {
            setGradient(topGradientColor: topGradientColor, bottomGradientColor: bottomGradientColor)
        }
    }
    
    private func setGradient(topGradientColor: UIColor?, bottomGradientColor: UIColor?) {
        if let topGradientColor = topGradientColor, let bottomGradientColor = bottomGradientColor {
            gradientLayer.frame = bounds
            gradientLayer.colors = [topGradientColor.cgColor, bottomGradientColor.cgColor]
            gradientLayer.borderColor = layer.borderColor
            gradientLayer.borderWidth = layer.borderWidth
            gradientLayer.cornerRadius = layer.cornerRadius
            layer.insertSublayer(gradientLayer, at: 0)
        } else {
            gradientLayer.removeFromSuperlayer()
        }
    }
}

