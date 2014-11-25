//
//  AprovedLesson2View.swift
//  PerfectPhoto
//
//  Created by Reinaldo Verdugo on 24/11/14.
//  Copyright (c) 2014 ___PruebaCorp___. All rights reserved.
//

import UIKit
import Photos

class AprovedLesson2View: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    
    
    @IBAction func yesButton(sender: UIButton) {
        self.performSegueWithIdentifier("gotoGallery", sender: self)
    }
    
    var original : UIImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = original
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if (segue.identifier == "gotoGallery") {
            let controller : ViewGallery = segue.destinationViewController as ViewGallery
            
            controller.newPhotoFound = true
            controller.newPhoto = original
        }
    }
}
