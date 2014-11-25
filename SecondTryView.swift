//
//  SecondTryView.swift
//  PerfectPhoto
//
//  Created by Reinaldo Verdugo on 24/11/14.
//  Copyright (c) 2014 ___PruebaCorp___. All rights reserved.
//

import UIKit
import Photos

class SecondTryView: UIViewController, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    
    var timer = NSTimer()
    var timerCount = 0
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var takePhotoButton: UIButton!
    
    @IBOutlet weak var useThisButton: UIButton!
    
    @IBOutlet weak var takeAnotherButton: UIButton!
    
    @IBOutlet weak var labelView: UILabel!
    
    @IBOutlet weak var label2View: UILabel!
    
    @IBOutlet weak var activity: UIActivityIndicatorView!
    
    
    @IBAction func takePhotoButton(sender: UIButton) {
        // Si la cámara está disponible
        if(UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera)){
            var picker : UIImagePickerController = UIImagePickerController()
            picker.sourceType = UIImagePickerControllerSourceType.Camera
            picker.delegate = self
            picker.allowsEditing = false
            self.presentViewController(picker, animated: true, completion: nil)
            
        } else {
            // No hay cámara disponible
            var alert = UIAlertController(title: "Error", message: "No hay cámara disponible", preferredStyle: .Alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: {(alertAction)in
                //Si decide salir de la lección
                alert.dismissViewControllerAnimated(true, completion: nil)
            }))
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }
    
    
    @IBAction func takeAnotherButton(sender: UIButton) {
        takePhotoButton(sender)
    }
    
    @IBAction func cancelPressed(sender: UIButton) {
        let alert = UIAlertController(title: "¿Estás seguro de que deseas salir?", message: "Perderás todo tu progreso.", preferredStyle: .Alert)
        
        alert.addAction(UIAlertAction(title: "Sí", style: .Default, handler: {(alertAction)in
            //Si decide salir de la lección
            self.performSegueWithIdentifier("Main", sender: self)
        }))
        
        alert.addAction(UIAlertAction(title: "No", style: .Cancel, handler: {(alertAction)in
            //Si decide quedarse en la lección
            alert.dismissViewControllerAnimated(true, completion: nil)
        }))
        self.presentViewController(alert, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        activity.hidden = true
        activity.stopAnimating()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func useThisPressed(sender: UIButton) {
        activity.hidden = false
        activity.startAnimating()
        self.timerCount = 0
        self.timer = NSTimer.scheduledTimerWithTimeInterval(9, target: self, selector: Selector("goNext"), userInfo: nil, repeats: false)
    }
    
    func goNext() {
        activity.stopAnimating()
        self.performSegueWithIdentifier("secondTryFailed", sender: self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingMediaWithInfo info: NSDictionary!){
        let image = info.objectForKey("UIImagePickerControllerOriginalImage") as UIImage
        imageView.image = image
        takePhotoButton.hidden = true
        labelView.hidden = false
        label2View.hidden = false
        takeAnotherButton.hidden = false
        useThisButton.hidden = false
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController!){
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
    
}
