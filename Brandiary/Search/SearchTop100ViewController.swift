//
//  SearchTop100ViewController.swift
//  Brandiary
//
//  Created by young on 31/08/2019.
//  Copyright © 2019 young. All rights reserved.
//

import UIKit

class SearchTop100ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate {
    
    
    var received = 0
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "SearchTop100HashCell") as! SearchTop100HashCell
            
             return cell
        
        }


    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = table.dequeueReusableCell(withIdentifier: "SearchTop100HeaderCell") as! SearchTop100HeaderCell
        let colorView = UIView()
                                          colorView.backgroundColor = UIColor(displayP3Red: 238/255, green: 238/255, blue: 238/255, alpha: 1)
                cell.selectedBackgroundView = colorView
        return cell
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 50
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
    

    
    
    @IBAction func back(_ sender: Any) {
    dismiss(animated: true, completion: nil)

    }
    
    
    
    @IBOutlet weak var back: UIBarButtonItem!
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var search: UISearchBar!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(SearchTop100ViewController.close))
            view.addGestureRecognizer(tap)
        tap.numberOfTapsRequired = 2

        search.delegate = self
        let imageView = UIImageView(frame: CGRect(x: 100, y: 0, width: 300, height: 30))
        imageView.contentMode = .scaleAspectFit
        let image = UIImage(named: "logo1.png")
        imageView.image = image
        navigationItem.titleView = imageView
        self.navigationController?.navigationBar.barTintColor = UIColor.white
        ExchangeTagView.isHidden = true
        
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        ExchangeTagView.isHidden = false
        self.search.endEditing(true)
    }
    
    @objc func close() {
        self.search.endEditing(true)
    }

  
    

    
    @IBOutlet weak var ExchangeTagView: UIView!
    
   

}
