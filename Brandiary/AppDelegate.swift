//
//  AppDelegate.swift
//  Brandiary
//
//  Created by young on 13/07/2019.
//  Copyright © 2019 young. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces
import GoogleSignIn
import FirebaseCore
import Firebase
import FBSDKLoginKit
import FBSDKCoreKit
import TwitterKit
import Kingfisher
import Photos

var allPhotos : PHFetchResult<PHAsset>? = nil
var allMedia : PHFetchResult<PHAsset>? = nil
var photocount = Int()


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate,GIDSignInDelegate{
    var window: UIWindow?
    var shouldSupportAllOrientation = true
    
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {

                if shouldSupportAllOrientation == true{

                      //  모든방향 회전 가능
                    return UIInterfaceOrientationMask.all

                }
                 //  세로방향으로 고정.
                return UIInterfaceOrientationMask.portrait

    }

    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let fetchOptions = PHFetchOptions()
                     fetchOptions.includeAssetSourceTypes = [.typeCloudShared, .typeiTunesSynced]
                     allMedia = PHAsset.fetchAssets(with: .unknown, options: fetchOptions)
        
        PHPhotoLibrary.requestAuthorization { (status) in
                                        switch status {
                                        case .authorized:
                                            print("Good to proceed")
                                            let fetchOptions = PHFetchOptions()
                                            allPhotos = PHAsset.fetchAssets(with: .image, options: fetchOptions)
                                            photocount = allPhotos?.count ?? 0
                                        case .denied, .restricted:
                                            print("Not allowed")
                                        case .notDetermined:
                                            print("Not determined yet")
                                        @unknown default:
                                            print("error")
                                        }
                                    }
        

        
        FirebaseApp.configure()
        TWTRTwitter.sharedInstance().start(withConsumerKey: "SfzVDI0EhcJhGB9I8u56d4azK", consumerSecret: "JTchzxCr5N9OFGTYjaU2NCBQesWidV9IY0zj56WWIWHWRbudBO")
        GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID
        GIDSignIn.sharedInstance().delegate = self
        ApplicationDelegate.shared.application(application, didFinishLaunchingWithOptions: launchOptions)
        //구글 맵
        GMSServices.provideAPIKey("AIzaSyCdiD2abSEmXjJ5N1tfdK2Hr1qOaOP4J6I")
        GMSPlacesClient.provideAPIKey("AIzaSyCdiD2abSEmXjJ5N1tfdK2Hr1qOaOP4J6I")
        
        var initialViewController: UIViewController?
                 let mainStoryboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
              if UserDefaults.standard.bool(forKey: "Login") == true{
                     initialViewController = mainStoryboard.instantiateViewController(withIdentifier: "tabbar")
                 } else {
                     initialViewController = mainStoryboard.instantiateViewController(withIdentifier: "LoginView")
                 }
                 self.window = UIWindow(frame: UIScreen.main.bounds)
                 self.window?.rootViewController = initialViewController
                 self.window?.makeKeyAndVisible()
        return true
    
    }
    
  @available(iOS 9.0, *)
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any]) -> Bool {
      let google =  GIDSignIn.sharedInstance().handle(url)
    let facebook = ApplicationDelegate.shared.application(app, open: url, sourceApplication: options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String, annotation: options[UIApplication.OpenURLOptionsKey.annotation]);
     let twitter = TWTRTwitter.sharedInstance().application(app, open: url, options: options)
    
    return google || facebook || twitter
    }
    
     func application(_ application: UIApplication,open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
          let googleDidHandle = GIDSignIn.sharedInstance().handle(url)

        let facebook = ApplicationDelegate.shared.application(application, open: url, sourceApplication: sourceApplication, annotation: annotation)
    
     return googleDidHandle || facebook
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error?) {
      // ...
        if error != nil {
            
        return
      }

   guard let authentication = user.authentication else { return }
        let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
                                                          accessToken: authentication.accessToken)
        
        Auth.auth().signIn(with: credential) { (authResult, error) in
       if (error == nil) {
              // Perform any operations on signed in user here.
              let userId = user.userID                  // For client-side use only!
              let idToken = user.authentication.idToken // Safe to send to the server
              let fullName = user.profile.name
              let givenName = user.profile.givenName
              let familyName = user.profile.familyName
              let email = user.profile.email
       guard let window = UIApplication.shared.keyWindow else {
            return
        }

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "tabbar")

        // Set the new rootViewController of the window.
        // Calling "UIView.transition" below will animate the swap.
        window.rootViewController = vc

        // A mask of options indicating how you want to perform the animations.
        let options: UIView.AnimationOptions = .transitionCrossDissolve

        // The duration of the transition animation, measured in seconds.
        let duration: TimeInterval = 0.3

        // Creates a transition animation.
        // Though `animations` is optional, the documentation tells us that it must not be nil. ¯\_(ツ)_/¯
        UIView.transition(with: window, duration: duration, options: options, animations: {}, completion:
        { completed in
            // maybe do something on completion here
        })
             
        print("\(userId ?? "")","\(idToken ?? "")","\(fullName ?? "")","\(givenName ?? "")","\(familyName ?? "")","\(email ?? "")")
        
          } else {
        print("\(String(describing: error))")
          }
            return
          }
          // User is signed in
          // ...
        }
        // ...
      }
      func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
          // Perform any operations when the user disconnects from app here.
          // ...
      }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }




