//
//  CustomPhoto.swift
//  Brandiary
//
//  Created by young on 2020/01/09.
//  Copyright © 2020 young. All rights reserved.
//

import UIKit
import Photos

class CustomPhoto: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    var photos = [UIImage]()
    let scale = UIScreen.main.scale
    var thumbnailSize = CGSize.zero
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photocount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
          let cell = collection.dequeueReusableCell(withReuseIdentifier: "CustomPhotoCell", for: indexPath) as! CustomPhotoCell
         let asset = allPhotos?.object(at: indexPath.row)
        cell.image.fetchImage(asset: asset!, contentMode: .aspectFit, targetSize: cell.image.frame.size)
        cell.number.isHidden = true
        cell.number.layer.cornerRadius = 10
        cell.number.layer.masksToBounds = true
       
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
           let cell = collection.cellForItem(at: indexPath) as! CustomPhotoCell
        if cell.number.isHidden == true {
            photos.append(cell.image.image!)
            cell.number.isHidden = false
            cell.number.text = "\(photos.count)"
        } else{
            photos.remove(at: indexPath.item)
             cell.number.isHidden = true
        }
        donebtn.backgroundColor = UIColor(displayP3Red: 162/255, green: 32/255, blue: 58/255, alpha: 1)
        donebtn.setTitleColor(UIColor.white, for: .normal)
       
    }
    

    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBOutlet weak var donebtn: UIButton!
    @IBOutlet weak var uploadlabel: UILabel!
    @IBOutlet weak var collection: UICollectionView!
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let write = segue.destination as! WriteNavigationConroller
        print("프리페어\(photos)")
        write.photos = self.photos
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
       
    }

    @IBAction func donebtn(_ sender: Any) {
        
        writeimages = photos
        nextalbum = true
        self.performSegue(withIdentifier: "showwrite", sender: nil)
        print("포토들\(photos)")
        for i in 0...photos.count-1{
            writeimagename.append("\(Date())+\(i)")
            print(writeimagename)
        }
        
    }


    
}

extension UIImageView{
    
 func fetchImage(asset: PHAsset, contentMode: PHImageContentMode, targetSize: CGSize) {
    let scale = UIScreen.main.scale
    let size = CGSize(width: UIScreen.main.bounds.width * scale, height: UIScreen.main.bounds.height * scale)
    let options = PHImageRequestOptions()
    options.version = .original
    options.resizeMode = PHImageRequestOptionsResizeMode.exact
    PHImageManager.default().requestImage(for: asset, targetSize: size, contentMode: contentMode, options: options) { image, _ in
        guard let image = image else { return }
        self.contentMode = .scaleAspectFill
        self.image = image
    }
   }
}
extension CustomPhoto: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: self.collection.bounds.width/3-2, height: self.collection.bounds.width/3)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
}


