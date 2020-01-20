//
//  Search.swift
//  Brandiary
//
//  Created by young on 31/08/2019.
//  Copyright © 2019 young. All rights reserved.
//

import UIKit


var data = 0
var TypeBool = Bool()


class Search: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UISearchBarDelegate,UIGestureRecognizerDelegate {
    
     
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
  
        if indexPath.row == 0 {
             let cell = collection.dequeueReusableCell(withReuseIdentifier: "SearchCollectionCell", for: indexPath) as! SearchCollectionCell
            return cell

        }
        else{
             let cell = collection.dequeueReusableCell(withReuseIdentifier: "SearchCollectionCell2", for: indexPath) as! SearchCollectionCell2
            return cell
        }
       
        
    }
        


    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {


        let actualPosition = scrollView.panGestureRecognizer.translation(in: scrollView.superview) //스크롤 아래인지 위인지 알아내는 포지션
           if (actualPosition.y > 0){ //아래로 내린 것
        searchheight.constant = 38 //searchbarheight를 38로 바꿈
                  UIView.animate(withDuration: 0.5) { //0.5초 동안 바뀌어라
                      self.view.layoutIfNeeded() //레이아웃 업데이트 해줘
           }
           }
           else{ //반대 위로 올린 것
            searchheight.constant = 0
                             UIView.animate(withDuration: 0.5) {
                                 self.view.layoutIfNeeded()
        }
          
    }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
     


        if indexPath.row == 0{
            top100view.isHidden = false
            storeitem.image = UIImage(named: "back1.png")
        }
        
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
                   ExchangeView.isHidden = false
                   storeitem.image = UIImage(named: "back1.png")
        self.searchbar.endEditing(true)
        
    }
    
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
       if searchbar.text == ""{
        NotificationCenter.default.post(name: NSNotification.Name("Notification"), object: nil)
                    }

    }
    
    @IBOutlet weak var storeitem: UIBarButtonItem!
    
    @IBOutlet weak var top100view: UIView!
    
    @IBAction func storeitem(_ sender: Any) {
        if storeitem.image == UIImage(named: "back1.png"){
            top100view.isHidden = true
            ExchangeView.isHidden = true
            searchbar.text = ""
            storeitem.image = UIImage(named: "store.png")
        }else{
            tabbarindex = 1
            let view = self.storyboard?.instantiateViewController(withIdentifier: "Store")
                                                         //이동할 때 화면 coverVertical로 보여줘
                                                         view?.modalTransitionStyle = UIModalTransitionStyle.coverVertical
            view?.modalPresentationStyle = .fullScreen
                                                         self.present(view!, animated: true, completion: nil)
            
        }
    }
    @IBOutlet weak var setting: UIBarButtonItem!
    @IBAction func setting(_ sender: Any) {
        tabbarindex = 1
        let view = self.storyboard?.instantiateViewController(withIdentifier: "SearchSetting")
        view?.modalTransitionStyle = UIModalTransitionStyle.coverVertical
        view?.modalPresentationStyle = .fullScreen
        self.present(view!, animated: true, completion: nil)
    }
    @IBOutlet weak var ExchangeView: UIView!
    
    @IBOutlet weak var searchbar: UISearchBar!
    
    @IBOutlet weak var searchheight: NSLayoutConstraint!
    @IBOutlet weak var collection: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(Search.notifiactionFired(_:)), name: NSNotification.Name("Search"), object: nil)
        searchbar.text = ""
        let imageView = UIImageView(frame: CGRect(x: 100, y: 0, width: 300, height: 30))
        imageView.contentMode = .scaleAspectFit
        let image = UIImage(named: "titlelogo.png")
        imageView.image = image
        navigationItem.titleView = imageView
        
        top100view.isHidden = true
        
        self.navigationController?.navigationBar.barTintColor = UIColor.white
        searchbar.delegate = self
        ExchangeView.isHidden = true
           }
    @objc func notifiactionFired(_ notification:Notification) {
        self.viewDidLoad()
    }
    
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
     if touch.view?.isDescendant(of: self.collection) == true {
            return false
        }
        return true
    }

 
    
}






//콜렌션뷰 셀 사이 간격 없애주기
extension Search: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: self.collection.bounds.width/3, height: self.collection.bounds.width/3)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
}

