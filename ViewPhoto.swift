//
//  ViewPhoto.swift
//  PerfectPhoto
//
//  Created by Reinaldo Verdugo on 04/11/14.
//  Copyright (c) 2014 ___PruebaCorp___. All rights reserved.
//

import UIKit
import Photos

class ViewPhoto: UIViewController {
    
    var assetCollection: PHAssetCollection!
    var photoAsset: PHFetchResult!  // Arreglo que contendrá las fotos contenidas en el album
    var index : Int = 0
    
    @IBOutlet weak var imgView: UIImageView!
    
    @IBAction func btnExport(sender: UIBarButtonItem) {
    }
    
    @IBAction func btnTrash(sender: UIBarButtonItem) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func viewWillAppear(animated: Bool) {
        self.navigationController?.hidesBarsOnTap = true
        self.displayPhoto()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func displayPhoto() {
        let imageManager = PHImageManager.defaultManager()
        var ID = imageManager.requestImageForAsset(self.photoAsset[self.index] as PHAsset, targetSize: PHImageManagerMaximumSize, contentMode: .AspectFit, options: nil, resultHandler: {
            (result, info)->Void in
            self.imgView.image = result
        })
    }
}
