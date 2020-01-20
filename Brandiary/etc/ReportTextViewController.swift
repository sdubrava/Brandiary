//
//  ReportTextViewController.swift
//  Brandiary
//
//  Created by young on 13/10/2019.
//  Copyright © 2019 young. All rights reserved.
//

import UIKit

class ReportTextViewController: UIViewController,UITextViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        print(reportbool)
        if reportbool == true {
            report.text = "REPORT"
            writetext.text = "Write the reason for reporting this post"
        } else{
            report.text = "HELP"
            writetext.text = "How can we help you?"
        }

        
       topview.roundCorners([.topLeft, .bottomRight], radius: 10)
        writetext.delegate = self
        
         nextbtn.setTitleColor(UIColor(displayP3Red: 128/255, green: 128/255, blue: 128/255, alpha: 1), for: .normal)
        
        nextbtn.isEnabled = false

        Reportview.layer.cornerRadius = 10
        Reportview.layer.masksToBounds = true
    }
    @IBOutlet weak var stack: UIStackView!
    @IBOutlet weak var Reportview: UIView!
    @IBOutlet weak var cancel: UIButton!
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
       
    }
    @IBOutlet weak var nextbtn: UIButton!
    
    @IBAction func nextbtn(_ sender: Any) {
        if reportbool == true {
          let alert = UIAlertController(title: "Welcome!!", message: "Sign up is complete.Branding yourself with Brandiary!!", preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "Done", style: .default) { (action) in  self.dismiss(animated: true, completion: nil)    }
          OKAction.setValue(UIColor(displayP3Red: 162/255, green: 32/255, blue: 58/255, alpha: 1), forKey: "titleTextColor")
                alert.addAction(OKAction)

             let attributedString = NSAttributedString(string: "Report", attributes: [
                      NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 17), //your font here
                 NSAttributedString.Key.foregroundColor : UIColor.black
                      ])
                      alert.setValue(attributedString, forKey: "attributedTitle")
         let messageString  = "Thank you for reporting this issue. We will check and take action."
         var myMutableString = NSMutableAttributedString()
         myMutableString = NSMutableAttributedString(string: messageString as String, attributes: [NSAttributedString.Key.font:UIFont.systemFont(ofSize: 14)])
         myMutableString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.black, range: NSRange(location:0,length:messageString.count))
         alert.setValue(myMutableString, forKey: "attributedMessage")
         alert.view.subviews.last?.subviews.first?.backgroundColor = UIColor.white
         alert.view.subviews.last?.subviews.first?.layer.cornerRadius = 15

              
         self.present(alert, animated: true, completion: nil)
        }else{
            let alert = UIAlertController(title: "Welcome!!", message: "Sign up is complete.Branding yourself with Brandiary!!", preferredStyle: .alert)
                  let OKAction = UIAlertAction(title: "Done", style: .default) { (action) in  self.dismiss(animated: true, completion: nil)    }
                    OKAction.setValue(UIColor(displayP3Red: 162/255, green: 32/255, blue: 58/255, alpha: 1), forKey: "titleTextColor")
                          alert.addAction(OKAction)

                       let attributedString = NSAttributedString(string: "Help", attributes: [
                                NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 17), //your font here
                           NSAttributedString.Key.foregroundColor : UIColor.black
                                ])
                                alert.setValue(attributedString, forKey: "attributedTitle")
                   let messageString  = "You asked for help.\n We will check and take action."
                   var myMutableString = NSMutableAttributedString()
                   myMutableString = NSMutableAttributedString(string: messageString as String, attributes: [NSAttributedString.Key.font:UIFont.systemFont(ofSize: 14)])
                   myMutableString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.black, range: NSRange(location:0,length:messageString.count))
                   alert.setValue(myMutableString, forKey: "attributedMessage")
                   alert.view.subviews.last?.subviews.first?.backgroundColor = UIColor.white
                   alert.view.subviews.last?.subviews.first?.layer.cornerRadius = 15

                        
                   self.present(alert, animated: true, completion: nil)
            
        }
        
    }
    @IBOutlet weak var report: UILabel!
    
    @IBOutlet weak var writetext: UITextView!
    @IBOutlet weak var topview: UIView!
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.text = ""
    }
    
    func textViewDidChange(_ textView: UITextView) {
        
        if textView.text == ""{
            
             nextbtn.setTitleColor(UIColor(displayP3Red: 128/255, green: 128/255, blue: 128/255, alpha: 1), for: .normal)
                   nextbtn.isEnabled = false
            
        }else{
            nextbtn.setTitleColor(UIColor(displayP3Red: 162/255, green: 32/255, blue: 58/255, alpha: 1), for: .normal)
                   nextbtn.isEnabled = true
            
        }
      
    }
    
   
    }



extension UIView {

    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
         let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
         let mask = CAShapeLayer()
         mask.path = path.cgPath
         self.layer.mask = mask
    }

}
