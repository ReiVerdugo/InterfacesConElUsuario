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
    
    @IBAction func btnTrash(sender : AnyObject) {
        let alert = UIAlertController(title: "Borrar Imagen", message: "¿Seguro que deseas borrarla?", preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "Si", style: .Default,
            handler: {(alertAction)in
                PHPhotoLibrary.sharedPhotoLibrary().performChanges({
                    
                    //Si desea eliminar la foto, la borramos
                    let request = PHAssetCollectionChangeRequest(forAssetCollection: self.assetCollection)
                    request.removeAssets([self.photoAsset[self.index]])
                    },
                    completionHandler: {(success, error)in
                        NSLog("\nImagen Borrada -> %@", (success ? "Exitosamente":"Error!"))
                        alert.dismissViewControllerAnimated(true, completion: nil)
                        
                        // Si se logro eliminar la foto con éxito
                        if(success){
                            // Nos movemos al proximo para ejecutar
                            dispatch_async(dispatch_get_main_queue(), {
                                self.photoAsset = PHAsset.fetchAssetsInAssetCollection(self.assetCollection, options: nil)
                                
                                // Si el numero de fotos es igual a 0, quiere decir que se eliminaron todas las fotos
                                if(self.photoAsset.count == 0){
                                    println("¡No quedan mas imagenes!")
                                    self.navigationController?.popToRootViewControllerAnimated(true)
                                    
                                // Si no se eliminaron todas, hay que cambiar la vista y ver la próxima foto
                                } else {
                                    if(self.index >= self.photoAsset.count){
                                        self.index = self.photoAsset.count - 1
                                    }
                                    self.displayPhoto()
                                }
                            })
                        // Si no se logró eliminar con éxito se imprime un error
                        }else{
                            println("Error: \(error)")
                        }
                })
        }))
        alert.addAction(UIAlertAction(title: "No", style: .Cancel, handler: {(alertAction)in
            //Si decide no hacerlo, no borramos la foto
            alert.dismissViewControllerAnimated(true, completion: nil)
        }))
        self.presentViewController(alert, animated: true, completion: nil)
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
