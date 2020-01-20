//
//  alarm.swift
//  Brandiary
//
//  Created by young on 27/07/2019.
//  Copyright © 2019 young. All rights reserved.
//

import UIKit

class alarm: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBAction func back(_ sender: Any) {
         alarmbool = true
        let view = self.storyboard?.instantiateViewController(withIdentifier: "tabbar")
        //이동할 때 화면 coverVertical로 보여줘
        view?.modalTransitionStyle = UIModalTransitionStyle.coverVertical
        self.present(view!, animated: true, completion: nil)
       
    }
    @IBOutlet weak var table: UITableView!
    var alarms: [alarmstruct]?
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fetchAlarms()
        self.navigationController?.navigationItem.backBarButtonItem?.image = UIImage(named: "back.png")
        
       
   
    }

    func fetchAlarms()
    {
        self.alarms = alarmstruct.fetchAlarms()
        self.table.reloadData()
    }


    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = table.dequeueReusableCell(withIdentifier: "AlarmheaderCell") as? AlarmheaderCell
        
       let tap = UITapGestureRecognizer(target: self, action: #selector(alarm.tapFunction))

                //원하는 이미지에 두가지 메소드를 추가
        cell?.contentView.isUserInteractionEnabled = true
        cell?.contentView.addGestureRecognizer(tap)

     
        return cell
    }
@objc func tapFunction(sender:UITapGestureRecognizer) {
        let view = self.storyboard?.instantiateViewController(withIdentifier: "FollowRequests") //해당 스토리보드아이디
        //이동할 때 화면 coverVertical로 보여줘
        view?.modalTransitionStyle = UIModalTransitionStyle.coverVertical
    view?.modalPresentationStyle = .fullScreen
        self.present(view!, animated: true, completion: nil)
         
         
     }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        65
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        65
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let alarms = alarms {
                   return alarms.count
               }
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "alarmCell", for: indexPath) as! alarmCell
        
//        섹션 자리에 있는 포스트를 쓸게
//        cell.alarm = self.alarms?[indexPath.section]
//        cell.selectionStyle = .none
        
        
        return cell
    }

   
}
