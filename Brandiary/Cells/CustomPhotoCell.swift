//
//  CustomPhotoCell.swift
//  Brandiary
//
//  Created by young on 2020/01/09.
//  Copyright © 2020 young. All rights reserved.
//

import UIKit
import Photos

class CustomPhotoCell: UICollectionViewCell {
    
    @IBOutlet weak var number: UILabel!
    @IBOutlet weak var image: UIImageView!
    fileprivate let imageManager = PHImageManager()
     
}
