//
//  FollowRequestsViewController.swift
//  Brandiary
//
//  Created by young on 14/12/2019.
//  Copyright © 2019 young. All rights reserved.
//

import UIKit

class FollowRequestsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var number = 10
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        number
    }
    
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "FollowRequests") as! FollowRequests
        
        cell.obtn.addTarget(self, action: #selector(obtn(_sender:)), for: .touchUpInside)
        cell.xbtn.addTarget(self, action: #selector(xbtn(_sender:)), for: .touchUpInside)
        cell.obtn.tag = indexPath.row
        cell.xbtn.tag = indexPath.row
        
        return cell
    }
    @objc func xbtn(_sender: UIButton){
        number = number - 1
        
    }
    @objc func obtn(_sender: UIButton){
        number = number - 1
       }
    

    @IBOutlet weak var table: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
