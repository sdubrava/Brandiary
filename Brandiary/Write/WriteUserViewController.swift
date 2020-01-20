//
//  WriteUserViewController.swift
//  Brandiary
//
//  Created by young on 21/09/2019.
//  Copyright © 2019 young. All rights reserved.
//

import UIKit

var writeimagesarray = [UIImage]()
var writetextsarray = [String]()
var selectnumber = Int()


class WriteUserViewController: UIViewController ,UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate{
    
    
    var writeimage = UIImage()
    var writetext = String()
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        65
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = table.dequeueReusableCell(withIdentifier: "WriteUserCell") as! WriteUserCell
        let colorView = UIView()
                                    colorView.backgroundColor = UIColor(displayP3Red: 238/255, green: 238/255, blue: 238/255, alpha: 1)
          cell.selectedBackgroundView = colorView
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
          
          updateCount()
        
//          let indexPath = table.indexPathForSelectedRow!
//          let currentCell = table.cellForRow(at: indexPath)! as! WriteUserCell
          
//          let celltext = currentCell.name.text

           self.nextbtn.backgroundColor = #colorLiteral(red: 0.7031922936, green: 0.2011226714, blue: 0.2912405133, alpha: 1)
          self.nextbtn.setTitleColor(UIColor.white, for: .normal)
      }
    
   
    

    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        table.isHidden = false
    }
    
    @IBOutlet weak var searchbar: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        table.isHidden = true
        searchbar.delegate = self
        self.nextbtn.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.968627451, alpha: 1)
        self.nextbtn.setTitleColor(#colorLiteral(red: 0.7370592952, green: 0.7370767593, blue: 0.7370672822, alpha: 1), for: .normal)

        // Do any additional setup after loading the view.
    }
    
    @IBAction func back(_ sender: Any) {
       NotificationCenter.default.post(name: NSNotification.Name("back"), object: nil)
      dismiss(animated: true, completion: nil)
       
    }
    @IBOutlet weak var table: UITableView!
    
    @IBOutlet weak var nextbtn: UIButton!
    @IBAction func nextbtn(_ sender: Any) {
        writeimage = UIImage(named: "personNon@3x.png")!
        writetext = "with chacha 등 "+"\(selectnumber)"+"명"
        receiveusertext = writetext
        writeimagesarray.append(writeimage)
        writetextsarray.append(writetext)
        nextperson = true
        print(writeimagesarray)
       NotificationCenter.default.post(name: NSNotification.Name("nextperson"), object: nil)
         let view = self.storyboard?.instantiateViewController(withIdentifier: "write")
                        view?.modalTransitionStyle = UIModalTransitionStyle.coverVertical
               view?.modalPresentationStyle = .fullScreen
              self.present(view!, animated: true, completion: nil)
        

        
    }
    
    //탭한 수 세기
    func updateCount(){
        if let list = table.indexPathsForSelectedRows as [NSIndexPath]? {
            print("\(list.count)")
            selectnumber = list.count
        }
    }
 
    
}
