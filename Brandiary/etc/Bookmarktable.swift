//
//  Bookmarktable.swift
//  Brandiary
//
//  Created by young on 06/08/2019.
//  Copyright © 2019 young. All rights reserved.
//

import UIKit

class Bookmarktable: UIViewController,UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "bookmarktablecell") as! bookmarktableCell
        
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var table: UITableView!
    


}
