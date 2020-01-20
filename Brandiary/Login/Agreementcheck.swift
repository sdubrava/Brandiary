//
//  Agreementcheck.swift
//  Brandiary
//
//  Created by young on 30/11/2019.
//  Copyright © 2019 young. All rights reserved.
//

import UIKit

class Agreementcheck: UIViewController {
    
    var checkbool1 = false
    var checkbool2 = false
    var checkbool3 = false
    var checkbool4 = false
    
    @IBOutlet weak var nextbtn: UIButton!
    @IBOutlet weak var backbtn: UIButton!
    @IBOutlet weak var check4: UIImageView!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var check3: UIImageView!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var check2: UIImageView!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var check1: UIImageView!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var checkview: UIView!
    @IBOutlet weak var logo: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        appdelegate.shouldSupportAllOrientation = false
        
        let wholeStr = "I agree to the collection and use of personal information.(required)"
        //let rangeToUnderLine = NSRange(location: 0, length: 10))
        let rangeToUnderLine = (wholeStr as NSString).range(of: "collection and use of personal")
        let underLineTxt = NSMutableAttributedString(string: wholeStr, attributes: [NSAttributedString.Key.font:UIFont.systemFont(ofSize: 10),NSAttributedString.Key.foregroundColor: UIColor(displayP3Red: 148/255, green: 148/255, blue: 148/255, alpha: 148/255)])
        underLineTxt.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: rangeToUnderLine)
           label3.attributedText = underLineTxt
        
        let wholeStr1 = "I agree to the Terms of Service.(required)"
        //let rangeToUnderLine = NSRange(location: 0, length: 10))
        let rangeToUnderLine1 = (wholeStr1 as NSString).range(of: "Terms of Service.")
        let underLineTxt1 = NSMutableAttributedString(string: wholeStr1, attributes: [NSAttributedString.Key.font:UIFont.systemFont(ofSize: 10),NSAttributedString.Key.foregroundColor: UIColor(displayP3Red: 148/255, green: 148/255, blue: 148/255, alpha: 148/255)])
        underLineTxt1.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: rangeToUnderLine1)
           label2.attributedText = underLineTxt1

        nextbtn.backgroundColor = UIColor(red:217/255, green:217/255, blue:217/255, alpha: 1)
                      nextbtn.isEnabled = false
        
        backbtn.layer.borderWidth = 1
        backbtn.layer.borderColor = UIColor(displayP3Red: 217/255, green: 217/255, blue: 217/255, alpha: 1).cgColor
        backbtn.layer.cornerRadius = 5
        backbtn.layer.masksToBounds = true
        nextbtn.layer.cornerRadius = 5
        nextbtn.layer.masksToBounds = true
        
        
        let agreementtap = UITapGestureRecognizer(target: self, action: #selector(Agreementcheck.agreement))
                                       label3.isUserInteractionEnabled = true
                                       label3.addGestureRecognizer(agreementtap)
        
        let tap1 = UITapGestureRecognizer(target: self, action: #selector(Agreementcheck.tap1))
                                check1.isUserInteractionEnabled = true
                                check1.addGestureRecognizer(tap1)
        let tap2 = UITapGestureRecognizer(target: self, action: #selector(Agreementcheck.tap2))
                                       check2.isUserInteractionEnabled = true
                                       check2.addGestureRecognizer(tap2)
        let tap3 = UITapGestureRecognizer(target: self, action: #selector(Agreementcheck.tap3))
                                              check3.isUserInteractionEnabled = true
                                              check3.addGestureRecognizer(tap3)
        let tap4 = UITapGestureRecognizer(target: self, action: #selector(Agreementcheck.tap4))
                                              check4.isUserInteractionEnabled = true
                                              check4.addGestureRecognizer(tap4)

    }
    
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @objc func agreement(){
        let view = self.storyboard?.instantiateViewController(withIdentifier: "Agreement")
                     //이동할 때 화면 coverVertical로 보여줘
                     view?.modalTransitionStyle = UIModalTransitionStyle.coverVertical
                        view?.modalPresentationStyle = .fullScreen
                     self.present(view!, animated: true, completion: nil)
    }
    
    
    @objc func tap1(){
        
        if check1.image == UIImage(named: "checkboxOn@3x.png") {
            check1.image = UIImage(named: "checkboxNon.png")
            checkbool1 = false
        }else{
            check1.image = UIImage(named: "checkboxOn@3x.png")
            checkbool1 = true
        }
        if checkbool1 == true && checkbool2 == true && checkbool3 == true {
            nextbtn.backgroundColor = UIColor(red:162/255, green:32/255, blue:58/255, alpha: 1)
                                 nextbtn.isEnabled = true
        }else{
            nextbtn.backgroundColor = UIColor(red:217/255, green:217/255, blue:217/255, alpha: 1)
                                 nextbtn.isEnabled = false
        }
        
      
        
    }
    @objc func tap2(){
           
             if check2.image == UIImage(named: "checkboxOn@3x.png") {
                     check2.image = UIImage(named: "checkboxNon.png")
                checkbool2 = false
                 }else{
                     check2.image = UIImage(named: "checkboxOn@3x.png")
                checkbool2 = true
                 }
        if checkbool1 == true && checkbool2 == true && checkbool3 == true {
            nextbtn.backgroundColor = UIColor(red:162/255, green:32/255, blue:58/255, alpha: 1)
                                 nextbtn.isEnabled = true
        }else{
            nextbtn.backgroundColor = UIColor(red:217/255, green:217/255, blue:217/255, alpha: 1)
                                 nextbtn.isEnabled = false
        }
           
       }
    @objc func tap3(){
           
            if check3.image == UIImage(named: "checkboxOn@3x.png") {
                     check3.image = UIImage(named: "checkboxNon.png")
                checkbool3 = false
                 }else{
                     check3.image = UIImage(named: "checkboxOn@3x.png")
                checkbool3 = true
                 }
        if checkbool1 == true && checkbool2 == true && checkbool3 == true {
            nextbtn.backgroundColor = UIColor(red:162/255, green:32/255, blue:58/255, alpha: 1)
                                 nextbtn.isEnabled = true
        }else{
            nextbtn.backgroundColor = UIColor(red:217/255, green:217/255, blue:217/255, alpha: 1)
                                 nextbtn.isEnabled = false
        }
           
       }
    @objc func tap4(){
           
            if check4.image == UIImage(named: "checkboxOn@3x.png") {
                     check4.image = UIImage(named: "checkboxNon.png")
                checkbool4 = false
                 }else{
                     check4.image = UIImage(named: "checkboxOn@3x.png")
                checkbool4 = true
                 }
           
       }

}


