//
//  ViewController.swift
//  Brandiary
//
//  Created by young on 08/10/2019.
//  Copyright © 2019 young. All rights reserved.
//

import UIKit
import Photos



class Tabbar: UITabBarController,UITabBarControllerDelegate {
    

var receiveindex = tabbarindex
   override func viewDidLoad() { // Called when tab bar loads
        super.viewDidLoad()
    self.delegate = self
    
    appdelegate.shouldSupportAllOrientation = false
        self.setupMiddleButton() // Sets up button
        self.tabBar.backgroundColor = UIColor.white
    self.selectedIndex = receiveindex
    tabbarindex = 0
    
    }
    
    

    func setupMiddleButton() {

        let menuButton = UIButton()
        menuButton.backgroundColor = UIColor.clear
        menuButton.setImage(UIImage(named: "write.png"), for: UIControl.State.normal) // 450 x 450px
        menuButton.contentMode = .scaleAspectFit
        menuButton.addTarget(self, action: #selector(Tabbar.menuButtonAction(sender:)), for: UIControl.Event.touchUpInside)
        menuButton.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(menuButton)
          if #available(iOS 13, *){
               let guide = view.safeAreaLayoutGuide
               menuButton.centerXAnchor.constraint(equalTo: guide.centerXAnchor).isActive = true
               menuButton.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
            menuButton.heightAnchor.constraint(equalToConstant:45.0).isActive = true
            menuButton.widthAnchor.constraint(equalToConstant: 45.0).isActive = true

          } else {
               NSLayoutConstraint(item: menuButton, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1.0, constant: 0).isActive = true
               NSLayoutConstraint(item: menuButton, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: 0).isActive = true
               menuButton.heightAnchor.constraint(equalToConstant: 55).isActive = true
               menuButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
                    }


        self.view.layoutIfNeeded()
    }
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        let viewController1: UIViewController? = tabBarController.viewControllers?[1]
           
            switch self.selectedIndex {
            case 1:
                viewController.viewDidLoad()

            default:
                break
            }
    }
    

    @objc func menuButtonAction(sender: UIButton) {
        self.selectedIndex = 2
        sender.isHidden = true
    }
}


