//
//  ViewGallery.swift
//  PerfectPhoto
//
//  Created by Reinaldo Verdugo on 04/11/14.
//  Copyright (c) 2014 ___PruebaCorp___. All rights reserved.
//

import UIKit
import Photos

let reuseIdentifier = "PhotoCell"
let albumName = "PerfectPhoto"

class ViewGallery: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var albumFound : Bool = false   // Variable que nos dirá si se consiguió algún álbum con ese nombre
    var assetCollection: PHAssetCollection!
    var photoAsset: PHFetchResult!  // Arreglo que contendrá las fotos contenidas en el album

    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Chequeamos si la carpeta de la aplicación ya existe.
        // Si no existe, la creamos
        
        // Creamos las opciones de búsqueda para tratar de conseguir un album con el nombre de albunName (PerfectPhoto)
        let fetchOptions = PHFetchOptions()
        fetchOptions.predicate = NSPredicate(format: "title = %@", albumName)
        
        // El resultado de la búsqueda lo guardaremos en la variable 'collection'
        let collection = PHAssetCollection.fetchAssetCollectionsWithType(.Album, subtype: .Any, options: fetchOptions)
        
        // Si conseguimos el album
        if (collection.firstObject != nil) {
            
            // Conseguimos el album
            self.albumFound = true
            self.assetCollection = collection.firstObject as PHAssetCollection
        
        // Si no lo conseguimos
        } else {
            
            // Creamos el album
            NSLog("\nEl album \"%@\" no existe\nCreando ahora... ", albumName)
            PHPhotoLibrary.sharedPhotoLibrary().performChanges({
                
                // Nuestro request será crear un album con el titulo de albumName
                let request = PHAssetCollectionChangeRequest.creationRequestForAssetCollectionWithTitle(albumName)
                
                },
                completionHandler: {(success:Bool, error:NSError!) in
                    NSLog("Creacion del album -> %@", (success ? "Exitosa": "Error!"))
                    self.albumFound = (success ? true:false)
                })
        }
        
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        if (appDelegate.newImageFound == true) {
            appDelegate.newImageFound = false
            PHPhotoLibrary.sharedPhotoLibrary().performChanges({
                let createAssetRequest = PHAssetChangeRequest.creationRequestForAssetFromImage(appDelegate.newImage)
                let assetPlaceholder = createAssetRequest.placeholderForCreatedAsset
                let albumChangeRequest = PHAssetCollectionChangeRequest(forAssetCollection: self.assetCollection, assets: self.photoAsset)
                albumChangeRequest.addAssets([assetPlaceholder])
                }, completionHandler: {(success, error) in
                    NSLog("Adding Image to Library -> %@", (success ? "Sucess":"Error!"))
            })

        }
    }

    override func viewWillAppear(animated: Bool) {
        // Obtenemos las fotos de la colección
        self.navigationController?.hidesBarsOnTap = false
        self.photoAsset = PHAsset.fetchAssetsInAssetCollection(self.assetCollection, options: nil)
        
        // Manejar el caso en que no hayan fotos
        
        self.collectionView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "viewLarge") {
            let controller : ViewPhoto = segue.destinationViewController as ViewPhoto
            let indexPath : NSIndexPath = self.collectionView.indexPathForCell(sender as UICollectionViewCell)!
            controller.index = indexPath.item
            controller.photoAsset = self.photoAsset
            controller.assetCollection = self.assetCollection
        }
    }

    // Métodos para el UICollectionViewDataSource
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        var count : Int = 0
        if (self.photoAsset != nil) {
            count = self.photoAsset.count
        }
        return count;
    }
    
    // The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
        let cell: PhotoThumbnail = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as PhotoThumbnail
        
        // Modificamos la celda de la foto
        // Obtenemos la foto
        
        let asset : PHAsset = self.photoAsset[indexPath.item] as PHAsset
        
        PHImageManager.defaultManager().requestImageForAsset(asset, targetSize: PHImageManagerMaximumSize, contentMode: .AspectFill, options: nil, resultHandler:
            {(result,info)in
                cell.setThumbnailImage(result)
            })
        
        return cell
    }
    
    // Métodos para el UICollectionViewDelleateFlayout
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 4
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 1
    }
}
