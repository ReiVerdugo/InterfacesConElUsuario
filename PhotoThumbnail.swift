//
//  PhotoThumbnail.swift
//  PerfectPhoto
//
//  Created by Reinaldo Verdugo on 04/11/14.
//  Copyright (c) 2014 ___PruebaCorp___. All rights reserved.
//

import UIKit

class PhotoThumbnail: UICollectionViewCell {
    
    
    
    @IBOutlet weak var imgView: UIImageView!
    
    func setThumbnailImage(thumbnailImage: UIImage){
        self.imgView.image = thumbnailImage
    }
}
