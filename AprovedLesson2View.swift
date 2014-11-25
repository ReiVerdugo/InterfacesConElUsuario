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
    
    var original : UIImage = UIImage()
    
    @IBAction func yesButton(sender: UIButton) {
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        appDelegate.newImage = original
        appDelegate.newImageFound = true
        self.performSegueWithIdentifier("goSuccess", sender: self)
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = original
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
