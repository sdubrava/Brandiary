//
//  Editprofileinform.swift
//  Brandiary
//
//  Created by young on 17/10/2019.
//  Copyright © 2019 young. All rights reserved.
//

import UIKit

class Editprofileinform: UIViewController,UITextViewDelegate {

   
    @IBOutlet weak var textlabel: UILabel!
    @IBOutlet weak var textview: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        textview.delegate = self
    
       
    }
    
    func textViewDidChange(_ textView: UITextView) {
        if textview.text == ""{
            textlabel.isHidden = false
        }
        else {
            textlabel.isHidden = true
        }
        UserDefaults.standard.setValue(textView.text!, forKey: "\(UserDefaults.standard.string(forKey: "name") ?? "")inform")
     NotificationCenter.default.post(name: NSNotification.Name("informtext"), object: nil)
    
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){

             self.view.endEditing(true)
           
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
