//
//  WriteNavigationConroller.swift
//  Brandiary
//
//  Created by young on 2020/01/10.
//  Copyright © 2020 young. All rights reserved.
//

import UIKit

class WriteNavigationConroller: UINavigationController {
    
    var photos = [UIImage]()
    override func viewDidLoad() {
        super.viewDidLoad()
        print("네비게이션",photos)
        
        if let rootViewController = viewControllers.first as? write {
            rootViewController.photos = self.photos
        }

    }
    


}
