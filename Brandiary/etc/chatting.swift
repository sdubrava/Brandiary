//
//  chatting.swift
//  Brandiary
//
//  Created by young on 27/07/2019.
//  Copyright © 2019 young. All rights reserved.
//

import UIKit

class chatting: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBAction func back(_ sender: Any) {
        let view = self.storyboard?.instantiateViewController(withIdentifier: "tabbar")
        //이동할 때 화면 coverVertical로 보여줘
        view?.modalTransitionStyle = UIModalTransitionStyle.flipHorizontal
        self.present(view!, animated: true, completion: nil)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "chattingCell") as! chattingCell
        
        return cell
    }
    

    @IBOutlet weak var Search: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        addtextimage1(text: Search, image: UIImage(named: "graysearch")!)

        // Do any additional setup after loading the view.
    }
    func addtextimage1(text: UITextField,image:UIImage) {
        let padding = 8.5
        //오른쪽에 패딩넣으려면 이거 width를 늘려주면 된다.
        let leftimage = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 25))
        let paddingimage = UIImageView(frame: CGRect(x: padding, y: 0, width: 25, height: 25))
        paddingimage.image = image
        leftimage.addSubview(paddingimage)
        text.leftView = leftimage
        text.leftViewMode = .always
    }//addtextimage
    
    
    @IBOutlet weak var table: UITableView!
    
    
    
 

}
