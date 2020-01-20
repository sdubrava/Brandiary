//
//  write.swift
//  Brandiary
//
//  Created by young on 27/07/2019.
//  Copyright © 2019 young. All rights reserved.
//

import UIKit
import AVFoundation
import CoreMedia
import CoreServices
import FirebaseStorage


var receiveplacetext = String()
var receiveusertext = String()
var writeimages2 = [UIImage]()
var writeimages = [UIImage]()
var nextperson = Bool()
var nextlocation = Bool()
var nextalbum = Bool()
var writeimageurl = [String]()
var writecaption = String()
var writeimagename = [String]()
class write: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate,UITableViewDataSource,UITableViewDelegate,UICollectionViewDelegate,UICollectionViewDataSource,UITextViewDelegate{
    
    var photos = [UIImage]()
    var pickimage = UIImage()
    var personcount = 0
    var mapcount = 0
    let imagePickerController1 = UIImagePickerController()
    var videoURL: NSURL?
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return writeimages.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WriteCollectionCell2", for: indexPath) as! WriteCollectionCell2
        cell.pickimage.image = writeimages[indexPath.row]

        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        if writeimagesarray.count <= 2{
        return writeimagesarray.count+1
        }else{
            return 3
        }
        
    }
   
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.text = ""
        textView.textColor = UIColor.black
        }
    
    func textViewDidChange(_ textView: UITextView) {
        writecaption = textView.text
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
             let cell = table.dequeueReusableCell(withIdentifier: "WritefirstCell") as! WritefirstCell
                    if writecaption != ""{
                        cell.textview.text = writecaption
                        cell.textview.textColor = UIColor.black
                    }
                    else{
                        cell.textview.text = "Please enter the contents"
                        cell.textview.textColor = UIColor(displayP3Red: 197/255, green: 197/255, blue: 197/255, alpha: 1)
                               }
                    cell.profile.layer.cornerRadius = 10
                    cell.profile.layer.masksToBounds = true
                    cell.textview.delegate = self
//                     cell.name.text = "Fomagran"
            //        cell.name.text = UserDefaults.standard.string(forKey: "name")
                          let url = URL(string: UserDefaults.standard.string(forKey: "profile") ?? "")
                              if url != nil{
                                cell.profile.kf.setImage(with: url)
                              }
               
                               return cell
        }else{
            let cell = table.dequeueReusableCell(withIdentifier: "WriteCellx") as! WriteCellx
            cell.xbtn.addTarget(self, action: #selector(write.xbtn(_sender:)), for: .touchUpInside)
        if writeimagesarray.count < 2{
        if indexPath.row == 1{
            cell.img.image = writeimagesarray[0]
            cell.label.text = writetextsarray[0]
        }
        }else {
             if indexPath.row == 1{
        cell.img.image = UIImage(named: "pinNon.png")
                cell.label.text = receiveplacetext
             } else{
                cell.img.image = UIImage(named: "personNon@3x.png")
                cell.label.text = receiveusertext
            }
        }
        cell.xbtn.tag = indexPath.row
        
            return cell
        }

    }
    
    @objc func xbtn(_sender:UIButton){
        let index = _sender.tag
        if writeimagesarray.count < 2{
            writeimagesarray.removeAll()
            writetextsarray.removeAll()
            print(writeimagesarray)
            gomap.setImage(UIImage(named: "pinNon@3x.png")!, for: .normal)
            person.setImage(UIImage(named: "personNon@3x.png")!, for: .normal)
        } else {
            if writeimagesarray[0] == UIImage(named: "personNon@3x.png"){
                    if index == 0 {
                    writeimagesarray.removeFirst()
                    writetextsarray.removeFirst()
                    person.setImage(UIImage(named: "personNon@3x.png")!, for: .normal)
                    nextperson = false
                        
                    } else{
                        writeimagesarray.removeLast()
                        writetextsarray.removeLast()
     
                        gomap.setImage(UIImage(named: "pinNon@3x.png")!, for: .normal)
                        nextlocation = false
                    }
            }

                else{

                    if index == 0 {
                                     writeimagesarray.removeFirst()
                                     writetextsarray.removeFirst()
                                    gomap.setImage(UIImage(named: "pinNon@3x.png")!, for: .normal)
                        nextlocation = false
                                     } else{

                                         writeimagesarray.removeLast()
                                         writeimagesarray.removeLast()

                        person.setImage(UIImage(named: "personNon@3x.png")!, for: .normal)
                         nextperson = false
                                     }
            }

                 
           
    }
        table.reloadData()
    }
     
       
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0{
            if nextalbum == true{
                       return 460
                   }else{
                       return 200
                   }
        } else{
           return 45
        }
    }
    @objc func nextpeople(){
        table.reloadData()
        person.setImage(UIImage(named: "mypageOn@3x.png")!, for: .normal)
    }
    @objc func nextmap(){
        table.reloadData()
        gomap.setImage(UIImage(named: "pinOn@3x.png")!, for: .normal)
    }
    @objc func reload(){
        table.reloadData()
        print("reload")
    }
 
    
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var nextbtn: UIButton!
    @IBOutlet weak var back: UIBarButtonItem!
    @IBOutlet weak var person: UIButton!
    @IBOutlet weak var gomap: UIButton!
    @IBOutlet weak var album: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(write.reload), name: NSNotification.Name("back"), object: nil)
         NotificationCenter.default.addObserver(self, selector: #selector(write.nextmap), name: NSNotification.Name("nextlocation"), object: nil)
         NotificationCenter.default.addObserver(self, selector: #selector(write.nextpeople), name: NSNotification.Name("nextperson"), object: nil)
      
        person.setImage(UIImage(named: "personNon@3x.png")!, for: .normal)
        gomap.setImage(UIImage(named: "pinNon@3x.png")!, for: .normal)
        
        nextbtn.isEnabled = false

        self.nextbtn.backgroundColor = UIColor(displayP3Red: 238/255, green: 238/255, blue: 238/255, alpha: 1)
        self.nextbtn.setTitleColor(UIColor(displayP3Red: 148/255, green: 148/255, blue: 148/255, alpha: 1), for: .normal)

        self.tabBarController?.tabBar.isHidden = true
        self.navigationController?.navigationItem.title = "WRITE"
        
        if nextalbum == true{
            album.setImage(UIImage(named: "photoOn@3x.png"), for: .normal)
               self.nextbtn.backgroundColor = UIColor(displayP3Red: 162/255, green: 32/255, blue: 58/255, alpha: 1)
            self.nextbtn.setTitleColor(UIColor.white, for: .normal)
                           nextbtn.isEnabled = true
        } else{
             album.setImage(UIImage(named: "photoNon.png"), for: .normal)
            
        }
        if nextlocation == true {
            gomap.setImage(UIImage(named: "pinOn@3x.png")!, for: .normal)
        }
        if nextperson == true {
            person.setImage(UIImage(named: "mypageOn@3x.png")!, for: .normal)
        }
        if nextperson == true && nextlocation == true {
            self.nextbtn.backgroundColor = UIColor(displayP3Red: 162/255, green: 32/255, blue: 58/255, alpha: 1)
                self.nextbtn.setTitleColor(UIColor.white, for: .normal)
                nextbtn.isEnabled = true
        }

        
    }
    @IBAction func next(_ sender: Any) {
        let view = self.storyboard?.instantiateViewController(withIdentifier: "Writefinal")
        view?.modalTransitionStyle = UIModalTransitionStyle.coverVertical
        self.present(view!, animated: true, completion: nil)
        
    }
    
    @IBAction func back(_ sender: Any) {
        
        let view = self.storyboard?.instantiateViewController(withIdentifier: "tabbar")
        view?.modalTransitionStyle = UIModalTransitionStyle.coverVertical
        self.present(view!, animated: true, completion: nil)

        writeimagesarray.removeAll()
        writeimages.removeAll()
        nextlocation = false
        nextperson = false
        nextalbum = false
        writetextsarray.removeAll()
        self.nextbtn.backgroundColor = UIColor(displayP3Red: 238/255, green: 238/255, blue: 238/255, alpha: 1)
        self.nextbtn.setTitleColor(UIColor(displayP3Red: 148/255, green: 148/255, blue: 148/255, alpha: 1), for: .normal)
        nextbtn.isEnabled = false
        writecaption = ""
    }
    
    @objc func media(_ sender: UITapGestureRecognizer) {
        
        imagePickerController1.sourceType = .savedPhotosAlbum
        imagePickerController1.delegate = self
        imagePickerController1.mediaTypes = [kUTTypeMovie as String]
        present(imagePickerController1, animated: true, completion: nil)
        
    }
    
    
    @objc func loadImg(_ sender: UITapGestureRecognizer) {
        
        let view = self.storyboard?.instantiateViewController(withIdentifier: "CustomPhoto")
        view?.modalTransitionStyle = .coverVertical
        view?.modalPresentationStyle = .fullScreen
        present(view!, animated: true, completion: nil)
        
//        let picker = UIImagePickerController()
//        picker.delegate = self
//        picker.sourceType = .photoLibrary
//        picker.allowsEditing = true
//        picker.modalPresentationStyle = .fullScreen
//        present(picker, animated: true, completion: nil)

    }
    
    func getThumbnailImage(forUrl url: URL) -> UIImage? {
        let asset: AVAsset = AVAsset(url: url)
        let imageGenerator = AVAssetImageGenerator(asset: asset)
        
        do {
            let thumbnailImage = try imageGenerator.copyCGImage(at: CMTimeMake(value: 1, timescale: 60) , actualTime: nil)
            return UIImage(cgImage: thumbnailImage)
        } catch let error {
            print(error)
        }
        
        return nil
    }
    
    
    
    internal func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        table.reloadData()
        picker.dismiss(animated: false, completion: nil)
    }
    
    internal func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {

            if let editedImage = info[.editedImage] as? UIImage{
            pickimage = editedImage
            picker.dismiss(animated: false)
            writeimages.append(pickimage)
            writeimages2.append(pickimage)
            self.nextbtn.backgroundColor = UIColor(displayP3Red: 162/255, green: 32/255, blue: 58/255, alpha: 1)
            self.nextbtn.setTitleColor(UIColor.white, for: .normal)
            nextbtn.isEnabled = true
                NotificationCenter.default.post(name: NSNotification.Name("imagepick"), object: nil)
            nextalbum = true
            album.setImage(UIImage(named: "photoOn@3x.png"), for: .normal)
            table.reloadData()
            
        }

    }
  
}

